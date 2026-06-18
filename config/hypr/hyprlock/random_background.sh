#!/bin/bash
BACKGROUNDS_DIR="$HOME/.config/backgrounds"
RANDOM_BG=$(find -L "$BACKGROUNDS_DIR" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n1)
[ -n "$RANDOM_BG" ] && ln -sf "$RANDOM_BG" "$BACKGROUNDS_DIR/lock_current"
