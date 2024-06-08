#!/bin/bash

mkdir tmp1 && cd tmp1
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
# copy it into cargo because neovim lazygit plugin has issues with path
mv lazygit ~/.cargo/bin/lazygit
cd ..
rm -rf tmp1

