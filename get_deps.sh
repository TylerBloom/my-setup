#! /bin/bash

# Each directory has a script that gets its deps. Deps for the project are also
# installed via the setup script.

for i in $(ls)
do
  if [[ -d $i ]]
  then
    cd $i
    ./get_deps.sh
    cd ..
  fi
done

