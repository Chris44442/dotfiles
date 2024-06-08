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

# Install arch behind proxy

before archinstall:

```bash
export http_proxy=http://1x.xx.xxx.xx:xxx8
export https_proxy=http://1x.xx.xxx.xx:xxx8
export ftp_proxy=http://1x.xx.xxx.xx:xxx8
export socks_proxy=http://1x.xx.xxx.xx:xxx9
```

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

# kde

lookandfeeltool -a org.kde.breezedark.desktop

change colors to breezedark  
change icons manually, e.g. buuf or candy  
change window decoration to plastik  
change login screen  
shortcut for virtual desktop, alt + f1 etc  
ctrl alt t shortcut to alacritty  

# quartus

sudo cp ~/HowToDocs/install_scripts/quartus/libcrypt.so.1 /lib/libcrypt.so.1

for xserver for quartus on wayland do:

sudo pacman -S xorg-xwayland

install multilib for 32 bit libraries that quartus need

# Thorium

- hide title bar by turning off thorium/setting/appearance/--use system title bar and borders--
- on wayland it might be necessary to add --ozone-platform=wayland to the  
  /usr/share/applications/thorium-browser.desktop file on the Exec line.

## Extensions

- accept all cookies
- dark reader
- sponsorblock for youtube
- ublock origin

# Git

- copy id_rsa
- chmod 600 id_rsa
- git config --global user.email "mail"
- git config --global user.name "name"

