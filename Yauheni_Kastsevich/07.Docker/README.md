#
# 07. Docker
#
---
## Homework Assignment 1: Docker Installation and Basic Commands

### I use WSL so i Install Docker Desktop on Windows
#### I followed a few simple steps
```
1. Download the installer using the download button at the top of the page, or from the release notes.

2. Double-click Docker Desktop Installer.exe to run the installer. By default, Docker Desktop is installed at C:\Program Files\Docker\Docker.

3. When prompted, ensure the Use WSL 2 instead of Hyper-V option on the Configuration page is selected or not depending on your choice of backend.

If your system only supports one of the two options, you will not be able to select which backend to use.

4. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.

5. When the installation is successful, select Close to complete the installation process.
```
### Commands
``` bash
   docker --version
   docker run hello-world
   docker images
   docker ps -a
```

### OUTPUT
``` bash
Docker version 24.0.7, build afdd53b

CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
9cf4deeaf990   hello-world   "/hello"   24 minutes ago   Exited (0) 24 minutes ago             vigorous_yalow
f4354eca1af8   hello-world   "/hello"   3 days ago       Exited (0) 3 days ago                 fervent_keller
```

