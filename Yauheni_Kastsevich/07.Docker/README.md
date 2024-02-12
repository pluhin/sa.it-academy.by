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

## Homework Assignment 2: Building a Docker Image with Dockerfile

### Dockerfile
``` bash
# My Dockerfile to build Docker Image of Apache WebServer running on Ubuntu

FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get -y install apache2

RUN echo 'Hello World from Docker!' > var/www/html/index.html


CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
```

### My commands
``` bash
docker build -t mydockapp:v1 .
docker images
docker run -d -p 7777:80 mydockapp:v1
```

### Output
```bash
curl -I http://localhost:7777
```
``` bash
HTTP/1.1 200 OK
Date: Mon, 12 Feb 2024 10:11:08 GMT
Server: Apache/2.4.52 (Ubuntu)
Last-Modified: Mon, 12 Feb 2024 09:44:16 GMT
ETag: "19-6112c1efabb49"
Accept-Ranges: bytes
Content-Length: 25
Content-Type: text/html
```
