#!/usr/bin/env bash
# Install this harness into Codex.
#   bash hynix-codex-harness/install.sh [--workspace DIR] [--with-anthropic-docs] [--with-openai-plugins] [--no-vendor]
# Copies skills to $HOME/.agents/skills (current Codex user skill dir) and links them into
# ${CODEX_HOME:-$HOME/.codex}/skills (legacy dir), copies AGENTS.md + templates into the workspace.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WS="$PWD"; VENDOR=1; ANTH=0; OAIP=0
while [ $# -gt 0 ]; do case "$1" in
  --workspace) WS="$2"; shift 2;;
  --with-anthropic-docs) ANTH=1; shift;;
  --with-openai-plugins) OAIP=1; shift;;
  --no-vendor) VENDOR=0; shift;;
  -h|--help) sed -n '2,6p' "$0"; exit 0;;
  *) echo "unknown option: $1" >&2; exit 1;;
esac; done
DEST="$HOME/.agents/skills"; LEGACY="${CODEX_HOME:-$HOME/.codex}/skills"
mkdir -p "$DEST" "$LEGACY"
n=0
install_dir() { # $1 = skill dir
  local name; name="$(basename "$1")"
  [ -f "$1/SKILL.md" ] || return 0
  rm -rf "$DEST/$name"; cp -R "$1" "$DEST/$name"
  if [ ! -e "$LEGACY/$name" ] || [ -L "$LEGACY/$name" ]; then ln -sfn "$DEST/$name" "$LEGACY/$name"; fi
  n=$((n+1))
}
for d in "$HERE"/skills/custom/*/; do install_dir "${d%/}"; done
if [ "$VENDOR" = 1 ]; then
  for d in "$HERE"/skills/vendor/*/*/; do install_dir "${d%/}"; done
fi
fetch() { # $1 repo url, $2 tmp dir name
  local t="${TMPDIR:-/tmp}/$2"; rm -rf "$t"
  git clone --depth 1 -q "$1" "$t" && echo "$t"
}
if [ "$ANTH" = 1 ]; then  # source-available license: fetched at install time, not redistributed here
  if t=$(fetch https://github.com/anthropics/skills anthropics-skills); then
    for s in docx pdf pptx xlsx; do [ -d "$t/skills/$s" ] && { cp -R "$t/skills/$s" "$t/skills/anthropic-$s"; install_dir "$t/skills/anthropic-$s"; }; done
  else echo "WARN: could not clone anthropics/skills" >&2; fi
fi
if [ "$OAIP" = 1 ]; then  # no license file upstream: fetched at install time, not redistributed here
  if t=$(fetch https://github.com/openai/plugins openai-plugins); then
    for p in build-web-apps data-analytics; do for d in "$t"/plugins/$p/skills/*/; do install_dir "${d%/}"; done; done
  else echo "WARN: could not clone openai/plugins" >&2; fi
fi
mkdir -p "$WS"
if [ -f "$WS/AGENTS.md" ] && ! grep -q '180-min build harness' "$WS/AGENTS.md"; then
  cp "$WS/AGENTS.md" "$WS/AGENTS.md.bak"; echo "existing AGENTS.md backed up to AGENTS.md.bak"
fi
cp "$HERE/AGENTS.md" "$WS/AGENTS.md"
mkdir -p "$WS/templates"; cp -n "$HERE"/templates/*.md "$WS/templates/" 2>/dev/null || true
echo "Installed $n skills -> $DEST (linked in $LEGACY)"
echo "AGENTS.md + templates -> $WS"
echo "Restart Codex (or start a new session), then type /skills to confirm."
