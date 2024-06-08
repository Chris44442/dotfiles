#!/bin/bash

home1=~

curl https://sh.rustup.rs -sSf | sh -s -- -y

CARGO_PATH="$home1/.cargo/bin"

mkdir -p $home1/.config/alacritty/
cp $home1/repo/dotfiles/dotfiles/alacritty.toml $home1/.config/alacritty/alacritty.toml
$CARGO_PATH/cargo install alacritty
$CARGO_PATH/cargo install bat
$CARGO_PATH/cargo install fd-find
$CARGO_PATH/cargo install eza
$CARGO_PATH/cargo install ripgrep
$CARGO_PATH/cargo install tmux-sessionizer
$CARGO_PATH/cargo install kalker

