#!/usr/bin/env bash

set -euo pipefail

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ICON_INFO=""
ICON_LINK=""
ICON_REMOVE="󰆴"
ICON_SKIP=""
ICON_DONE=""
ICON_SECTION="󱞩"

echo "$ICON_INFO Dry run: $DRY_RUN"
echo "$ICON_INFO Dotfiles root: $ROOT"
echo ""

link() {
    local src="$1"
    local dst="$2"

    if [[ "$src" == "$dst" ]]; then
        echo "$ICON_SKIP Skipping self-link: $src"
        return
    fi

    if [[ -e "$dst" || -L "$dst" ]]; then
        echo "$ICON_REMOVE Removing: $dst"
        $DRY_RUN || rm -rf "$dst"
    fi

    echo "$ICON_LINK Linking: $src -> $dst"
    $DRY_RUN || ln -s "$src" "$dst"
}

echo "$ICON_SECTION Linking .config/* to ~/.config/"
mkdir -p "$HOME/.config"
for path in "$ROOT/.config/"*; do
    name="$(basename "$path")"
    link "$path" "$HOME/.config/$name"
done

echo ""
echo "$ICON_SECTION Linking git configs"
[[ -f "$ROOT/git/gitconfig" ]] && link "$ROOT/git/gitconfig" "$HOME/.gitconfig"
[[ -f "$ROOT/git/gitignore" ]] && link "$ROOT/git/gitignore" "$HOME/.gitignore"

echo ""
echo "$ICON_SECTION Linking scripts to ~/bin/"
mkdir -p "$HOME/bin"
for path in "$ROOT/scripts/"*; do
    name="$(basename "$path")"
    link "$path" "$HOME/bin/$name"
done

echo ""
echo "$ICON_SECTION Linking .zshrc"
[[ -f "$ROOT/.zshrc" ]] && link "$ROOT/.zshrc" "$HOME/.zshrc"

echo ""
echo "$ICON_SECTION Linking wofi .desktop files"
mkdir -p "$HOME/.local/share/applications"
[[ -f "$ROOT/.config/wofi/alwx.desktop" ]] && link "$ROOT/.config/wofi/alwx.desktop" "$HOME/.local/share/applications/alwx.desktop"

echo ""
echo "$ICON_DONE Done."

