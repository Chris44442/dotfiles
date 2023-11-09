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
