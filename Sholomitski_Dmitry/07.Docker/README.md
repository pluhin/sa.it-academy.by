### Homework Assignment 1: Docker Installation and Basic Commands

#### Install Docker on your local machine or a virtual environment

```bash
  966  # Add Docker's official GPG key:
  967  sudo apt-get update
  968  sudo apt-get install ca-certificates curl
  969  sudo install -m 0755 -d /etc/apt/keyrings
  970  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  971  sudo chmod a+r /etc/apt/keyrings/docker.asc
  972  # Add the repository to Apt sources:
  973  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  974  sudo apt-get update
  975  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### Verify the Docker installation by running the docker --version command

```bash
xaos@ancible20:~/docker$ docker --version
Docker version 27.4.1, build b9d17ea
```

#### Pull the official "hello-world" Docker image and run a container based on it

```bash
xaos@ancible20:~/docker$ sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
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

#### List the running containers using the docker ps command

```bash
xaos@ancible20:~/docker$ sudo docker ps
[sudo] password for xaos:
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

##### All containers

```bash
xaos@ancible20:~/docker$ sudo docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
8d92ad9c594e   hello-world   "/hello"   25 minutes ago   Exited (0) 25 minutes ago             dreamy_meitner
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

Write a [Dockerfile](docker/Dockerfile) to build an image for a [simple web application on flask](docker/app.app.py)

```bash
xaos@ancible20:~/docker$ sudo docker build -t flask-docker-app .
[+] Building 5.6s (10/10) FINISHED                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                         0.0s
 => => transferring dockerfile: 278B                                                                                         0.0s
 => [internal] load metadata for docker.io/library/python:3.10-slim-bullseye                                                 1.5s
 => [internal] load .dockerignore                                                                                            0.0s
 => => transferring context: 2B                                                                                              0.0s
 => [1/5] FROM docker.io/library/python:3.10-slim-bullseye@sha256:56fdfc406fdcab116f050b925ad74c9025cddf7bfe063994fd41283c6  0.0s
 => [internal] load build context                                                                                            0.0s
 => => transferring context: 1.23kB                                                                                          0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                0.0s
 => [3/5] COPY ./app .                                                                                                       0.0s
 => [4/5] COPY requirements.txt requirements.txt                                                                             0.0s
 => [5/5] RUN pip install --no-cache-dir -r ./requirements.txt                                                               3.8s
 => exporting to image                                                                                                       0.1s
 => => exporting layers                                                                                                      0.1s
 => => writing image sha256:9cf6d62f7d593f0f8856759fa9e8c313c985f8d97b007f4c4fde33d3b779667a                                 0.0s
 => => naming to docker.io/library/flask-docker-app                                                                          0.0s
xaos@ancible20:~/docker$ sudo docker run -p 5000:5000 flask-docker-app
 * Serving Flask app 'app.py'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
172.17.0.1 - - [04/Jan/2025 23:10:21] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:28] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:28] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:28] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:28] "GET /favicon.ico HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:29] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:29] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:29] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:30] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:30] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:30] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:31] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "GET / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "HEAD / HTTP/1.1" 200 -
192.168.56.1 - - [04/Jan/2025 23:10:32] "GET /robots.txt HTTP/1.1" 404 -
192.168.56.1 - - [04/Jan/2025 23:11:36] "GET / HTTP/1.1" 200 -
```

## Cheking that container is runnnig and application is working

```bash
xaos@ancible20:~/docker$ sudo docker ps
CONTAINER ID   IMAGE              COMMAND       CREATED          STATUS          PORTS                                       NAMES
acfda7eb3627   flask-docker-app   "flask run"   18 minutes ago   Up 18 minutes   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   determined_roentgen
```

```bash
curl 192.168.56.20:5000
Hello, World!%

xaos@ancible20:~/docker$ curl 127.0.0.1:5000
Hello, World!

xaos@ancible20:~/docker$
```
