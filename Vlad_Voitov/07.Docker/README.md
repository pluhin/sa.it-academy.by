# Homework Assignment 1: Docker Installation and Basic Commands
## Install Docker on your local machine or a virtual environment.
```bash
    vlad@devops:~/07.Docker$ sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Verify the Docker installation by running the docker --version command.
```bash
    docker --version
    Docker version 28.5.1, build e180ab8
```
## Pull the official "hello-world" Docker image and run a container based on it.
```bash
    sudo docker pull hello-world
    Using default tag: latest
    latest: Pulling from library/hello-world
    17eec7bbc9d7: Pull complete
    Digest: sha256:6dc565aa630927052111f823c303948cf83670a3903ffa3849f1488ab517f891
    Status: Downloaded newer image for hello-world:latest
    docker.io/library/hello-world:latest
    sudo docker run hello-world

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
## List the running containers using the docker ps command.
```bash
    sudo docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
# Homework Assignment 2: Building a Docker Image with Dockerfile

## Create a new directory for your Dockerfile and application code.
```bash
     mkdir docker_project
     cd docker_project/
```
## Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).
```bash
    cat Dockerfile
    FROM node:20-alpine

    WORKDIR /app

    COPY package*.json ./
    RUN npm install --omit=dev

    COPY server.js ./

    EXPOSE 3000

    CMD ["npm", "start"]
```

## Copy your application code into the image and set the necessary environment.

```bash
    ls -la
    total 24
    drwxrwxr-x 2 vlad vlad 4096 Oct 23 18:17 .
    drwxrwxr-x 3 vlad vlad 4096 Oct 23 17:46 ..
    -rw-rw-r-- 1 vlad vlad  138 Oct 23 18:17 Dockerfile
    -rw-rw-r-- 1 vlad vlad  195 Oct 23 18:15 .dockerignore
    -rw-rw-r-- 1 vlad vlad  276 Oct 23 18:12 package.json
    -rw-rw-r-- 1 vlad vlad  283 Oct 23 18:12 server.js
```
## Build the Docker image using the docker build command.

```bash
    sudo docker build -t vlad/hw2-node:1.0 .
```

## Run a container based on the image and access the web application.

```bash
    sudo docker run --rm -p 3000:3000 --name hw2-node vlad/hw2-node:1.0

    > hw2-docker-node@1.0.0 start
    > node server.js

    curl http://localhost:3000/
    {"message":"Hello from Node.js in Docker!"}
```

