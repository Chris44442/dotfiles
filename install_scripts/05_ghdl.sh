#!/bin/bash

GHDL="ghdl-gha-ubuntu-22.04-llvm.tgz"
cd ~/.local
wget https://github.com/ghdl/ghdl/releases/download/v4.0.0/$GHDL
tar -xf $GHDL
rm $GHDL

pip3 install vunit_hdl --break-system-packages

