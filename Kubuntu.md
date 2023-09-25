# Install Kubuntu

- Download [Kubuntu](https://kubuntu.org/getkubuntu/) iso
- Write iso to USB stick, e.g. via Win32 Disk Imager
- Plug in stick and boot from it
- Installation steps should be self explanatory, refer to online guides if necessary

## Setup proxy

- Follow How to setup dev sys on bitbucket

You may need to set http_proxy etc as environmental variables.

In addition to configuring proxies, tell sudo to preserve the environment with the -E option, e.g.:

```
sudo -E add-apt-repository ppa:linuxuprising/libpng12
```

Snap

```
sudo snap set system proxy.http=http://<proxy_addr>:<proxy_port>
sudo snap set system proxy.https=http://<proxy_addr>:<proxy_port>
```

## NVIDIA Drivers

Determine recommended driver version and install it:

```
ubuntu-drivers devices
sudo apt install nvidia-driver-<version>
sudo reboot
nvidia-smi
```

## Firefox

 In Firefox go to Settings -> Network Settings:
 ```
HTTP Proxy: localhost
Port: 3128

SOCKS Host: localhost
Port: 3129
 ```

You should now be able to visit websites such as `google.com`.

## SSH

Install SSH server using:

```
sudo apt install openssh-server
```

You should now be able to connect to the machine via SSH.

## Remote Desktop Connection

Install XRDP using:

```
sudo apt install xrdp
sudo systemctl enable xrdp
```

You should now be able to connecto to the machine from Windows machines via RDP. Logout the user before or it may not work properly.

## Alternative Remote Desktop Connection: VNC

Install TigerVNC Server. Choose a password.

```
sudo apt install tightvnc-standalone-server
vncserver
vncserver -list
```

Install TigerVNC Client, e.g. on your Windows machine. Create a local SSH tunnel. Adjust user, IP and port while running:

```
ssh -L 5901:127.0.0.1:5901 <user>@10.78.245.190
```

Then in your client TigerVNC GUI connect to:

```
127.0.0.1:5901
```

You should now be able to connecto to the machine from Windows machines via VNC. Logout the user before or it may not work properly.

## 4k Resolution

For certain apps like Matlab this can be useful when using 4k Global Scaling. Some windows will not be correctly scaled otherwise:

```
xdpyinfo
xrandr --dpi 144
```

### Scaling the desktop without changing the resolution

- Getting the screen name:

xrandr | grep connected | grep -v disconnected | awk '{print $1}'

- Reduce the screen size by 20% (zoom-in)

xrandr --output screen-name --scale 0.8x0.8

- Increase the screen size by 20% (zoom-out)

xrandr --output screen-name --scale 1.2x1.2

- Reset xrandr changes

xrandr --output screen-name --scale 1x1

## Curl

Install Curl using

```
sudo apt install curl
```

## VS Code

Download the [.deb file](https://code.visualstudio.com/download). Install vscode and g++ compiler, then run VS Code:

```
sudo dpkg -i your_downloaded_file.deb
sudo apt install g++
code
```

## Color Themes 

clone candy-icons github to /usr/share/icons

download global theme from kde store and scp into /usr/share/plasma/look_and_feel folder

## Wallpaper and Login Screen

Right click on e.g. jpg image file in Dolphin and set it to Wallpaper background.

To set Login Screen do:

```
sudo nano /usr/share/sddm/themes/breeze/theme.conf
```

Then set background to the path of your e.g. jpg image file. Copy it into /usr/share/sddm/themes/breeze/ since not all paths are working in login screen.

## Language settings

You can change the default language settings:

```
sudo nano /etc/default/locale
```

## Local network

Ubuntu lokal network, for e.g. ssh to embedded linux

Configure connection set ipv4 method to link-local, and also ipv4 is required checkbox. Set ipv6 method to ignored.
