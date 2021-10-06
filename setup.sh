#! /bin/bash

# Check directory has a script that handles moving its config files as well as
# installing any deps (and if needing creating the config directory).

for i in $(ls)
do
  if [[ -d $i ]]
  then
    cd $i
    ./setup.sh
    cd ..
  fi
done

