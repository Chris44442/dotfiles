#!/bin/bash

# echo "########################"
# echo "###  INSTALL NEOVIM  ###"
# echo "########################"
# wget -P ~/.local https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
# cd ~/.local/
# tar xzvf nvim-linux64.tar.gz
# rm nvim-linux64.tar.gz
# cd
# # export PATH="/home/chris/.local/nvim-linux64/bin:${PATH}"
# echo "export PATH=\"/home/chris/.local/nvim-linux64/bin:\${PATH}\"" >> /home/chris/.bashrc


LUNARVIM_PATH="~/HowToDocs/install_scripts/lvim"
LUNARVIM_PATH_DEST="~/.local/share/lunarvim"

mkdir -p $LUNARVIM_PATH_DEST
cp -r $LUNARVIM_PATH $LUNARVIM_PATH_DEST
mv $LUNARVIM_PATH_DEST/lvim/lvim ~/.local/nvim-linux64/bin/lvim
mkdir -p ~/.config/lvim
mv $LUNARVIM_PATH_DEST/lvim/ ~/.config/lvim/

# cd ./local
# TODO lunarvim

