#!/bin/bash

# wget -P ~/.local https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
# cd ~/.local/
# tar xzvf nvim-linux64.tar.gz
# rm nvim-linux64.tar.gz
# cd
# echo "export PATH=\"~/.local/nvim-linux64/bin:\${PATH}\"" >> ~/.bashrc

LUNARVIM_PATH="~/HowToDocs/install_scripts/lvim"
LUNARVIM_PATH_DEST="~/.local/share/lunarvim"
mkdir -p $LUNARVIM_PATH_DEST
cp -r $LUNARVIM_PATH $LUNARVIM_PATH_DEST
mv $LUNARVIM_PATH_DEST/lvim/lvim/lvim ~/.local/bin
mv $LUNARVIM_PATH_DEST/lvim/lvim ~/.config/


