#!/bin/bash

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Syu
yay -S thorium-browser-bin

echo "hide title bar by turning off thorium/setting/appearance/--use system title bar and borders--"

