#!/bin/bash

sudo cp ~/HowToDocs/install_scripts/quartus/libcrypt.so.1 /lib/libcrypt.so.1

echo "for xserver for quartus on wayland do:"
echo "sudo pacman -S xorg-xwayland"
echo "install multilib for 32 bit libraries that quartus need"

