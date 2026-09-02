#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$script_dir/.." && pwd)"
source_dir="$repo_dir/nvim"
target_dir="$HOME/.config/nvim"

if [[ ! -d "$source_dir" ]]; then
  printf 'Neovim config source not found: %s\n' "$source_dir" >&2
  exit 1
fi

mkdir -p "$(dirname -- "$target_dir")"

if [[ -L "$target_dir" && "$(readlink "$target_dir")" == "$source_dir" ]]; then
  printf 'Neovim config is already linked: %s -> %s\n' "$target_dir" "$source_dir"
  exit 0
fi

if [[ -e "$target_dir" || -L "$target_dir" ]]; then
  backup_dir="${target_dir}.backup.$(date +%Y%m%d-%H%M%S)"
  mv "$target_dir" "$backup_dir"
  printf 'Existing Neovim config moved to: %s\n' "$backup_dir"
fi

ln -s "$source_dir" "$target_dir"
printf 'Neovim config linked: %s -> %s\n' "$target_dir" "$source_dir"
