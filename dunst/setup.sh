#! /bin/bash

echo "Setting up Alacritty: "

if [[ ! -e ${HOME}/.config/dunst ]]
then
  mkdir ${HOME}/.config/dunst
fi

cp ./dunstrc ${HOME}/.config/dunst

