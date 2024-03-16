## This is a small example VHDL project to demonstrate GHDL, GTKWave, Corsair and Vunit

- generate modules and documentation with:

```bash
corsair
```

- to simulate with Vunit and GHDL run:

```bash
python3 run.py

# run on 8 threads
# python3 run.py -p 8

# run and then visualize in GTKWave
# python3 run.py --gtkwave-fmt=vcd --gtkwave-args=--save=wave.gtkw -g lib.corsair*

# run and generate xunit xml file for CI/CD
# python3 run.py --xunit-xml test_output.xml
```

