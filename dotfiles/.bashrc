alias cr='cargo run'
alias et='lvim'
alias uh='eza -la --group-directories-first -t=modified --time-style=long-iso'
alias uhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=2 -I=".git"'
alias uhhh='eza -la --group-directories-first -t=modified --time-style=long-iso -T -L=3 -I=".git"'
alias g='lazygit'
alias te='selected_file=$(fzf --preview "cat -n {}" --select-1) && [ -n "$selected_file" ] && lvim "$selected_file"'
export QSYS_ROOTDIR="/home/chris/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
export QUARTUS_ROOTDIR_OVERRIDE="/home/chris/intelFPGA_lite/23.1std"
export QUARTUS="/home/chris/intelFPGA_lite/23.1std"
export FZF_CTRL_T_COMMAND='rg --hidden -l --glob=!.git/ ""'
export FZF_DEFAULT_COMMAND='rg --hidden -l --glob=!.git/ ""'
export EDITOR=lvim

source ~/HowToDocs/install_scripts/completion.bash
source ~/HowToDocs/install_scripts/key-bindings.bash

