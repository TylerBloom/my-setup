#! /bin/bash

echo "Setting up adg: "

if [[ ! -e ${HOME}/.config/adg ]]
then
  mkdir ${HOME}/.config/adg
fi

cd Add-Drop-Goto
./install.sh
cp ./adg.fish ${HOME}/.local/bin

