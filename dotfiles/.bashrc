alias cr='cargo run'
alias cat='bat'
alias grep='rg'
alias et='lvim'
alias du='dust'
alias uh='eza -la --group-directories-first -t=modified --time-style=long-iso'
alias uhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=2 -I=".git"'
alias uhhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=3 -I=".git"'
alias g='lazygit'
# export QSYS_ROOTDIR="/home/chris/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
# export QUARTUS_ROOTDIR_OVERRIDE="/home/chris/intelFPGA_lite/23.1std"
# export QUARTUS="/home/chris/intelFPGA_lite/23.1std"
export EDITOR=lvim

source ~/.config/key-bindings.bash

export PATH="/home/chris/.local/bin:${PATH}"

