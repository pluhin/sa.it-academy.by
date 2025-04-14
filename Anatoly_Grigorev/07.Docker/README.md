# 07.Docker

## Homework Assignment 1: Docker Installation and Basic Commands
```bash
   for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done
   apt update
   apt install ca-certificates curl
   install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
   chmod a+r /etc/apt/keyrings/docker.asc
   echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   apt-get update
   apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   
   docker --version
	Docker version 26.1.4, build 5650f9b

   docker pull hello-world
   docker run hello-world

   docker ps
       CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## Homework Assignment 2: Building a Docker Image with Dockerfile
[Dockerfile](./Dockerfiles/Dockerfile)
[Application](./Dockerfiles/app.py)

Create a Docker image
```bash
docker build . -t hello-app-image
[+] Building 11.0s (9/9) FINISHED                                docker:default
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 184B                                       0.0s
 => [internal] load metadata for docker.io/library/python:latest          10.8s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [1/4] FROM docker.io/library/python:latest@sha256:9819e5616923079cc16  0.0s
 => [internal] load build context                                          0.0s
 => => transferring context: 138B                                          0.0s
 => CACHED [2/4] RUN pip3 install Flask                                    0.0s
 => CACHED [3/4] RUN mkdir /app                                            0.0s
 => [4/4] COPY app.py /app                                                 0.1s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:33977a7d9bbdcf0311c2bbd73839137c476a7cc0a1732  0.0s
 => => naming to docker.io/library/hello-app-image         
```

Launching the container
```bash 
docker run -d -p 5000:5000 --name hello-app hello-app-image
```

Check container
```bash 
docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                                       NAMES
524196439f0a   hello-app-image   "flask --app /app/ap…"   6 minutes ago   Up 6 minutes   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   hello-app
```

Check access to web application
```bash
curl  http://localhost:5000/
Hello, World
```