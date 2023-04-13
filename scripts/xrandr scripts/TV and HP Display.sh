#!/bin/bash

### VARIABLES ###
## TV
TV="DisplayPort-2"
## Mode Information
MODE="2560x1440_60.00"
CLOCK="312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync"

#Disable Other Displays
xrandr --output DisplayPort-0 --off
xrandr --output DisplayPort-1 --off

cvt 2560 1440 
# xrandr only works in X11 sessions, not Wayland
[ "$XDG_SESSION_TYPE" = x11 ] || exit 0
xrandr --newmode "$MODE" $CLOCK
xrandr --addmode $TV $MODE
echo "Switched to TV & Enabling Secondary Display"
xrandr --output $TV --primary --mode $MODE --pos 0x0 --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --left-of DisplayPort-2
