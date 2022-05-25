#! /bin/bash

echo "Setting up Fish: "

if [[ ! -e ${HOME}/.config/fish ]]
then
  mkdir ${HOME}/.config/fish
fi

cp ./config.fish ${HOME}/.config/fish
cp -r ./functions ${HOME}/.config/fish

