# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands

#### 1. Install Docker on your local machine or a virtual environment.

__Input__
```
sudo apt update
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable docker
sudo usermod -aG docker $USER
```
### 2. Verify the Docker installation by running the docker --version command.

__Input__
```
docker --version
```
__Output__ 
```
Docker version 28.5.1, build e180ab8
```

### 3. Pull the official "hello-world" Docker image and run a container based on it.

__Input__
```
docker pull hello-world
```
__Output __
```
Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:56433a6be3fda188089fb548eae3d91df3ed0d6589f7c2656121b911198df065
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest
```
__Input__
```
docker run hello-world
```
__Output__
```
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
### 4. List the running containers using the docker ps command.

__Input__
```
docker ps
```
__Output__
```
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
__Input__
```
docker ps -a
```
__Output__
```
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS                     PORTS     NAMES
4a0c14672deb   hello-world   "/hello"                 2 minutes ago   Exited (0) 2 minutes ago             agitated_noether
c077ffef13d3   nginx         "/docker-entrypoint.…"   2 days ago      Exited (127) 2 days ago              goofy_carver
9ef2b2feef04   hello-world   "/hello"                 3 days ago      Exited (0) 3 days ago                vigorous_swirles
```


## Homework Assignment 2: Building a Docker Image with Dockerfile

### 1. Create a new directory for your Dockerfile and application code.

__Input__

```
cd 07.Docker/
mkdir flask-docker-app
cd flask-docker-app
```

2. Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).
3. Copy your application code into the image and set the necessary environment.

__Output Dockerfile__
```
# Base Python image
FROM python:3.11-slim

# Working directory inside the container
WORKDIR /app

# Installing dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copying application code
COPY app.py .

# Opening port
EXPOSE 5000

# Run command
CMD ["python", "app.py"]
```

### 4. Build the Docker image using the docker build command.

__Input __
```
docker build -t flask-docker-app .
```
__Output__
```
[+] Building 16.0s (10/10) FINISHED                                                                                                                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                    0.0s
 => => transferring dockerfile: 348B                                                                                                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                                                                     1.9s
 => [internal] load .dockerignore                                                                                                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                                                                                                         0.0s
 => [1/5] FROM docker.io/library/python:3.11-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617                                                                                                               1.9s
 => => resolve docker.io/library/python:3.11-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617                                                                                                               0.0s
 => => sha256:a9ffe18d7fdb9bb2f5b878fdc08887ef2d9644c86f5d4e07cc2e80b783fbea04 1.29MB / 1.29MB                                                                                                                                          0.4s
 => => sha256:e73850a50582f63498f7551a987cc493e848413fcae176379acff9144341f77f 14.36MB / 14.36MB                                                                                                                                        1.2s
 => => sha256:19fb8589da0207a0e7d3baa0c1b71a67136b1ad06c4b2e65cc771664592e6d9e 249B / 249B                                                                                                                                              0.6s
 => => sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617 10.37kB / 10.37kB                                                                                                                                        0.0s
 => => sha256:a0e69305a97c7eaa814e4a983585e779106daa209ed1f3495902f2e0d938a6f1 1.75kB / 1.75kB                                                                                                                                          0.0s
 => => sha256:ff15e80be861655d8eaf4fe97b2b83d7003c34119848f2febd31bd84406c92bb 5.38kB / 5.38kB                                                                                                                                          0.0s
 => => extracting sha256:a9ffe18d7fdb9bb2f5b878fdc08887ef2d9644c86f5d4e07cc2e80b783fbea04                                                                                                                                               0.1s
 => => extracting sha256:e73850a50582f63498f7551a987cc493e848413fcae176379acff9144341f77f                                                                                                                                               0.6s
 => => extracting sha256:19fb8589da0207a0e7d3baa0c1b71a67136b1ad06c4b2e65cc771664592e6d9e                                                                                                                                               0.0s
 => [internal] load build context                                                                                                                                                                                                       0.0s
 => => transferring context: 285B                                                                                                                                                                                                       0.0s
 => [2/5] WORKDIR /app                                                                                                                                                                                                                  2.4s
 => [3/5] COPY requirements.txt .                                                                                                                                                                                                       0.3s
 => [4/5] RUN pip install --no-cache-dir -r requirements.txt                                                                                                                                                                            8.4s
 => [5/5] COPY app.py .                                                                                                                                                                                                                 0.6s
 => exporting to image                                                                                                                                                                                                                  0.2s
 => => exporting layers                                                                                                                                                                                                                 0.2s
 => => writing image sha256:895c97b8761d1a654112979f4470b6edecce9760fcf969d4704875df9a0f00f1                                                                                                                                            0.0s
 => => naming to docker.io/library/flask-docker-app                                                                                                                                                                                     0.0s
```
### 5. Run a container based on the image and access the web application.

__Input__
```
docker run -d -p 5000:5000 flask-docker-app
```
__Output__
```
232e331a3762b8699b62576b0935fb84ca6da7baa82a65a1bcd2748b0a8de9b6
```
__Input__
```
curl http://localhost:5000
```
__Output__
```
Greetings from the Flask container!
```