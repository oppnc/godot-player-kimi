#!/usr/bin/env bash
# Docs pack pipeline: sparse-checkout godot engine doc/classes XML -> markdown pack
# in assets/docs/ (classes/*.md + index.json + DOCS_VERSION + ATTRIBUTION.md).
# Idempotent; run at release time (or to bump the pinned upstream branch).
# Usage: tools/update_docs.sh [branch]   (default branch: 4.7)
set -euo pipefail

BRANCH="${1:-4.7}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE="$ROOT/tools/.cache/godot"
OUT="$ROOT/assets/docs"
REPO_URL="https://github.com/godotengine/godot.git"
PY="${PYTHON:-python}"

fail() {
  printf '{"error": "%s", "hint": "%s"}\n' "$1" "$2" >&2
  exit 2
}

command -v git >/dev/null || fail "git not found in PATH" "install git and retry"
command -v "$PY" >/dev/null || fail "python not found in PATH" "install python 3.10+ or set PYTHON env var"

# 1. Fetch engine XML (partial clone, sparse checkout of doc/classes only).
if [ ! -d "$CACHE/.git" ]; then
  echo ">> cloning godot ($BRANCH, sparse: doc/classes) into tools/.cache/godot"
  git clone --depth 1 --filter=blob:none --sparse --branch "$BRANCH" "$REPO_URL" "$CACHE" \
    || fail "git clone failed" "check network access to github.com"
  git -C "$CACHE" sparse-checkout set doc/classes
else
  echo ">> updating cached checkout to origin/$BRANCH"
  git -C "$CACHE" fetch --depth 1 origin "$BRANCH" \
    || fail "git fetch failed" "check network access to github.com"
  git -C "$CACHE" checkout --detach FETCH_HEAD >/dev/null
  git -C "$CACHE" sparse-checkout set doc/classes
fi

COMMIT="$(git -C "$CACHE" rev-parse HEAD)"
VERSION_PY="$(git -C "$CACHE" show HEAD:version.py)"
DOCS_VERSION="$(printf '%s\n' "$VERSION_PY" | sed -n 's/^docs *= *"\(.*\)".*/\1/p')"
[ -n "$DOCS_VERSION" ] || DOCS_VERSION="$BRANCH"
vp_field() { printf '%s\n' "$VERSION_PY" | sed -n "s/^$1 *= *\"\{0,1\}\([^\"]*\)\"\{0,1\}\$/\1/p"; }
FULL_VERSION="$(vp_field major).$(vp_field minor).$(vp_field patch).$(vp_field status)"
TODAY="$(date +%F)"

# 2. Convert XML -> markdown pack.
echo ">> converting doc/classes ($DOCS_VERSION @ ${COMMIT:0:10}) to $OUT"
"$PY" "$ROOT/tools/convert_docs.py" "$CACHE/doc/classes" \
  --output "$OUT" --version "$DOCS_VERSION" --commit "$COMMIT" --date "$TODAY"

CLASS_COUNT="$(ls "$OUT/classes" | wc -l | tr -d ' ')"

# 3. Pinning metadata + license attribution.
cat > "$OUT/DOCS_VERSION" <<EOF
godot_branch: $BRANCH
godot_version: $FULL_VERSION
docs_channel: $DOCS_VERSION
upstream_repo: $REPO_URL
upstream_commit: $COMMIT
generated_at: $TODAY
class_count: $CLASS_COUNT
EOF

cat > "$OUT/ATTRIBUTION.md" <<'EOF'
# Attribution

The class reference in this directory (`classes/*.md`, `index.json`) is generated
from the Godot Engine documentation XML files (`doc/classes/*.xml`) of the
Godot Engine source repository: https://github.com/godotengine/godot

Godot Engine is released under the MIT license:

Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).
Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

The exact upstream revision used is recorded in `DOCS_VERSION`.
Regenerate with: `tools/update_docs.sh <branch>`.
EOF

echo ">> done: $CLASS_COUNT classes, godot $FULL_VERSION, commit ${COMMIT:0:10}"
du -sh "$OUT" 2>/dev/null || true
