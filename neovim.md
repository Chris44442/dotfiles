# Neovim Setup

## Installation

Install Neovim on Ubuntu:

```bash
sudo snap install nvim --classic
```

In `~/.bashrc` write `alias vim='nvim'`.

Create folder and start neovim:

```bash
cd ~/config
mkdir nvim
cd nvim
vim .
```

Replace the nvim folder with the one in this repo for a basic setup. It needs a package manager to run.

## Packer

In .config do:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Keybindings

Source current buffer

```
:so
```

Synchronize Packer, update packages

```
:PackerSync
```

Save and quit

```
:w
:q
:q!
:wq
```

Explorer

```
space + pv
```

Fuzzy Finder

```
space + pf
```

Grep Makro

```
space + ps
```

Echo syntax group name of word under cursor:

```
:echo synIDattr(synID(line("."), col("."), 1), "name")
```

## Folding

Zfap

Zo

:mkview

:loadview

## Find and replace

/ ctrl+r ctrl+f Return cgn <word> Esc .
