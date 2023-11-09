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