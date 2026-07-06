#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: new-idea-path.sh SLUG" >&2
  exit 1
fi

slug="$1"
date_prefix="$(date +%Y-%m-%d)"
year="$(date +%Y)"
base_dir="${HOME}/.idearium/ideas/${year}"
base_name="${date_prefix}-${slug}"

mkdir -p "${base_dir}"

candidate="${base_dir}/${base_name}.md"
if [[ ! -e "${candidate}" ]]; then
  echo "${candidate}"
  exit 0
fi

n=2
while [[ -e "${base_dir}/${base_name}-${n}.md" ]]; do
  n=$((n + 1))
done

candidate="${base_dir}/${base_name}-${n}.md"
echo "${candidate}"