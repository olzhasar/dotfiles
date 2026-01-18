#!/usr/bin/env bash
set -euo pipefail

machine="${1:-}"
if [[ -z "$machine" ]]; then
  machine="$(hostname -s 2>/dev/null || hostname)"
fi

base="devices"
pkg="${machine}"

if [[ ! -d "${base}/${pkg}" ]]; then
  echo "Missing ${base}/${pkg}. Create it and re-run." >&2
  exit 1
fi

stow -d "$base" -t "$HOME" "$pkg"
