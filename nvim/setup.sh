#! /bin/bash

echo "Setting up NeoViM: "

./get_deps.sh

if [[ ! -e ${HOME}/.config/nvim ]]
then
  mkdir ${HOME}/.config/nvim
fi

cp -r ./init.vim ${HOME}/.config/nvim/

cp -r ./autoload ${HOME}/.config/nvim/
cp -r ./sessions ${HOME}/.config/nvim/
cp -r ./scripts ${HOME}/.config/nvim/

cd ${HOME}/.config/nvim
git clone https://github.com/universal-ctags/ctags.git
mv ctags tags
cd tags
./autogen.sh
./configure
make
sudo make install # may require extra privileges depending on where to install


