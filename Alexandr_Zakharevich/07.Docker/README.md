# 07.Docker

### Homework Assignment 1: Docker Installation and Basic Commands
```bash
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl status docker.service 
docker --version
Docker version 29.4.3, build 055a478
usermod -aG docker $USER
newgrp docker
docker pull hello-world
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

docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
1aa319ace0a4   hello-world   "/hello"   55 seconds ago   Exited (0) 54 seconds ago             stupefied_carver
fc7c08be07d9   hello-world   "/hello"   36 minutes ago   Exited (0) 36 minutes ago             laughing_swirles
aa79643c1a94   hello-world   "/hello"   42 minutes ago   Exited (0) 42 minutes ago             cranky_satoshi
```

### Homework Assignment 2: Building a Docker Image with Dockerfile

#### Структура проекта
```
07.Docker/
├── flask-app/
│ ├── Dockerfile # Инструкции для сборки образа
│ ├── app.py # Код веб-приложения Flask
│ └── requirements.txt # Зависимости Python
└── README.md # Документация
```

`app.py`
- Создаёт минимальный веб-сервер на Flask
- При обращении к http://localhost:5000 возвращает приветствие с именем хоста контейнера
- Слушает порт 5000 на всех сетевых интерфейсах (0.0.0.0)

`requirements.txt` - cодержит зависимости, необходимые для работы приложения.

#### Сборка Docker-образа
```
cd flask-app
docker build -t my-flask-app:latest .
```

#### Запуск контейнера
```
docker run -d -p 8080:5000 --name my-flask-container-e CONTAINER_NAME="my-flask-container" my-flask-app:latest
```

#### Проверка работы приложения
```
curl http://localhost:8080
```
Вывод:
Hello from Docker! Container hostname: my-flask-container