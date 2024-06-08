#!/bin/bash

home1=/home/chris

cd
git clone https://github.com/junegunn/fzf.git
cd fzf
make
mkdir $home1/.local/bin
cp target/fzf-linux_amd64 $home1/.local/bin/fzf
cd ..
rm -rf fzf

cp $home1/HowToDocs/dotfiles/key-bindings.bash $home1/.config/key-bindings.bash

