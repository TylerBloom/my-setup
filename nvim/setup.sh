#! /bin/bash

echo "Setting up NeoVim: "

if [[ ! -e ${HOME}/.config/nvim ]]
then
  mkdir ${HOME}/.config/nvim
fi

cp -r ./init.vim ${HOME}/.config/nvim/

cp -r ./autoload ${HOME}/.config/nvim/
cp -r ./sessions ${HOME}/.config/nvim/
cp -r ./scripts ${HOME}/.config/nvim/

cd ${HOME}/.config/nvim

echo "Make sure to use :PlugInstall when you first use nvim"

