## Install Arch

- download iso to usb stick and boot from it, then run:

```bash
# pacman-key --init
# pacman -Sy archlinux-keyring
# pacman -S archinstall
archinstall
```

extra packages:
- git
- llvm
- gtkwave
- python
- python-pip
- base-devel
- docker
- tmux
- xclip
- bash-completion
- go
- neovim
- lazygit

## Clone Repo with install scripts

```bash
git clone https://github.com/Chris44442/HowToDocs.git
```

Run install scripts from the install_script dir

## Pipewire

Disable the terrible suspend on idle.

```bash
sudo vim /usr/share/wireplumber/scripts/node/suspend-node.lua
```

Set timeout to 0.

```lua
local timeout = 0
```

## AwesomeWM

```bash
yay -S awesome-git
sudo pacman -S playerctl
```

