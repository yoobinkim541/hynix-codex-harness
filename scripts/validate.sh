#!/usr/bin/env bash
# Check every SKILL.md has frontmatter with name + description.
set -u; fail=0; c=0
while IFS= read -r f; do
  c=$((c+1))
  head -1 "$f" | grep -q '^---$' || { echo "NO FRONTMATTER: $f"; fail=1; continue; }
  fm=$(awk 'NR>1 && /^---$/{exit} NR>1{print}' "$f")
  echo "$fm" | grep -q '^name:' || { echo "NO name: $f"; fail=1; }
  echo "$fm" | grep -q '^description:' || { echo "NO description: $f"; fail=1; }
done < <(find "${1:-skills}" -name SKILL.md -not -path '*/node_modules/*')
echo "checked $c SKILL.md files"; exit $fail
