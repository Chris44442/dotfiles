# QMK

```bash
sudo apt install -y git python3-pip
python3 -m pip install --user qmk
qmk setup
```

## Test Compile

```bash
qmk compile -kb beekeeb/piantor -km default
```

## Firmware

```bash
qmk config user.keyboard=beekeeb/piantor
qmk config user.keymap=chris44442
qmk new-keymap
```

## Customize Keymap.c

```bash
vim /home/chris/qmk_firmware/keyboards/beekeeb/piantor/keymaps/chris44442/keymap.c
qmk compile
qmk flash
```

After that double tab NRST reset button on the primary RP2040

