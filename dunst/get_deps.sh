#! /bin/bash

# Gets the deps for the dunst config

sudo apt install libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev lib-cairo2-dev libnotify-dev xdg-utils

wget https://github.com/dunst-project/dunst/archive/refs/tags/v1.9.0.zip
unzip dunst-1.9.0.zip
cd dunst-1.9.0

make WAYLAND=0
sudo make WAYLAND=0 install

