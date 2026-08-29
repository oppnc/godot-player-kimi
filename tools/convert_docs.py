#!/usr/bin/env python3
"""Convert Godot engine XML class reference (doc/classes/*.xml) to markdown docs pack.

Pure Python standard library. One markdown file per class, plus index.json.
Part of godot-player-kimi docs pipeline; driven by tools/update_docs.sh.

Output format conventions (grep-oriented, AI-first):
  - one signature line per member, prefixed with "> ":
      > class Node2D ; deprecated=... ; keywords=...
      > inherits Node2D CanvasItem
      > property motion_mode : MotionMode ; default=0 ; setter=... ; getter=...
      > method move_and_slide() -> bool ; qualifiers=...
      > signal draw()
      > enum MouseMode
      > enum_value MouseMode.MOUSE_MODE_VISIBLE = 0
      > constant INFINITY = inf
      > constructor Vector2(x: float = 0.0, y: float = 0.0)
      > operator ==(right: Vector2) -> bool
      > annotation @export
      > theme_property panel : StyleBox ; data=style ; default=...
    so a single Grep pattern like '^> method .*move' hits across all class files.
  - enum/bitfield type annotations preserved: XML enum="Input.MouseMode" renders as
    "MouseMode" (self-class prefix stripped), is_bitfield renders as BitField[...];
    "T[]" normalizes to "Array[T]" (matching the official docs rendering).
  - deprecated/experimental attributes with empty messages still emit the flag
    with a generic sentence (attribute presence is significant, not its value).
  - description text with BBCode converted to markdown (code fences, inline code,
    links). BBCode inside code blocks is never interpreted (array[i] stays intact).
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import xml.etree.ElementTree as ET
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

# ---------------------------------------------------------------------------
# BBCode -> markdown
# ---------------------------------------------------------------------------

# Block-level code containers; content is literal, no BBCode interpretation.
CODE_BLOCK_TAGS = {"codeblock": "text", "gdscript": "gdscript", "csharp": "csharp"}
# Simple emphasis mappings.
EMPHASIS_TAGS = {"b": "**", "i": "*", "s": "~~"}
# Tags dropped silently (inner text kept, except img which keeps nothing useful).
DROP_TAGS = {"codeblocks", "center", "font", "color", "img", "u"}
# Self-contained symbol references: [method move_and_slide] -> `move_and_slide`.
REF_TAGS = {
    "method", "member", "signal", "constant", "enum", "param",
    "annotation", "theme_item", "constructor", "operator",
}
# Lowercase built-in type references: [int] -> `int` (uppercase types like
# [Vector2] are caught by the class-reference rule instead).
BUILTIN_TYPE_TAGS = {"int", "float", "bool", "void", "null"}

BLOCK_RE = re.compile(
    r"\[(codeblock|gdscript|csharp)(?: [^\]]*)?\](.*?)\[/\1\]", re.DOTALL | re.IGNORECASE
)
INLINE_LITERAL_RE = re.compile(
    r"\[(code|kbd)(?: [^\]]*)?\](.*?)\[/\1\]", re.DOTALL | re.IGNORECASE
)
TOKEN_RE = re.compile(r"\[([^\[\]]+)\]")

PLACEHOLDER = "\x00{}\x00"
PLACEHOLDER_RE = re.compile("\x00(\\d+)\x00")


def _extract_literal_spans(text: str) -> Tuple[str, List[str]]:
    """Pull code blocks / inline code out, replacing them with placeholders.

    Returns (text_with_placeholders, rendered_spans) where rendered_spans are
    already-final markdown (fenced blocks or backticked spans).
    """
    spans: List[str] = []

    def stash(rendered: str) -> str:
        spans.append(rendered)
        return PLACEHOLDER.format(len(spans) - 1)

    def sub_block(match: re.Match) -> str:
        lang = CODE_BLOCK_TAGS[match.group(1).lower()]
        body = match.group(2).strip("\n")
        return stash(f"\n\n```{lang}\n{body}\n```\n\n")

    def sub_inline(match: re.Match) -> str:
        body = match.group(2).replace("`", "\\`")
        return stash(f"`{body}`")

    text = BLOCK_RE.sub(sub_block, text)
    text = INLINE_LITERAL_RE.sub(sub_inline, text)
    return text, spans


def _restore_spans(text: str, spans: List[str]) -> str:
    def repl(match: re.Match) -> str:
        return spans[int(match.group(1))]

    return PLACEHOLDER_RE.sub(repl, text)


def convert_bbcode(text: str) -> str:
    """Convert Godot doc BBCode to markdown. Never interprets markup inside code."""
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n").replace("\t", "    ")
    text, spans = _extract_literal_spans(text)

    out: List[str] = []
    stack: List[Tuple[str, Optional[str]]] = []  # (tag_name, close_marker)
    pos = 0
    for m in TOKEN_RE.finditer(text):
        out.append(text[pos : m.start()])
        pos = m.end()
        raw = m.group(0)
        content = m.group(1)

        if content.startswith("/"):
            name = content[1:].split(" ", 1)[0].lower()
            # pop up to and including the matching open tag
            while stack:
                top_name, close_marker = stack.pop()
                if close_marker:
                    out.append(close_marker)
                if top_name == name:
                    break
            else:
                out.append(raw)  # unmatched close tag: keep verbatim
            continue

        name, _, args = content.partition("=")
        if not args:
            name, _, args = content.partition(" ")
        name_l = name.lower()

        if name_l in REF_TAGS and args:
            out.append(f"`{args.strip()}`")
        elif name_l in BUILTIN_TYPE_TAGS and name == name_l and not args:
            out.append(f"`{name_l}`")
        elif name_l in EMPHASIS_TAGS and name == name_l:
            marker = EMPHASIS_TAGS[name_l]
            out.append(marker)
            stack.append((name_l, marker))
        elif name_l == "u" and name == name_l:
            stack.append(("u", None))  # underline: drop formatting, keep text
        elif name_l == "url" and args:
            out.append("[")
            stack.append(("url", f"]({args.strip()})"))
        elif name_l == "br":
            out.append("\n")
        elif name_l in DROP_TAGS and name == name_l:
            stack.append((name_l, None))
        elif name[:1].isupper() or name.startswith("@"):
            out.append(f"`{name}`")  # class reference, e.g. [Node2D] / [@GDScript]
        else:
            out.append(raw)  # unknown token: keep verbatim (e.g. array syntax)
    out.append(text[pos:])

    while stack:
        _, close_marker = stack.pop()
        if close_marker:
            out.append(close_marker)

    text = "".join(out)
    text = _restore_spans(text, spans)
    return normalize_text(text)


def normalize_text(text: str) -> str:
    """Tidy whitespace without touching fenced code block contents."""
    lines = text.split("\n")
    result: List[str] = []
    inside_code = False
    blank_pending = False
    for raw in lines:
        stripped = raw.strip()
        if stripped.startswith("```"):
            if blank_pending and result:
                result.append("")
            blank_pending = False
            result.append(stripped)
            inside_code = not inside_code
            continue
        if inside_code:
            result.append(raw.rstrip())
            continue
        if not stripped:
            blank_pending = True
            continue
        if blank_pending and result:
            result.append("")
        blank_pending = False
        result.append(stripped)
    text = "\n".join(result).strip()
    while "\n\n\n" in text:
        text = text.replace("\n\n\n", "\n\n")
    return text


# ---------------------------------------------------------------------------
# XML parsing
# ---------------------------------------------------------------------------


@dataclass
class Param:
    name: str
    type: str
    default: Optional[str] = None
    enum: Optional[str] = None
    is_bitfield: bool = False


@dataclass
class Method:
    name: str
    return_type: str
    params: List[Param]
    description: str
    qualifiers: Optional[str]
    deprecated: Optional[str]
    experimental: Optional[str]
    return_enum: Optional[str] = None
    return_is_bitfield: bool = False


@dataclass
class Member:
    name: str
    type: str
    setter: Optional[str]
    getter: Optional[str]
    default: Optional[str]
    overrides: Optional[str]
    description: str
    deprecated: Optional[str]
    experimental: Optional[str]
    enum: Optional[str] = None
    is_bitfield: bool = False


@dataclass
class Signal:
    name: str
    params: List[Param]
    description: str
    deprecated: Optional[str]
    experimental: Optional[str]


@dataclass
class Constant:
    name: str
    value: str
    enum: Optional[str]
    is_bitfield: bool
    description: str
    deprecated: Optional[str]
    experimental: Optional[str]


@dataclass
class ThemeItem:
    name: str
    type: str
    data_type: str
    default: Optional[str]
    description: str


@dataclass
class ClassDoc:
    name: str
    inherits: Optional[str]
    keywords: Optional[str]
    deprecated: Optional[str]
    experimental: Optional[str]
    brief: str
    description: str
    members: List[Member] = field(default_factory=list)
    constructors: List[Method] = field(default_factory=list)
    methods: List[Method] = field(default_factory=list)
    operators: List[Method] = field(default_factory=list)
    signals: List[Signal] = field(default_factory=list)
    annotations: List[Method] = field(default_factory=list)
    constants: List[Constant] = field(default_factory=list)
    theme_items: List[ThemeItem] = field(default_factory=list)
    tutorials: List[Tuple[str, str]] = field(default_factory=list)  # (title, url)


def _text(element: Optional[ET.Element]) -> str:
    if element is None:
        return ""
    return convert_bbcode("".join(element.itertext()))


def _params(node: ET.Element) -> List[Param]:
    out: Dict[int, Param] = {}
    for p in node.findall("param"):
        index = int(p.attrib.get("index", len(out)))
        out[index] = Param(
            name=p.attrib.get("name", f"arg{index}"),
            type=p.attrib.get("type", "Variant"),
            default=p.attrib.get("default"),
            enum=p.get("enum"),
            is_bitfield=p.get("is_bitfield") == "true",
        )
    return [out[i] for i in sorted(out)]


def _method(node: ET.Element) -> Method:
    ret = node.find("return")
    return Method(
        name=node.attrib.get("name", ""),
        return_type=ret.attrib.get("type", "void") if ret is not None else "void",
        params=_params(node),
        description=_text(node.find("description")),
        qualifiers=node.get("qualifiers"),
        deprecated=node.get("deprecated"),
        experimental=node.get("experimental"),
        return_enum=ret.get("enum") if ret is not None else None,
        return_is_bitfield=(ret.get("is_bitfield") == "true") if ret is not None else False,
    )


def parse_class_xml(path: Path) -> ClassDoc:
    root = ET.parse(path).getroot()
    doc = ClassDoc(
        name=root.attrib["name"],
        inherits=root.get("inherits"),
        keywords=root.get("keywords"),
        deprecated=root.get("deprecated"),
        experimental=root.get("experimental"),
        brief=_text(root.find("brief_description")),
        description=_text(root.find("description")),
    )

    members = root.find("members")
    if members is not None:
        for n in members.findall("member"):
            doc.members.append(Member(
                name=n.attrib.get("name", ""),
                type=n.attrib.get("type", "Variant"),
                setter=n.get("setter"),
                getter=n.get("getter"),
                default=n.get("default"),
                overrides=n.get("overrides"),
                description=convert_bbcode(n.text or ""),
                deprecated=n.get("deprecated"),
                experimental=n.get("experimental"),
                enum=n.get("enum"),
                is_bitfield=n.get("is_bitfield") == "true",
            ))

    for tag, target in (("constructors", doc.constructors), ("methods", doc.methods),
                        ("operators", doc.operators), ("annotations", doc.annotations)):
        section = root.find(tag)
        if section is not None:
            for n in section:
                target.append(_method(n))

    signals = root.find("signals")
    if signals is not None:
        for n in signals.findall("signal"):
            doc.signals.append(Signal(
                name=n.attrib.get("name", ""),
                params=_params(n),
                description=_text(n.find("description")),
                deprecated=n.get("deprecated"),
                experimental=n.get("experimental"),
            ))

    constants = root.find("constants")
    if constants is not None:
        for n in constants.findall("constant"):
            doc.constants.append(Constant(
                name=n.attrib.get("name", ""),
                value=n.attrib.get("value", ""),
                enum=n.get("enum"),
                is_bitfield=n.get("is_bitfield") == "true",
                description=convert_bbcode(n.text or ""),
                deprecated=n.get("deprecated"),
                experimental=n.get("experimental"),
            ))

    theme_items = root.find("theme_items")
    if theme_items is not None:
        for n in theme_items.findall("theme_item"):
            doc.theme_items.append(ThemeItem(
                name=n.attrib.get("name", ""),
                type=n.attrib.get("type", n.attrib.get("data_type", "")),
                data_type=n.attrib.get("data_type", ""),
                default=n.get("default"),
                description=convert_bbcode(n.text or ""),
            ))

    tutorials = root.find("tutorials")
    if tutorials is not None:
        for n in tutorials.findall("link"):
            url = (n.text or "").strip()
            if url:
                doc.tutorials.append((n.attrib.get("title", "").strip(), url))

    return doc


# ---------------------------------------------------------------------------
# Markdown rendering
# ---------------------------------------------------------------------------


def _type_display(base: str, enum: Optional[str], is_bitfield: bool, self_name: str) -> str:
    """Enum/bitfield annotation wins over the base type; otherwise normalize
    "T[]" to "Array[T]" (official docs notation)."""
    if enum:
        prefix = self_name + "."
        name = enum[len(prefix):] if enum.startswith(prefix) else enum
        return f"BitField[{name}]" if is_bitfield else name
    if base.endswith("[]"):
        return f"Array[{base[:-2]}]"
    return base


def _fmt_params(params: Sequence[Param], self_name: str) -> str:
    parts = []
    for p in params:
        piece = f"{p.name}: {_type_display(p.type, p.enum, p.is_bitfield, self_name)}"
        if p.default is not None:
            piece += f" = {p.default}"
        parts.append(piece)
    return ", ".join(parts)


def _attr_text(value: str) -> str:
    """Attribute values (deprecated/experimental) may contain BBCode; convert and
    force single-line so signature lines stay one line."""
    return re.sub(r"\s+", " ", convert_bbcode(value)).strip()


def _flags(*items: Optional[str]) -> str:
    extras = [i for i in items if i]
    return " ; " + " ; ".join(extras) if extras else ""


# Matches the official generator's boilerplate: an empty deprecation message
# on a class uses a different generic sentence than on members.
_EMPTY_DEPRECATED = {
    "class": "This class may be changed or removed in future versions.",
}


def _flag(deprecated: Optional[str], experimental: Optional[str], kind: str = "API") -> str:
    """Attribute *presence* is significant: an empty message still emits the flag
    with a generic sentence (upstream convention)."""
    return _flags(
        f"deprecated={_attr_text(deprecated) if deprecated else _EMPTY_DEPRECATED.get(kind, f'This {kind} is deprecated.')}"
        if deprecated is not None else None,
        f"experimental={_attr_text(experimental) if experimental else f'This {kind} may be changed or removed in future versions.'}"
        if experimental is not None else None,
    )


def _emit_entry(lines: List[str], signature: str, description: str) -> None:
    lines.append("")
    lines.append(signature)
    if description:
        lines.append("")
        lines.append(description)


def render_class_md(doc: ClassDoc) -> str:
    self_name = doc.name
    lines: List[str] = [f"# {self_name}", ""]
    lines.append(f"> class {self_name}" + _flag(doc.deprecated, doc.experimental, "class")
                 + _flags(f"keywords={doc.keywords}" if doc.keywords else None))
    if doc.inherits:
        lines.append(f"> inherits {self_name} {doc.inherits}")
    if doc.brief:
        lines += ["", "## Brief", "", doc.brief]
    if doc.description:
        lines += ["", "## Description", "", doc.description]

    if doc.members:
        lines += ["", "## Properties"]
        for m in doc.members:
            sig = f"> property {m.name} : {_type_display(m.type, m.enum, m.is_bitfield, self_name)}" + _flags(
                f"default={m.default}" if m.default is not None else None,
                f"setter={m.setter}" if m.setter else None,
                f"getter={m.getter}" if m.getter else None,
                f"overrides={m.overrides}" if m.overrides else None,
            ) + _flag(m.deprecated, m.experimental, "property")
            _emit_entry(lines, sig, m.description)

    if doc.constructors:
        lines += ["", "## Constructors"]
        for m in doc.constructors:
            sig = f"> constructor {self_name}({_fmt_params(m.params, self_name)})" + _flag(
                m.deprecated, m.experimental, "constructor")
            _emit_entry(lines, sig, m.description)

    if doc.methods:
        lines += ["", "## Methods"]
        for m in doc.methods:
            ret = _type_display(m.return_type, m.return_enum, m.return_is_bitfield, self_name)
            sig = f"> method {m.name}({_fmt_params(m.params, self_name)}) -> {ret}" + _flags(
                f"qualifiers={m.qualifiers}" if m.qualifiers else None,
            ) + _flag(m.deprecated, m.experimental, "method")
            _emit_entry(lines, sig, m.description)

    if doc.operators:
        lines += ["", "## Operators"]
        for m in doc.operators:
            name = m.name.removeprefix("operator ")  # XML names are "operator *" etc.
            ret = _type_display(m.return_type, m.return_enum, m.return_is_bitfield, self_name)
            sig = f"> operator {name}({_fmt_params(m.params, self_name)}) -> {ret}" + _flag(
                m.deprecated, m.experimental, "operator")
            _emit_entry(lines, sig, m.description)

    if doc.signals:
        lines += ["", "## Signals"]
        for s in doc.signals:
            sig = f"> signal {s.name}({_fmt_params(s.params, self_name)})" + _flag(
                s.deprecated, s.experimental, "signal")
            _emit_entry(lines, sig, s.description)

    enums: Dict[str, List[Constant]] = {}
    plain_constants: List[Constant] = []
    for c in doc.constants:
        (enums.setdefault(c.enum, []) if c.enum else plain_constants).append(c)

    if enums:
        lines += ["", "## Enumerations"]
        bitfields = {c.enum for c in doc.constants if c.enum and c.is_bitfield}
        for enum_name in sorted(enums):
            lines.append("")
            flag = " ; bitfield=true" if enum_name in bitfields else ""
            lines.append(f"> enum {enum_name}{flag}")
            for c in enums[enum_name]:
                sig = f"> enum_value {enum_name}.{c.name} = {c.value}" + _flag(
                    c.deprecated, c.experimental, "constant")
                _emit_entry(lines, sig, c.description)

    if plain_constants:
        lines += ["", "## Constants"]
        for c in plain_constants:
            sig = f"> constant {c.name} = {c.value}" + _flag(
                c.deprecated, c.experimental, "constant")
            _emit_entry(lines, sig, c.description)

    if doc.annotations:
        lines += ["", "## Annotations"]
        for m in doc.annotations:
            sig = f"> annotation {m.name}({_fmt_params(m.params, self_name)})" + _flags(
                f"qualifiers={m.qualifiers}" if m.qualifiers else None)
            _emit_entry(lines, sig, m.description)

    if doc.theme_items:
        lines += ["", "## Theme Properties"]
        for t in doc.theme_items:
            sig = f"> theme_property {t.name} : {t.type}" + _flags(
                f"data={t.data_type}" if t.data_type else None,
                f"default={t.default}" if t.default is not None else None,
            )
            _emit_entry(lines, sig, t.description)

    if doc.tutorials:
        lines += ["", "## Tutorials"]
        for title, url in doc.tutorials:
            label = title or url
            lines.append(f"- [{label}]({url})")

    return "\n".join(lines).rstrip() + "\n"


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("classes_dir", help="Directory containing Godot doc/classes XML files")
    parser.add_argument("--output", "-o", required=True, help="Output docs pack directory")
    parser.add_argument("--version", required=True, help="Godot version, e.g. 4.7")
    parser.add_argument("--commit", default="", help="Upstream godot repo commit hash")
    parser.add_argument("--date", default="", help="Generation date (ISO)")
    args = parser.parse_args(argv)

    classes_dir = Path(args.classes_dir)
    if not classes_dir.is_dir():
        print(f'{{"error": "classes dir not found: {classes_dir}", '
              f'"hint": "run tools/update_docs.sh which fetches the engine XML"}}', file=sys.stderr)
        return 2

    xml_files = sorted(classes_dir.glob("*.xml"))
    if not xml_files:
        print(f'{{"error": "no XML files in {classes_dir}", '
              f'"hint": "check the sparse checkout of godot doc/classes"}}', file=sys.stderr)
        return 2

    out_dir = Path(args.output)
    classes_out = out_dir / "classes"
    classes_out.mkdir(parents=True, exist_ok=True)

    index_classes = []
    failures = []
    for xml_path in xml_files:
        try:
            doc = parse_class_xml(xml_path)
        except Exception as exc:
            failures.append((xml_path.name, str(exc)))
            continue
        file_name = doc.name.lower() + ".md"
        (classes_out / file_name).write_text(render_class_md(doc), encoding="utf-8")
        brief_one_line = re.sub(r"\s+", " ", doc.brief).strip()
        index_classes.append({
            "name": doc.name,
            "file": f"classes/{file_name}",
            "inherits": doc.inherits,
            "brief": brief_one_line,
        })

    index_classes.sort(key=lambda c: c["name"].lower())
    index = {
        "schema": 1,
        "godot_version": args.version,
        "upstream_commit": args.commit,
        "generated_at": args.date,
        "class_count": len(index_classes),
        "classes": index_classes,
    }
    (out_dir / "index.json").write_text(
        json.dumps(index, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")

    if failures:
        for name, err in failures:
            print(f"warning: failed to convert {name}: {err}", file=sys.stderr)
        return 1

    print(f"converted {len(index_classes)} classes -> {classes_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
