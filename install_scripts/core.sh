#!/bin/bash

apt-get install -y curl
apt-get install -y git

apt-get install -y build-essential
apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
apt-get install -y libssl-dev
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH="/root/.cargo/bin:${PATH}"

cargo install alacritty
cargo install bat
cargo install fd-find
cargo install exa
cargo install ripgrep
cargo install du-dust
cargo install tmux-sessionizer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
# TODO remove .fzf dir and mv fzf keybindings.bash to .config dir

mkdir -p ~/.local/bin/
cd ~/.local/bin/
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
cd

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
# mv thorium.list /etc/apt/sources.list.d/
# apt-get update
# apt-get install -y thorium-browser

