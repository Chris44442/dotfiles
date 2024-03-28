#!/bin/bash

cd
git clone https://github.com/junegunn/fzf.git
cd fzf
make
mkdir ~/.local/bin
cp target/fzf-linux_amd64 ~/.local/bin/fzf
cd ..
rm -rf fzf

cp ~/HowToDocs/dotfiles/key-bindings.bash ~/.config/key-bindings.bash

