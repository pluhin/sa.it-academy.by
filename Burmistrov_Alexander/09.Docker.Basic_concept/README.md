# 09. Docker. Basic concept

## Homework Assignment 1: Docker Installation and Basic Commands

```bash 
  # Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

  443  docker --version
  444  docker run --name="Hello_world" hello_world
  445  docker run --name="Hello_world" hello-world
  446  docker ps
  CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
  447  docker ps -a
  CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
c12043faa98a   hello-world   "/hello"   8 seconds ago   Exited (0) 7 seconds ago             Hello_world
  ```

## Homework Assignment 2: Building a Docker Image with Dockerfile

```bash
  470  docker build -t flask-app-hw-2 .
  481  docker run -d --rm -p 5000:5000 --name="Flask_Hello" flask-app-hw-2:latest
[root HW-2] # docker ps
CONTAINER ID   IMAGE                   COMMAND           CREATED              STATUS              PORTS                                         NAMES
2861aa10ed6c   flask-app-hw-2:latest   "python app.py"   About a minute ago   Up About a minute   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   Flask_Hello
[root HW-2] # curl 127.0.0.1:5000
Hello! This Flask in Docker! 🚀#    
```

## Homework Assignment 3: Docker build automation (github action)

Многоэтапная сборка Docker позволяет очистить финальный образ от лишнего мусора, что повышает удобство отладки и безопасность самого образа, т.к. для финального образа можно выбрать абсолютно минимальный Scratch-образ и том числе сэкономить на итоговом весе Image