#! /bin/bash

echo "Setting up NeoVim: "

if [[ ! -e ${HOME}/.config/nvim ]]
then
  mkdir ${HOME}/.config/nvim
fi

cp ./init.lua ${HOME}/.config/nvim/
cp ./lazy-lock.json ${HOME}/.config/nvim/

cp -r ./lua ${HOME}/.config/nvim/

cd ${HOME}/.config/nvim

echo "Every is setup. Lazy-nvim will take care of installing everything for you"

