# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands
1. Go to:  https://docs.docker.com/engine/install/debian/
2. Follow the instruction:
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
3. Execute: ```docker --version```
```bash
Output:Docker version 28.0.4, build b8034c0
```
4.  Pull the official "hello-world" Docker image and run a container based on it.
```bash

> sudo docker run hello-world

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

5. List of containers.
```bash
debian@vbox ~/i/07.Docker (master)> docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
70331da05011   hello-world   "/hello"   2 minutes ago    Exited (0) 2 minutes ago              recursing_bose
8d2519c9321e   hello-world   "/hello"   15 minutes ago   Exited (0) 15 minutes ago             keen_moore
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

### Staructure of project
.  
|-- app.py  
|-- Dockerfile  
|-- requirements.txt  
|-- nginx.conf
1. Create the files mentioned above.
2. Run build:
```docker build -t flask-nginx-debian . ```  
Porgress:   
```bash
[+] Building 186.1s (12/12) FINISHED                                                                                                                                                      docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                0.0s
 => => transferring dockerfile: 539B                                                                                                                                                                0.0s 
 => [internal] load metadata for docker.io/library/debian:bullseye                                                                                                                                  1.5s 
 => [internal] load .dockerignore                                                                                                                                                                   0.1s
 => => transferring context: 2B                                                                                                                                                                     0.0s 
 => CACHED [1/7] FROM docker.io/library/debian:bullseye@sha256:aa5332dbbec7ff8cdf7dfb8b467c6ac2d55419104af1e49b6f1c22b996da391b                                                                     0.0s
 => [internal] load build context                                                                                                                                                                   0.1s 
 => => transferring context: 92B                                                                                                                                                                    0.0s 
 => [2/7] RUN apt-get update && apt-get install -y python3 python3-pip nginx && apt-get clean && rm -rf /var/lib/apt/lists/*                                                                      151.5s 
 => [3/7] COPY requirements.txt .                                                                                                                                                                   0.3s
 => [4/7] RUN pip3 install --no-cache-dir -r requirements.txt                                                                                                                                      10.1s
 => [5/7] COPY app.py /app/app.py                                                                                                                                                                   0.5s
 => [6/7] COPY nginx.conf /etc/nginx/nginx.conf                                                                                                                                                     0.2s
 => [7/7] WORKDIR /app                                                                                                                                                                              0.2s
 => exporting to image                                                                                                                                                                             21.1s
 => => exporting layers                                                                                                                                                                            21.0s
 => => writing image sha256:ad20c12521cee087bb2881d8d336e6446de269cb0c9aa55be690e318dcbc54d1                                                                                                        0.0s
 => => naming to docker.io/library/flask-nginx-debian                                                                                                                                               0.0s

 1 warning found (use docker --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 20)
```
3. Run container:  
```docker run -d -p 8080:80 flask-nginx-debian```
```bash 
debian@vbox ~/i/07.Docker (master)> docker run -d -p 8080:80 flask-nginx-debian
0332ae55ae2c357c2291a3791f4bba2a7971187cdc0aa05de6659fb8ba160d92
  
debian@vbox ~/i/07.Docker (master)> docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                                     NAMES
0332ae55ae2c   flask-nginx-debian   "/bin/sh -c 'service…"   13 seconds ago   Up 12 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   intelligent_driscoll
```
4. Check app:
```bash
debian@vbox ~/i/07.Docker (master)> curl http://localhost:8080
Hello from Flask!⏎                                                          
 ```
