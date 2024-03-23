#!/bin/bash

cp ~/HowToDocs/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/tms
cp ~/HowToDocs/dotfiles/tms/config.toml ~/.config/tms/config.toml


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/.tmux/plugins/tpm/scripts/
./install_plugins.sh

