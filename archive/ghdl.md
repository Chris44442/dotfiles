download ghdl-gha-ubuntu-22.04-mcode.tgz from github  
mv contents to ~/.local/  
```bash
sudo apt install gnat-10
sudo apt install gtkwave
```

Simulation script should look something like this:

```bash
#!/bin/bash

rm -f *.cf sim.log

source ~/.fpga_config
unisim_VCOMP=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/unisim_VCOMP.vhd
unisim_VPKG=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/unisim_VPKG.vhd
IBUFDS=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/IBUFDS.vhd
IOBUFDS=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/IOBUFDS.vhd
OBUFDS=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/OBUFDS.vhd
IOBUF=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/IOBUF.vhd
OBUF=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/OBUF.vhd
IBUF=$VIVADO_COMPILE_DIR_RSECPSTTI/../data/vhdl/src/unisims/primitive/IBUF.vhd

ghdl -a --std=08 --work=unisim $unisim_VCOMP
ghdl -a --std=08 -frelaxed --work=unisim $unisim_VPKG &>/dev/null
ghdl -a --std=08 --work=unisim $IBUFDS
ghdl -a --std=08 --work=unisim $IOBUFDS
ghdl -a --std=08 --work=unisim $OBUFDS
ghdl -a --std=08 --work=unisim $IOBUF
ghdl -a --std=08 --work=unisim $IBUF
ghdl -a --std=08 -frelaxed --work=unisim $OBUF
ghdl -a --std=08 ../../src/dut.vhd
ghdl -a --std=08 dut_tb.vhd
ghdl -r --std=08 -frelaxed dut_tb --vcd=waveform.vcd >sim.log

if [ "$1" = "-v" ] || [ "$2" = "-v" ]
then
  if ! grep -q "simulation finished" sim.log; then
    echo -e "\033[1;91mFAIL\033[0m dut"
  elif grep -q "assertion failure" sim.log; then
    echo -e "\033[1;91mFAIL\033[0m dut"
  else
    echo -e "\033[1;92mPASS\033[0m dut"
  fi
fi

if [ "$1" = "-g" ] || [ "$2" = "-g" ]
then
  gtkwave waveform.vcd gtk.gtkw
fi
```

