# GIT

To access bitbucket repos with your public ssh key on it, copy your privat ssh key into:
```
 ~/.ssh/
```

## Fix slow SSH authentication

SSH supports both IPv4 and IPv6 and prefers IPv6 if the DNS retrieves AAAA record, but the ISP may not support IPv6, which results in huge delays. Solve it with forcing the IPv4 connection:

```
sudo nano /etc/ssh/ssh_config
```

Add `AddressFamily inet` somewhere in the file.

Restarting the ssh service may or may not be necessary:

```
sudo service ssh restart
```

# Clangd LSP

include path of c header files:

```bash
export CPATH="your/include:more/include:/usr/include"
```

# Build Dockerimage on Bamboo

- create new repo on bitbucket, set ssh access keys if necessary
- on host pc clone repo
- add Dockerfile, bamboo.yaml, and certificates to repo, commit and push
- Bamboo administration -> Linked repositories -> add repo -> bitbucket server -> Select your repo
- disable checkbox "Enable repository caching on agents", set name, save repo
- go to bamboo project -> project settings -> bamboo specs repos add <your repo name>
- go to <your linked repo> in bamboo, enable scan for bamboo specs
- Specs status -> scan

# Ollama

Install:

```bash
sudo pacman -S ollama
```

Start Ollama:

```bash
ollama serve
```

Run a model with example:

```bash
ollama run llama3:instruct 'write me a nice little poem'
```

# Samba

Samba lets you share files between different machines in the same network.

User names, IP addresses and folder names in this file are only examples.

## Installation

Install Samba. In order for SSO to work, specify the password of your client user:

```
sudo apt update
sudo apt install samba
sudo smbpasswd -a <username>
```

Create a folder to be shared. Configure Samba:

```
mkdir /home/<username>/Shared
sudo nano /etc/samba/smb.conf
```

At the end of the file add:

```
[Shared]
path = /home/<username>/Shared/
valid users = <username>
read only = no
```

Restart and test Samba:

```
sudo service smbd restart
testparm
```

In order to connect from other Windows machines you will need to create Credentials on those machines. This should not be necessary on the Firm Client if the SSO user name and password has been used for Samba.

```
IP: 10.78.245.131
User Name: <username>
Password: <your password>
```

In the address bar of Windows File Explorer type `\\10.78.245.131`. You should now see the shared folder.

# SVN CLI partial checkout

svn checkout --depth empty https://neptun.ngr.de.ebs.corp/svn/trxs/RAP-SW/FPGA/FRP_C_S10/trunk/  
svn update --set-depth infinity trunk/Sources

# Docker

Go to https://download.docker.com/linux/ubuntu/dists/ and select version, e.g. jammy.

Go to `pool/stable` and select architecture amd64.

Download latest deb files for 

```
containerd.io_<version>_<arch>.deb
docker-ce_<version>_<arch>.deb
docker-ce-cli_<version>_<arch>.deb
docker-buildx-plugin_<version>_<arch>.deb
docker-compose-plugin_<version>_<arch>.deb
```

Install the `.deb` packages. Update paths accordingly:

```
sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
./docker-ce_<version>_<arch>.deb \
./docker-ce-cli_<version>_<arch>.deb \
./docker-buildx-plugin_<version>_<arch>.deb \
./docker-compose-plugin_<version>_<arch>.deb
```

Start docker.

```
sudo service docker start
```

## Proxy

Edit the docker daemon config file:

```
sudo nano /etc/docker/daemon.json
```

It must contain the following:

```
{
 "proxies": {
   "http-proxy": "http://10.78.245.67:3128/",
   "https-proxy": "http://10.78.245.67:3128/",
   "no-proxy": ".example.org,127.0.0.0/8"
  }
}
```

Verify that the Docker Engine installation is successful by running the `hello-world` image.

```
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo docker run hello-world
```

## Example image

Create Dockerfile

```
mkdir ~/dockertest
cd ~/dockertest
nano Dockerfile
```

It should contain the following:

```
FROM ubuntu:latest

CMD echo "foo"
```


Now build the the image:

```
sudo -E docker build -t my-minimal-image .
```

... and run it:

```
sudo -E docker run -it --name my-container my-minimal-image /bin/bash
```

Stop and delete it:

```
sudo docker stop my-container
sudo docker rm my-container
```

When a container is running you can access its terminal with:

```
sudo docker exec -it my-container /bin/bash
```


## Arch

```bash
pacman -S docker
sudo systemctl enable docker.service
sudo usermod -aG docker your_username
```

# Win11

- Install Win11 with "World" region setting to avoid garbage apps
- Run Chris Titus Tweaks, see youtube video
- download and install nvcleanstall, run it for a clean gpu driver installation

- install browser, steam, hwinfo, cpuz, neovim via choco in powershell, thunderbird, discord
- profiles: trackir, streamdeck, tarkov, dcs

# Win10

# Windows 10

## Edge Dark Mode

- Type in edge://flags
- Search for dark
- Enable it

## Windows WSL Ubuntu

In Windows run Powershell as admin and type: `wsl --install -d ubuntu`. Choose username and password. Reboot Windows.

In Ubuntu enable apt via proxy:

```
sudo nano /etc/apt/apt.conf
```

and add four lines:
```bash
Acquire::http::proxy "http://10.78.245.67:3128/";
Acquire::https::proxy "http://10.78.245.67:3128/";
Acquire::ftp::proxy "http://10.78.245.67:3128/";
Binary::apt::Acquire::AllowInsecureRepositories "true";
```

For Quartus NIOS EDS to run properly, in Ubuntu type:

```bash
sudo apt update
sudo apt install wsl
sudo apt install dos2unix 
sudo apt install make
sudo apt install build-essential
```

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
