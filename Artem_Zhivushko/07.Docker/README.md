## Homework Assignment 1: Docker Installation and Basic Commands

### 1. Install Docker on your local machine or a virtual environment.

After downloading [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe) , run the following command in a terminal to install Docker Desktop:

```shell
"Docker Desktop Installer.exe" install
```

And PowerShell command run:

```powershell
Start-Process 'Docker Desktop Installer.exe' -Wait install
```

### 1. Verify the Docker installation by running the `docker --version` command.

#### Check `docker --version` Windows in powershell

```shell
 ~  docker --version


Docker version 25.0.2, build 29cf629
```

```shell
 ~  docker version


Client:
 Cloud integration: v1.0.35+desktop.10
 Version:           25.0.2
 API version:       1.44
 Go version:        go1.21.6
 Git commit:        29cf629
 Built:             Thu Feb  1 00:24:09 2024
 OS/Arch:           windows/amd64
 Context:           default

Server: Docker Desktop 4.27.1 (136059)
 Engine:
  Version:          25.0.2
  API version:      1.44 (minimum version 1.24)
  Go version:       go1.21.6
  Git commit:       fce6e0c
  Built:            Thu Feb  1 00:23:17 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.28
  GitCommit:        ae07eda36dd25f8a1b98dfbf587313b99c0190bb
 runc:
  Version:          1.1.12
  GitCommit:        v1.1.12-0-g51d5e94
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

```shell
 ~  docker compose version


Docker Compose version v2.24.3-desktop.1
```

#### Check `docker --version` Windows in wsl

```bash
⋊> ~ docker --version


Docker version 25.0.2, build 29cf629
```

```bash
⋊> ~ docker version


Client:
 Cloud integration: v1.0.35+desktop.10
 Version:           25.0.2
 API version:       1.44
 Go version:        go1.21.6
 Git commit:        29cf629
 Built:             Thu Feb  1 00:22:06 2024
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Desktop
 Engine:
  Version:          25.0.2
  API version:      1.44 (minimum version 1.24)
  Go version:       go1.21.6
  Git commit:       fce6e0c
  Built:            Thu Feb  1 00:23:17 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.28
  GitCommit:        ae07eda36dd25f8a1b98dfbf587313b99c0190bb
 runc:
  Version:          1.1.12
  GitCommit:        v1.1.12-0-g51d5e94
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

```bash
⋊> ~ docker compose version


Docker Compose version v2.24.3-desktop.1
```

### 1. Pull the official "hello-world" Docker image and run a container based on it.

```bash
⋊> ~ docker run hello-world


Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete
Digest: sha256:4bd78111b6914a99dbc560e6a20eab57ff6655aea4a80c50b0c5491968cbc2e6
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

### 1. List the running containers using the `docker ps` command.

```bash
⋊> ~ docker ps


CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

```bash
⋊> ~ docker ps --all


CONTAINER ID   IMAGE          COMMAND                   CREATED          STATUS                       PORTS     NAMES
c5cda25286e8   hello-world    "/hello"                  53 seconds ago   Exited (0) 52 seconds ago              elegant_driscoll
e2cf1186dfd8   mysql:latest   "docker-entrypoint.s…"    10 months ago    Exited (0) 10 months ago               happy_hofstadter
8f0616d15931   alpine/git     "git clone \\ https:/…"   13 months ago    Exited (128) 13 months ago             repo
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

### 1. Create a new directory for your Dockerfile and application code.

```bash
⋊> /m/c/s/my-study on ZhivArt-work ◦ mkdir -p ./Artem_Zhivushko/07.Docker
⋊> /m/c/s/m/A/07.Docker on ZhivArt-work ◦ touch README.md
⋊> /m/c/s/my-study on ZhivArt-work ◦ mkdir -p ./Artem_Zhivushko/07.Docker/dockefiles
```

Clone the repository https://github.com/AKSarav/login-form-app-sample.git to `./07.Docker/dockefiles/`

### 1. Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).

```dockerfile
FROM python:alpine

LABEL maintainer="zhiv-art@yandex.com"

RUN apk update && apk upgrade && apk add bash && apk add --update --no-cache python3
RUN ln -sf python3 /usr/bin/python && python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY ./login-form-app-sample /app
WORKDIR /app

RUN pip install -r requirements.txt
 
CMD python3 -m flask run --host 0.0.0.0
```

### 1. Copy your application code into the image and set the necessary environment.
### 2. Build the Docker image using the `docker build` command.

```bash
⋊> /m/c/s/my-study on ZhivArt-work ◦ docker build -t test-app-flask ./Artem_Zhivushko/07.Docker/dockefiles/


[+] Building 0.7s (12/12) FINISHED                                                                                                                                                    docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                            0.0s
 => => transferring dockerfile: 707B                                                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/python:alpine                                                                                                                                0.6s
 => [internal] load .dockerignore                                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                                 0.0s
 => [1/7] FROM docker.io/library/python:alpine@sha256:1a0501213b470de000d8432b3caab9d8de5489e9443c2cc7ccaa6b0aa5c3148e                                                                          0.0s
 => [internal] load build context                                                                                                                                                               0.1s
 => => transferring context: 646B                                                                                                                                                               0.1s
 => CACHED [2/7] RUN apk update && apk upgrade && apk add bash && apk add --update --no-cache python3                                                                                           0.0s
 => CACHED [3/7] RUN ln -sf python3 /usr/bin/python && python3 -m ensurepip                                                                                                                     0.0s
 => CACHED [4/7] RUN pip3 install --no-cache --upgrade pip setuptools                                                                                                                           0.0s
 => CACHED [5/7] COPY ./login-form-app-sample /app                                                                                                                                              0.0s
 => CACHED [6/7] WORKDIR /app                                                                                                                                                                   0.0s
 => CACHED [7/7] RUN pip install -r requirements.txt                                                                                                                                            0.0s
 => exporting to image                                                                                                                                                                          0.0s
 => => exporting layers                                                                                                                                                                         0.0s
 => => writing image sha256:5236f4236868ed33509540a08aff57e27aea73cc086c7b08d72a585d680c09dc                                                                                                    0.0s
 => => naming to docker.io/library/test-app-flask                                                                                                                                               0.0s

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
```

```bash
⋊> /m/c/s/my-study on ZhivArt-work ◦ docker images


REPOSITORY            TAG       IMAGE ID       CREATED          SIZE
test-app-flask        latest    5236f4236868   23 minutes ago   117MB
hello-world           latest    d2c94e258dcb   9 months ago     13.3kB
mysql                 latest    483a8bc460a9   10 months ago    530MB
opensuse/tumbleweed   latest    898b158e324b   12 months ago    98.1MB
alpine                latest    042a816809aa   13 months ago    7.05MB
alpine/git            latest    22d84a66cda4   14 months ago    43.6MB
```

### 3. Run a container based on the image and access the web application.

```bash
⋊> /m/c/s/my-study on ZhivArt-work ◦ docker run -p 5000:5000 test-app-flask


 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
172.17.0.1 - - [08/Feb/2024 09:46:36] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [08/Feb/2024 09:46:36] "GET /static/heart.png HTTP/1.1" 200 -
172.17.0.1 - - [08/Feb/2024 09:46:37] "GET /favicon.ico HTTP/1.1" 404 -
172.17.0.1 - - [08/Feb/2024 09:47:02] "POST / HTTP/1.1" 401 -
172.17.0.1 - - [08/Feb/2024 09:47:02] "GET /static/heart.png HTTP/1.1" 304 -
```

```bash
⋊> /m/c/s/my-study on ZhivArt-work ◦ curl http://127.0.0.1:5000


<html>
  <head>
    <title>Form based App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
  body{
    padding: 20vh;
  }
</style>
  </head>
  <body>
    <div class="container">
      <h3>Sample Application for Form based Login/Authentication</h3>
      <br>
      <form action="" method="post">
        <input type="text" placeholder="Username" name="username" value="">
         <input type="password" placeholder="Password" name="password" value="">
        <input class="btn btn-default" type="submit" value="Login">
      </form>

      <hr></hr>
      <p style="color: gray">Designed with <img src="/static/heart.png"></img> by DevopsJunction.com</p>
    </div>
  </body>
</html>⏎
```
