#!/usr/bin/env bash

set -euo pipefail

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

PKG_FILE="$(dirname "$0")/packages.txt"
mapfile -t UTILS < <(grep -vE '^\s*#' "$PKG_FILE" | grep -vE '^\s*$')

echo "󰏖 Package list loaded from $PKG_FILE"
[[ "$DRY_RUN" == true ]] && echo "󱑒 Dry run mode enabled"

echo ""
echo " Checking for yay..."

if ! command -v yay >/dev/null 2>&1; then
  if [[ "$DRY_RUN" == true ]]; then
    echo " Would install yay (git + makepkg)"
  else
    echo " Installing yay..."
    sudo pacman -S --needed --noconfirm git base-devel
    tmpdir="$(mktemp -d)"
    git clone https://aur.archlinux.org/yay.git "$tmpdir"
    (cd "$tmpdir" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
  fi
else
  echo " yay is already installed"
fi

echo ""
echo " Installing packages..."

if [[ "$DRY_RUN" == true ]]; then
  echo " Would install the following:"
  for p in "${UTILS[@]}"; do echo "   $p"; done
else
  yay -S "${UTILS[@]}"
fi

