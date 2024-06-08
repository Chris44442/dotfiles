#!/bin/bash

home1=/home/chris

cp $home1/HowToDocs/dotfiles/.tmux.conf $home1/.tmux.conf
mkdir -p $home1/.config/tms
cp $home1/HowToDocs/dotfiles/tms/config.toml $home1/.config/tms/config.toml


git clone https://github.com/tmux-plugins/tpm $home1/.tmux/plugins/tpm

cd $home1/.tmux/plugins/tpm/scripts/
./install_plugins.sh

