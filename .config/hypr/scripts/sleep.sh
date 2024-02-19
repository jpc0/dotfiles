#!/bin/zsh
#
swayidle -w timeout 60 'swaylock -f -c 000000' \
            timeout 90 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            before-sleep 'swaylock -f -c 000000' &
