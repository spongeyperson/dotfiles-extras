#!/bin/bash

### VARIABLES ###
## TV
TV="DisplayPort-2"
TVPOS="DisplayPort-2"
## Mode Information
MODE="2560x1440_60.00"
LINES="  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync"

cvt 2560 1440 
# xrandr only works in X11 sessions, not Wayland
[ "$XDG_SESSION_TYPE" = x11 ] || exit 0
xrandr --newmode "$MODE"$LINES
xrandr --addmode $TV $MODE
xrandr --output $TV --mode $MODE --left-of HDMI-A-0

echo "Switched to TV"