#! /bin/bash

echo "Setting up rofi: "

if [[ ! -e ${HOME}/.config/rofi ]]
then
  mkdir ${HOME}/.config/rofi
fi

cp ./config.rasi ${HOME}/.config/rofi

