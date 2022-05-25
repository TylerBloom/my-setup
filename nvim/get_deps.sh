#! /bin/bash

# Gets the deps for the Neovim config

# Some plugins require nvim 0.7
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz

# Assumes that you have ~/bin in your path.
# NOTE: Just moving the nvim executable will not work.
ln -s ./nvim-linux64/bin/nvim ${HOME}/bin/nvim

sudo apt install vim-plugged

