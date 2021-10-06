#! /bin/bash

# Each directory contains a script that will pull what it needs from config
# files back here.  This allows you to make config changes elsewhere, and have
# them copied here.

cp ${HOME}/.bashrc ./

for i in $(ls)
do
  if [[ -d $i ]]
  then
    cd $i
    ./gather.sh
    cd ..
  fi
done

