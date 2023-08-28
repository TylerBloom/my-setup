#! /bin/bash

echo "Setting up I3: "

if [[ ! -e ${HOME}/.config/i3 ]]
then
  mkdir ${HOME}/.config/i3/
fi

cp ./config ${HOME}/.config/i3/

echo "Note: This i3 config requires polybar and compton, which are installed seperately."

