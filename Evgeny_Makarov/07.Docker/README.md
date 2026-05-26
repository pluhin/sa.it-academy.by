# 07.Docker

### Assignment 1:
```
docker --version
Docker version 29.4.3, build 055a478
```

```
docker run hello-world

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

```
docker images
                                                                                                                          i Info →   U  In Use
IMAGE                                                                                         ID             DISK USAGE   CONTENT SIZE   EXTRA
hello-world:latest                                                                            0e760fdfbc48       22.6kB         10.3kB    U   
```

### Assignment 2:
#### app.py
- simple web application
- http://localhost:8080 returns "Hello from Docker!"
- Listens on port 5000 on all network interfaces (0.0.0.0)

#### requirements.txt
Contains dependencies
`Flask=3.1.1.`

#### Build the image
`docker build -t flask-app .`

#### Access the app
`docker run -d -p 8080:5000 --name flask-container flask-app`
`curl http://localhost:8080` returns "Hello from Docker!"

#### History
```
mkdir 07.Docker && cd 07.Docker
docker --version
vim app.py
mkdir flask-app && mv app.py flask-app
cd flask-app
ls
vim requirements.txt
vim Dockerfile
docker build -t flask-app .
docker run -d -p 8080:5000 --name flask-container flask-app
```