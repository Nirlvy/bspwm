#!/bin/bash

wallpaper_path=$(find ~/Pictures/wallpaper -type f | shuf -n 1)
old_wallpaper_path=$(sed -n 's|^.* /|/|p' $HOME/.config/hypr/hyprpaper.conf)

hyprctl hyprpaper preload $wallpaper_path
hyprctl hyprpaper wallpaper eDP-1,$wallpaper_path
hyprctl hyprpaper unload $old_wallpaper_path

sed -i "s|/.*$|$wallpaper_path|" $HOME/.config/hypr/hyprpaper.conf

pidof hyprpaper || exec hyprpaper

