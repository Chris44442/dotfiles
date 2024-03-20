#!/bin/bash

curl https://sh.rustup.rs -sSf | sh -s -- -y

CARGO_PATH="/home/chris/.cargo/bin"

$CARGO_PATH/cargo install alacritty
$CARGO_PATH/cargo install bat
$CARGO_PATH/cargo install fd-find
$CARGO_PATH/cargo install exa
$CARGO_PATH/cargo install ripgrep
$CARGO_PATH/cargo install du-dust
$CARGO_PATH/cargo install tmux-sessionizer
$CARGO_PATH/cargo install kalker
$CARGO_PATH/cargo install vhdl_ls

cd $CARGO_PATH/..
mkdir tmp
cd tmp
git clone https://github.com/VHDL-LS/rust_hdl.git
cp -rf rust_hdl/vhdl_libraries ..
cd ..
rm -rf tmp
cp ~/HowToDocs/dotfiles/.vhdl_ls.toml ~/.vhdl_ls.toml

