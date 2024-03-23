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

