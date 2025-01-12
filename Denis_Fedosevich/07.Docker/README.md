# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands
### Install Docker
```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
docker --version
sudo usermod -aG docker denis
newgrp docker
```
### Running the "hello-world" container
```shell
docker run hello-world

Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete 
Digest: sha256:5b3cc85e16e3058003c13b7821318369dad01dac3dbb877aac3c28182255c724
Status: Downloaded newer image for hello-world:latest

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
### List the running containers
```shell
docker ps -a

CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
20c04729f91f   hello-world   "/hello"   4 minutes ago   Exited (0) 4 minutes ago             elegant_merkle

denis@devops:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
hello-world   latest    d2c94e258dcb   20 months ago   13.3kB
```

## Homework Assignment 2: Building a Docker Image with Dockerfile
Links to files:
- [Dockerfile](dockerfile)
- [Requirements](requirements.txt)
- [App](app.py)

### Build the Docker image
```shell
docker build -t app-py .
[+] Building 1.9s (10/10) FINISHED                                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                                    0.0s
 => => transferring dockerfile: 217B                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.13.1-slim-bookworm                                                                          1.3s
 => [internal] load .dockerignore                                                                                                                       0.1s
 => => transferring context: 2B                                                                                                                         0.0s
 => [1/5] FROM docker.io/library/python:3.13.1-slim-bookworm@sha256:1127090f9fff0b8e7c3a1367855ef8a3299472d2c9ed122948a576c39addeaf1                    0.0s
 => [internal] load build context                                                                                                                       0.0s
 => => transferring context: 251B                                                                                                                       0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                           0.0s
 => CACHED [3/5] COPY requirements.txt .                                                                                                                0.0s
 => CACHED [4/5] RUN pip install --no-cache-dir -r requirements.txt                                                                                     0.0s
 => [5/5] COPY app.py .                                                                                                                                 0.1s
 => exporting to image                                                                                                                                  0.1s
 => => exporting layers                                                                                                                                 0.0s
 => => writing image sha256:81c45d53cf720277bfb2bb4f8d087b7630af1ed4043a0e95e337d52c91063c3e                                                            0.0s
 => => naming to docker.io/library/app-py
 ```

### Running a container
```shell
docker run --name app-py -d -p 5000:5000 81c45d53cf72
docker ps

CONTAINER ID   IMAGE          COMMAND           CREATED         STATUS         PORTS                                       NAMES
1712b8871dfd   81c45d53cf72   "python app.py"   4 seconds ago   Up 4 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   app-py
```
### Checking access to a web application
```shell
curl -I http://192.168.56.100:5000
HTTP/1.1 200 OK
Server: Werkzeug/3.1.3 Python/3.13.1
Date: Sat, 11 Jan 2025 18:28:32 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 12
Connection: close

curl http://192.168.56.100:5000
My homework!
```
