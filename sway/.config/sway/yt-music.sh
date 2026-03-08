#!/bin/bash
swaymsg '[app_id="qtws"] focus' || gtk-launch youtube-music-desktop
swaymsg workspace $ws10
