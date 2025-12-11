## Homework Assignment 1: Docker Installation and Basic Commands
```bash
maximus@Ubuntu24:~$ sudo apt-get update
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
docker --version
Docker version 28.5.1, build e180ab8
sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
17eec7bbc9d7: Already exists
Digest: sha256:56433a6be3fda188089fb548eae3d91df3ed0d6589f7c2656121b911198df065
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

sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
## Homework Assignment 2: Building a Docker Image with Dockerfile
```bash
docker build -t simple-node-app 
~~~~
[+] Building 8.3s (10/10) FINISHED                                                                                                             docker:default
 => [internal] load build definition from Dockerfile                                                                                                     0.1s
 => => transferring dockerfile: 169B                                                                                                                     0.0s
 => [internal] load metadata for docker.io/library/node:18-alpine                                                                                        0.9s
 => [internal] load .dockerignore                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                          0.0s
 => [1/5] FROM docker.io/library/node:18-alpine@sha256:8d6421d663b4c28fd3ebc498332f249011d118945588d0a35cb9bc4b8ca09d9e                                  0.0s
 => [internal] load build context                                                                                                                        0.1s
 => => transferring context: 713B                                                                                                                        0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                            0.0s
 => [3/5] COPY package.json ./                                                                                                                           0.1s
 => [4/5] RUN npm install --only=production                                                                                                              6.5s
 => [5/5] COPY . .                                                                                                                                       0.1s
 => exporting to image                                                                                                                                   0.3s
 => => exporting layers                                                                                                                                  0.3s
 => => writing image sha256:577833b1b7bf8c3d8bdefcdf170dbfe6b746db4725a1f416b816544fb598df1f                                                             0.0s
 => => naming to docker.io/library/simple-node-app   
 
docker run -d -p 3000:3000 --name my-app simple-node-app
2af24b6e691c6f265130ef816ec58286a783f78b2f067c31d2e3968ac0b8f15f
curl http://localhost:3000
<h1>Hello from Docker! 🐳</h1><p>Node.js app is running in container</p>
```