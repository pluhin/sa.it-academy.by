# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands

### Install Docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
docker --version
sudo usermod -aG docker misyukevich
newgrp docker
``` 
### Run "Hello from Docker" container

```bash
docker run hello-world

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

```bash
docker ps -a

CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
816a695d765d   hello-world   "/hello"   6 minutes ago   Exited (0) 6 minutes ago             distracted_gates

```

## Homework Assignment 2: Building a Docker Image with Dockerfile

[Dockerfile](./Dockerfile)

[Application](./myapp.py)

[Requirements](./requirements.txt)

```bash
docker build -t my-py-app .

[+] Building 20.8s (10/10) FINISHED                                                                                                        docker:default
 => [internal] load build definition from Dockerfile                                                                                                 0.0s
 => => transferring dockerfile: 221B                                                                                                                 0.0s
 => [internal] load metadata for docker.io/library/python:3.13.1-slim-bookworm                                                                       1.1s
 => [internal] load .dockerignore                                                                                                                    0.0s
 => => transferring context: 2B                                                                                                                      0.0s
 => [1/5] FROM docker.io/library/python:3.13.1-slim-bookworm@sha256:23a81be7b258c8f516f7a60e80943cace4350deb8204cf107c7993e343610d47                 0.0s
 => [internal] load build context                                                                                                                    0.0s
 => => transferring context: 104B                                                                                                                    0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                        0.0s
 => [3/5] COPY requirements.txt .                                                                                                                    0.1s
 => [4/5] RUN pip install --no-cache-dir -r requirements.txt                                                                                        18.8s
 => [5/5] COPY myapp.py .                                                                                                                            0.1s
 => exporting to image                                                                                                                               0.5s
 => => exporting layers                                                                                                                              0.4s
 => => writing image sha256:ef85939764cdbaa67e6d70ca34652d43f8cc738c0ac7202e9f013dbdd9da83ab                                                         0.0s
 => => naming to docker.io/library/my-py-app
```

```bash
docker run -d -p 5000:5000 --name PythonApp my-py-app
4a5d489cd58fd934bdd58fb9a1b1c806a669f393cc14b7f2e4d885254fe10515

docker ps

CONTAINER ID   IMAGE       COMMAND             CREATED         STATUS         PORTS                                       NAMES
4a5d489cd58f   my-py-app   "python myapp.py"   8 seconds ago   Up 6 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   PythonApp
```

```bash
curl -I http://127.0.0.1:5000

HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 13
Server: Werkzeug/2.0.3 Python/3.13.1
Date: Wed, 15 Jan 2025 19:27:37 GMT

```
