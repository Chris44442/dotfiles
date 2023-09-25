# Matlab, Simulink and DSPBA

Von: Rodbertus, Daniel

```
58411-54339-34908-27468-00516-34555-06060-41551-58178-35489-28420-23686-42478-02629-50933-25195-25276 
08698-10245-00876-41093-02200-40723-18742-05511-35954-63925-40539-58062 
```

## Installing Matlab and Simulink

After downloading the .iso file do:

```
sudo mkdir /mnt/matlab
sudo mount -o loop /path/to/matlab.iso /mnt/matlab
cd /mnt/matlab
sudo -E ./install
```

Follow the installation wizard. Provide the File Installation Key. Set the license path. The `Mathworks_License.dat` must contain:

```
SERVER license01.cc.ebs.corp 3C4A92EF52A8 27122
USE_SERVER
```

Clean up with:

```
sudo unmount /mnt/matlab
rm -r /mnt/matlab
```

## Starting Matlab

Start Matlab with

```
matlab
```

If there are problems with the license file, you can try

```
matlab -c 27122@license01.cc.ebs.corp
```

```
export LM_LICENSE_FILE=27130@license01.cc.ebs.corp:27122@license01.cc.ebs.corp
```
