#!/usr/bin/env bash

swww-daemon &
swww img /home/corby/Downloads/Night_City.png &

nm-applet --indicator &

waybar &

nextcloud &
