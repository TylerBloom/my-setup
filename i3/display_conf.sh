#!/bin/bash

MONITOR_CONNECTED=$(xrandr | grep "HDMI-1-0 connected")

# If HDMI is connected, mirror displays
if [ "$MONITOR_CONNECTED" ]; then
				xrandr --output HDMI-1-0 --mode 1920x1080 --same-as eDP-1
				xrandr --output HDMI-1-0 --primary
fi
