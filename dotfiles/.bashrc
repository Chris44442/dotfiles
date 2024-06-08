alias cr='cargo run'
alias du='dust'
alias ka='kalker'
alias uh='eza -la --group-directories-first -t=modified --time-style=long-iso'
alias uhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=2 -I=".git"'
alias uhhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=3 -I=".git"'
alias g='lazygit'
export EDITOR=nvim

source ~/.config/key-bindings.bash

export PATH="~/.local/bin:${PATH}"

shopt -s histappend
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=erasedups
export HISTIGNORE='&:ls:uh:cd:cd ..:exit:clear'

