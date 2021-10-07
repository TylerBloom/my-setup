#! /bin/bash

echo "Setting up Polybar: "

./get_deps.sh

if [[ ! -e ${HOME}/.config/polybar ]]
then
  mkdir ${HOME}/.config/polybar
fi

cp ./config ${HOME}/.config/polybar/
cp ./launch.sh ${HOME}/.config/polybar/
cp ./power.sh ${HOME}/.config/polybar/
cp ./spotify.py ${HOME}/.config/polybar/

