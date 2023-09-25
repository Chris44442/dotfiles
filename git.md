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
