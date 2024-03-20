
#!/bin/bash

CARGO_PATH="/home/chris/.cargo/bin"

$CARGO_PATH/cargo install vhdl_ls

cd $CARGO_PATH/..
mkdir tmp
cd tmp
git clone https://github.com/VHDL-LS/rust_hdl.git
cp -rf rust_hdl/vhdl_libraries ..
cd ..
rm -rf tmp
cp ~/HowToDocs/dotfiles/.vhdl_ls.toml ~/.vhdl_ls.toml


