# 1. Homework Assignment 1: Docker Installation and Basic Commands
## 1.Install Docker on your local machine or a virtual environment.
Команды для установки

```
   apt update
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/nullecho   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   docker version
 
```
 
## 2. Verify the Docker installation by running the docker --version command.
```
docker --version
Docker version 26.1.4, build 5650f9b
```
## 3.Pull the official "hello-world" Docker image and run a container based on it.
```
root@ubuntudev:~/07.Docker# sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
## 4. List the running containers using the docker ps command.
## 5. Document the installation process and the commands used for verification.

Демонстарция команды docker ps на примере запуска образа hello-world
```
docker run hello-world
root@ubuntudev:~# docker ps
CONTAINER ID   IMAGE         COMMAND    CREATED        STATUS                  PORTS     NAMES
350a512e6c24   hello-world   "/hello"   1 second ago   Up Less than a second             fervent_shamir
```
# 2. Homework Assignment 2: Building a Docker Image with Dockerfile
## 1.Create a new directory for your Dockerfile and application code.


