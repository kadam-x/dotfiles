#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/wallpapers/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
