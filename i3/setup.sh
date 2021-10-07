#! /bin/bash

echo "Setting up I3: "

./get_deps.sh

if [[ ! -e ${HOME}/.config/i3 ]]
then
  mkdir ${HOME}/.config/i3/
fi

cp ./config ${HOME}/.config/i3/

