
 # Home task 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands

```bash
  215  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  216  sudo apt-get update
  217  sudo apt-get install ca-certificates curl
  218  sudo install -m 0755 -d /etc/apt/keyrings
  219  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  220  sudo chmod a+r /etc/apt/keyrings/docker.asc
  221  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  222    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  223  sudo apt-get update
  224  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  225  sudo usermod -aG docker $USER
  226  logout
  227  docker
  228  docker ps
  230  docker --version
  231  docker version
  232  sudo docker run hello-world
```

Result:
```bash
docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

docker version
Client: Docker Engine - Community
 Version:           26.1.4
 API version:       1.45
 Go version:        go1.21.11
 Git commit:        5650f9b
 Built:             Wed Jun  5 11:28:57 2024
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          26.1.4
  API version:      1.45 (minimum version 1.24)
  Go version:       go1.21.11
  Git commit:       de5c9cf
  Built:            Wed Jun  5 11:28:57 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.33
  GitCommit:        d2d58213f83a351ca8f528a95fbd145f5654e957
 runc:
  Version:          1.1.12
  GitCommit:        v1.1.12-0-g51d5e94
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
  
docker images
REPOSITORY    TAG       IMAGE ID       CREATED             SIZE
hello-world   latest    d2c94e258dcb   13 months ago       13.3kB
```
## Homework Assignment 2: Building a Docker Image with Dockerfile

app.py
```bash
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, world!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
```

requirements.txt
```bash
flask==2.2.2
```

Dockerfile
```bash
FROM python:3.7.9-slim-stretch

RUN mkdir /app

# Установите рабочую директорию в /app
WORKDIR /app

COPY app.py /app/
COPY requirements.txt /app/

# Установите необходимые зависимости
RUN python -m pip install -r /app/requirements.txt

# Сделайте порт 5000 доступным вне контейнера
EXPOSE 5000

ENTRYPOINT ["python", "app.py"]
```

Result:
```bash
mkdir my_project
cd my_project

docker build -t flask_app .
docker run -d -p 5000:5000 --name mycontainer flask_app

docker ps
CONTAINER ID   IMAGE       COMMAND           CREATED          STATUS          PORTS                                       NAMES
4526a29d6b2d   flask_app   "python app.py"   18 seconds ago   Up 16 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   mycontainer

 docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
flask_app     latest    a43a5e2ec085   20 minutes ago   108MB
hello-world   latest    d2c94e258dcb   13 months ago    13.3kB

curl http://localhost:5000
Hello, world!vmuser@vm2:~/07.Docker/my_project$
```
