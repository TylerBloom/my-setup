#! /bin/bash

xrandr --output eDP-1 --brightness $(xrandr --verbose | grep Brightness | gawk '{print $2 + 0.1}')

