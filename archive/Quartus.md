# Quartus

Install libc6:i386, libncurses6:i386, libxtst6:i386, libxft2:i386, libstdc++6:i386, libc6-dev-i386, lib32z1, libncurses5-dev:i386, libbz2-1.0:i386, and libpng12 libraries (see note below):


```
sudo apt install libc6:i386
sudo apt install libncurses6:i386
sudo apt install libxtst6:i386
sudo apt install libxft2:i386
sudo apt install libstdc++6:i386
sudo apt install libc6-dev-i386
sudo apt install lib32z1
sudo apt install libncurses5-dev:i386
sudo apt install libbz2-1.0:i386
sudo apt install libqt5xml5
sudo apt install liblzma-dev
```

To install libpng12 do:

```
sudo -E add-apt-repository ppa:linuxuprising/libpng12
sudo apt update
sudo apt install libpng12-0
```

Download files from Intel FPGA Software Download Center, e.g.:

- QuartusSetup-22.1std.1.917-linux.run
- QuartusProgrammerSetup-22.1std.1.917-linux.run
- QuestaSetup-22.1std.1.917-linux.run
- cyclonev-22.1std.1.917.qdz

Run the installation and follow the steps:

```
./QuartusSetup-22.1std.1.917-linux.run
```

Set the environmental variable LM_LICENSE_FILE by running:

```
nano ~/.profile
```

... and adding the line:

```
export LM_LICENSE_FILE=27130@license01.cc.ebs.corp
```