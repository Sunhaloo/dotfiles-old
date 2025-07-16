#!/usr/bin/env bash

CHOSEN=$(printf " Lock\n⏾ Suspend\n Reboot\n Shutdown\n󰍃 Log Out" | rofi -dmenu -i -p "   ⏻ ")

case "$CHOSEN" in
    "⏾ Suspend") systemctl suspend ;;
    " Reboot") systemctl reboot ;;
    " Shutdown") systemctl poweroff ;;
    "󰍃 Log Out") hyprctl dispatch exit ;;
    " Lock") hyprlock ;;  # optional if you have hyprlock
    *) exit 1 ;;
esac
