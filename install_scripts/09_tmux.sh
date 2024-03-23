#!/bin/bash

cp ~/HowToDocs/dotfiles/.tmux.conf ~/.tmux.conf


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/.tmux/plugins/tpm/scripts/
./install_plugins.sh

