alias cr='cargo run'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias et='lvim'
alias du='dust'
alias ka='kalker'
alias uh='eza -la --group-directories-first -t=modified --time-style=long-iso'
alias uhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=2 -I=".git"'
alias uhhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=3 -I=".git"'
alias g='lazygit'
# export QSYS_ROOTDIR="~/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
# export QUARTUS_ROOTDIR_OVERRIDE="~/intelFPGA_lite/23.1std"
# export QUARTUS="~/intelFPGA_lite/23.1std"
export EDITOR=lvim

source ~/.config/key-bindings.bash

export PATH="~/.local/bin:${PATH}"

shopt -s histappend
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=erasedups
export HISTIGNORE='&:ls:uh:cd:cd ..:exit:clear'

