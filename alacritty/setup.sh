#! /bin/bash

echo "Setting up Alacritty: "

./get_deps.sh

if [[ ! -e ${HOME}/.config/alacritty ]]
then
  mkdir ${HOME}/.config/alacritty
fi

cp ./alacritty.yml ${HOME}/.config/alacritty

