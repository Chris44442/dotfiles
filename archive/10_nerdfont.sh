#!/bin/bash

cd
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh DroidSansMono
fc-cache -fv
cd ..
rm -rf nerd-fonts

