#! /bin/bash

echo "Setting up git: "

if [[ ! -e ${HOME}/.config/git ]]
then
  mkdir ${HOME}/.config/git
fi

cp ./config ${HOME}/.config/git
cp ./attributes ${HOME}/.config/git

