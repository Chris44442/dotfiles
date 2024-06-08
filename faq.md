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

