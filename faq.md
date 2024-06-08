

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
