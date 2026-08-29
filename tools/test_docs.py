#!/usr/bin/env python3
"""Structural tests for the docs pack (assets/docs/).

Run after tools/update_docs.sh, and before every release:
    python tools/test_docs.py
    python tools/test_docs.py --xml tools/.cache/godot/doc/classes   # full checks

Two tiers:
  - pack-only checks (always): index.json validity, file presence, per-file
    header/signature sanity, BBCode leakage outside code spans.
  - source-parity checks (with --xml, requires the pipeline cache): every
    member/signal/constant/... in the engine XML appears exactly once in the
    generated markdown; regeneration is deterministic.

Exit codes: 0 pass / 1 test failures / 2 usage or environment error.
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "assets" / "docs"

failures: list[str] = []


def check(ok: bool, label: str, detail: str = "") -> None:
    if not ok:
        failures.append(f"{label}: {detail}" if detail else label)


# ---------------------------------------------------------------------------
# pack-only checks
# ---------------------------------------------------------------------------

def strip_code_spans(text: str) -> str:
    """Remove fenced code blocks and inline code so BBCode-looking literals
    inside them (array[i], [url] demos) don't count as leakage."""
    text = re.sub(r"```[^\n]*\n.*?```", "", text, flags=re.DOTALL)
    text = re.sub(r"`[^`\n]*`", "", text)
    return text


BBCODE_LEAK_RE = re.compile(
    r"\[/?(?:b|i|u|s|code|kbd|url|img|center|font|color|codeblock|codeblocks|"
    r"gdscript|csharp|br|lb|method|member|signal|constant|enum|param|"
    r"annotation|theme_item)(?:[= ][^\]]*)?\]"
)
# [Name] is a leak only when standalone: preceded by a non-letter (excludes our own
# Array[T] / BitField[T] type syntax) and not followed by "(" (markdown link).
CLASSREF_LEAK_RE = re.compile(r"(?<![A-Za-z])\[[A-Z][A-Za-z0-9_]*\](?!\()")


def check_pack() -> None:
    index_path = DOCS / "index.json"
    check(index_path.is_file(), "index.json exists")
    if not index_path.is_file():
        return
    try:
        index = json.loads(index_path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        check(False, "index.json is valid JSON", str(exc))
        return

    check(index.get("schema") == 1, "index.json schema == 1")
    for field_name in ("godot_version", "upstream_commit", "generated_at"):
        check(bool(index.get(field_name)), f"index.json has {field_name}")
    classes = index.get("classes", [])
    check(bool(classes), "index.json classes non-empty")
    check(index.get("class_count") == len(classes),
          "class_count matches classes array",
          f"{index.get('class_count')} vs {len(classes)}")

    names = [c.get("name") for c in classes]
    check(len(names) == len(set(names)), "no duplicate class names")
    for c in classes:
        check(set(c) >= {"name", "file", "inherits", "brief"},
              f"index entry complete: {c.get('name')}", json.dumps(c))

    classes_dir = DOCS / "classes"
    md_files = list(classes_dir.glob("*.md")) if classes_dir.is_dir() else []
    check(len(md_files) == len(classes),
          "classes/ file count matches index",
          f"{len(md_files)} files vs {len(classes)} index entries")

    for c in classes:
        f = DOCS / c["file"]
        check(f.is_file(), f"indexed file exists: {c['file']}")

    for md_path in md_files:
        text = md_path.read_text(encoding="utf-8")
        name = md_path.stem
        first = text.split("\n", 1)[0]
        check(first.startswith("# "), f"{name}: starts with '# <Class>'", first[:60])
        check(re.search(rf"^> class \S", text, re.M) is not None,
              f"{name}: has '> class' signature line")
        stripped = strip_code_spans(text)
        leaks = BBCODE_LEAK_RE.findall(stripped)
        check(not leaks, f"{name}: no BBCode leakage outside code spans",
              f"{leaks[:3]}")
        refs = CLASSREF_LEAK_RE.findall(stripped)
        check(not refs, f"{name}: no unconverted [ClassName] refs", f"{refs[:3]}")

    for meta in ("DOCS_VERSION", "ATTRIBUTION.md"):
        check((DOCS / meta).is_file(), f"{meta} exists")
    if (DOCS / "DOCS_VERSION").is_file():
        body = (DOCS / "DOCS_VERSION").read_text(encoding="utf-8")
        for key in ("godot_branch", "upstream_commit", "generated_at", "class_count"):
            check(f"{key}:" in body, f"DOCS_VERSION has {key}")


# ---------------------------------------------------------------------------
# source-parity checks (need engine XML)
# ---------------------------------------------------------------------------

SECTIONS = [("method", "methods", "> method "), ("member", "members", "> property "),
            ("signal", "signals", "> signal "), ("constructor", "constructors", "> constructor "),
            ("operator", "operators", "> operator "), ("annotation", "annotations", "> annotation "),
            ("theme_item", "theme_items", "> theme_property ")]


def check_parity(xml_dir: Path) -> None:
    xml_files = sorted(xml_dir.glob("*.xml"))
    check(bool(xml_files), "xml dir non-empty", str(xml_dir))
    for xml_path in xml_files:
        root = ET.parse(xml_path).getroot()
        name = root.attrib["name"]
        md_path = DOCS / "classes" / (name.lower() + ".md")
        if not md_path.is_file():
            check(False, f"{name}: markdown file exists")
            continue
        md = md_path.read_text(encoding="utf-8")
        for tag, section, sig in SECTIONS:
            el = root.find(section)
            n_src = len(el.findall(tag)) if el is not None else 0
            n_md = len(re.findall("^" + re.escape(sig), md, re.M))
            check(n_src == n_md, f"{name}: {tag} count parity", f"xml={n_src} md={n_md}")
        el = root.find("constants")
        n_src = len(el.findall("constant")) if el is not None else 0
        n_md = len(re.findall(r"^> (?:constant|enum_value) ", md, re.M))
        check(n_src == n_md, f"{name}: constant count parity", f"xml={n_src} md={n_md}")


def check_determinism(xml_dir: Path) -> None:
    index = json.loads((DOCS / "index.json").read_text(encoding="utf-8"))
    with tempfile.TemporaryDirectory() as tmp:
        result = subprocess.run(
            [sys.executable, str(ROOT / "tools" / "convert_docs.py"), str(xml_dir),
             "--output", tmp, "--version", str(index["godot_version"]),
             "--commit", str(index["upstream_commit"]),
             "--date", str(index["generated_at"])],
            capture_output=True, text=True)
        check(result.returncode == 0, "regeneration succeeds", result.stderr[:200])
        diff = subprocess.run(["diff", "-r", str(DOCS / "classes"), str(Path(tmp) / "classes")],
                              capture_output=True, text=True)
        check(diff.returncode == 0, "regeneration is byte-identical",
              diff.stdout[:300])
        new_index = json.loads((Path(tmp) / "index.json").read_text(encoding="utf-8"))
        check(new_index == index, "index.json regeneration identical")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--xml", help="engine doc/classes dir for parity + determinism checks")
    args = parser.parse_args()

    if not DOCS.is_dir():
        print('{"error": "assets/docs not found", "hint": "run tools/update_docs.sh first"}',
              file=sys.stderr)
        return 2

    check_pack()
    if args.xml:
        xml_dir = Path(args.xml)
        if not xml_dir.is_dir():
            print(f'{{"error": "xml dir not found: {xml_dir}"}}', file=sys.stderr)
            return 2
        check_parity(xml_dir)
        check_determinism(xml_dir)

    if failures:
        print(f"FAIL: {len(failures)} problem(s)")
        for f in failures[:50]:
            print(f"  - {f}")
        return 1
    scope = "pack + parity + determinism" if args.xml else "pack"
    print(f"PASS ({scope}): {DOCS}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
