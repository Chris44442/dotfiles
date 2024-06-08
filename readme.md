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

