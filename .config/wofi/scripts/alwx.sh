#!/bin/bash

choice=$(printf "Disable Idle\nEnable Idle" | wofi --dmenu -p "Alwx actions")

case "$choice" in
  "Disable Idle") pkill hypridle ;;
  "Enable Idle") hyprctl dispatch exec hypridle ;;
esac

