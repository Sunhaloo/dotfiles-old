#!/bin/bash

# Sleep for a bit to allow i3 to start up
sleep 1

# Set padding for the bar
xdo lower -N Polybar
xdo move -y 20 -N Polybar

# Launch Polybar
polybar --config=~/.config/polybar/config.ini mybar &
