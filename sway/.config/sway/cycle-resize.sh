#!/bin/bash
current=$(swaymsg -t get_tree | jq '.. | objects | select(.focused==true) | .rect.width')
total=$(swaymsg -t get_outputs | jq '.[0].rect.width')
pct=$((current * 100 / total))

if [ "$pct" -lt 40 ]; then
    swaymsg resize set width 50 ppt
elif [ "$pct" -lt 60 ]; then
    swaymsg resize set width 66 ppt
else
    swaymsg resize set width 33 ppt
fi
