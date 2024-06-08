#!/bin/bash

home1=~

pip3 install vunit_hdl --break-system-packages
pip3 install corsair --break-system-packages

git clone https://github.com/nickg/nvc.git

cd nvc
./autogen.sh
mkdir build && cd build
../configure
make
sudo make install
rm -rf $home1/repo/dotfiles/install_scripts/nvc

