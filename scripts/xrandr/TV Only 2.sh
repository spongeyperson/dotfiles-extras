#!/bin/bash

### VARIABLES ###
## TV
TV="HDMI-A-0"
## Mode Information
MODE="2560x1440_60.00"
CLOCK="312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync"

#Disable Other Displays
xrandr --output DisplayPort-2 --off
xrandr --output DisplayPort-1 --off
xrandr --output DisplayPort-0 --off

cvt 2560 1440 
# xrandr only works in X11 sessions, not Wayland
[ "$XDG_SESSION_TYPE" = x11 ] || exit 0
xrandr --newmode "$MODE" $CLOCK
xrandr --addmode $TV $MODE
xrandr --output $TV --primary --mode $MODE --auto

echo "Switched to TV"
