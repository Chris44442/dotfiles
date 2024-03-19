#!/bin/bash

curl https://sh.rustup.rs -sSf | sh -s -- -y
# export PATH="/home/chris/.cargo/bin:${PATH}"
source "~/.bashrc"

cargo install alacritty
cargo install bat
cargo install fd-find
cargo install exa
cargo install ripgrep
cargo install du-dust
cargo install tmux-sessionizer
cargo install kalker

