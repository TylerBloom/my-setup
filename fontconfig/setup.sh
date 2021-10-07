#! /bin/bash

echo "Setting up FontConfig: "

./get_deps.sh

if [[ ! -e ${HOME}/.config/fontconfig ]]
then
  mkdir ${HOME}/.config/fontconfig
fi

cp ./fonts.conf ${HOME}/.config/fontconfig

