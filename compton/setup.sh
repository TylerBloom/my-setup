#! /bin/bash

echo "Setting up Compton: "

if [[ ! -e ${HOME}/.config/compton ]]
then
  mkdir ${HOME}/.config/compton/
fi

cp ./compton.conf ${HOME}/.config/compton/

