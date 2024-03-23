#!/bin/bash

mkdir -p ~/.config/alacritty/
cp ~/HowToFiles/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

cat ~/HowToFiles/dotfiles/.bashrc >> ~/.bashrc
