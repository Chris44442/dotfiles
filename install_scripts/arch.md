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
- bash-completion
- go
- neovim
- lazygit
- wl-clipboard (xclip?)
- otf-droid-nerd
- unzip
- openssh
- samba (if necessary)

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

## Sway


```bash
sudo pacman -S sway swaybg polkit
sudo pacman -S otf-droid-nerd
curl -o ~/.config/firespin.jpg https://www.pixel4k.com/preview.php?src=https://www.pixel4k.com/wp-content/uploads/2020/01/firespin-4k-mq-3840x2160-1.jpg
```

in sway config add:

font pango: "Droid Sans Mono" Regular 14

set $mod Mod1


mod+shift+c to reload config


```bash
sudo pacman -S wofi
```

set $menu wofi --show run

```bash
sudo pacman -S waybar
# This may or may not be necessary for the waybar icons:
# sudo pacman -S ttf-font-awesome
```

ttf-roboto-mono for diego sandoval waybar config


# Lunarvim Backup

```bash
wget -P ~/.local https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
cd ~/.local/
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
cd
echo "export PATH=\"~/.local/nvim-linux64/bin:\${PATH}\"" >> ~/.bashrc

LUNARVIM_PATH="~/HowToDocs/install_scripts/lvim"
LUNARVIM_PATH_DEST="~/.local/share/lunarvim"
mkdir -p $LUNARVIM_PATH_DEST
cp -r $LUNARVIM_PATH $LUNARVIM_PATH_DEST
mv $LUNARVIM_PATH_DEST/lvim/lvim/lvim ~/.local/bin
mv $LUNARVIM_PATH_DEST/lvim/lvim ~/.config/
```

```bash
CARGO_PATH="~/.cargo/bin"

$CARGO_PATH/cargo install vhdl_ls

cd $CARGO_PATH/..
mkdir tmp
cd tmp
git clone https://github.com/VHDL-LS/rust_hdl.git
cp -rf rust_hdl/vhdl_libraries ..
cd ..
rm -rf tmp
cp ~/HowToDocs/dotfiles/.vhdl_ls.toml ~/.vhdl_ls.toml
```

# Install arch behind proxy

before archinstall:

export http_proxy=http://1x.xx.xxx.xx:xxx8
export https_proxy=http://1x.xx.xxx.xx:xxx8
export ftp_proxy=http://1x.xx.xxx.xx:xxx8
export socks_proxy=http://1x.xx.xxx.xx:xxx9


then if reflector hangs:

alt + right arrow    and then    systemctl stop reflector

# When installed

copy .gitconfig from another pc
in /etc/wgetrc enable proxy and set http_proxy and https_proxy like above
in /etc/pacman.conf set XferCommand = /usr/bin/wget -c -O %o %u
in /etc/pacman.d/mirrorlist disable all mirrors except worldwide and germany

pacman -S openssh
copy privat ssh key from another pc to ~/.ssh and chmod 600 it.
sudo systemctl enable sshd.service

pacman -S samba
cp /etc/samba/smb.conf from another pc
sudo systemctl enable smb.service

tms config to set directories. Otherwise some versions of tms might error.
