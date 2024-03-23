#!/bin/bash

cd
git clone https://github.com/junegunn/fzf.git
cd fzf
make
cp target/fzf-linux_amd64 ~/.local/bin/fzf
cd ..
rm -rf fzf

cp ~/HowToDocs/install_scripts/key-bindings.bash ~/.config/key-bindings.bash

