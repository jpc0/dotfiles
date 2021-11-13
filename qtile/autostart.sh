#!/bin/sh

/usr/lib/kdeconnectd &
/usr/bin/kdeconnect-indicator &
nm-applet &
gnome-keyring-daemon &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
