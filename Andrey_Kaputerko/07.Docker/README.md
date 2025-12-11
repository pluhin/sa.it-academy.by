# Homework Assignment 1: Docker Installation and Basic Commands

## Install Docker on your local machine or a virtual environment.

### Steps:
##### Update system and install docker package.

``` bash
sudo pacman -Syu
sudo pacman -S docker
```

##### Enable docker service.

``` bash
systemctl start docker.service
systemctl enable docker.service
systemctl status docker.service
```

## Verify the Docker installation by running the docker --version command.
##### Run command and see the output.

``` output
Docker version 28.5.1, build e180ab8
```

## Pull the official "hello-world" Docker image and run a container based on it.

### Steps:
##### Pull and run image.

``` bash
docker pull hello-world
docker run hello-world
```

##### See the output.

``` output
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

### Steps:
##### list all running containers.

``` bash
docker ps
```

###### (there is no containers running for me)
##### (optional step) delete hello-world container and image:

``` bash
docker ps -a
docker rm {container-name}
docker rmi hello-world
```

# Homework Assignment 2: Building a Docker Image with Dockerfile

## Create a new directory for your Dockerfile and application code.

### Steps:
##### Create a directory and enter it.
``` bash
mkdir DockerDemo && cd DockerDemo
```

## Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).

### Steps:
##### Choose an image for web app(in my case it was FLask).
```dockerfile
FROM python:3.9-slim
```

##### Config for install requirements for flask app.
```dockerfile
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
```

##### Create simple flask app.
###### app.py
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Docker!'
```
###### requirements.txt
```python
Flask==2.3.3
```

## Copy your application code into the image and set the necessary environment.

### Steps:
##### Copy app code into image, set environment and choose port for our container app.
```dockerfile
COPY . .
EXPOSE 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["flask", "run"]
```

## Build the Docker image using the docker build command.

##### build image with `docker build`.
``` bash
docker build -t webapp .
```

## Run a container based on the image and access the web application.

### Steps:
##### Run docker image with access port 5000.
```bash
docker run -p 5000:5000 webapp
```
