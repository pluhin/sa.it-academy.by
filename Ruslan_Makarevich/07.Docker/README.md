# HA1

## INSTALL DOCKER

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
```

## CHECK DOCKER VERSION

```bash
docker --version
Docker version 28.3.3, build 980b856
```

## PULL THE OFFICIAL "HELLO-WORLD" DOCKER IMAGE

```bash
docker pull hello-world

Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:ec153840d1e635ac434fab5e377081f17e0e15afab27beb3f726c3265039cfff
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest
```
## "HELLO-WORLD" DOCKER IMAGE RUN

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
```

## LIST THE RUNNING CONTAINERS

```bash
docker ps -a

CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
55131263054c   hello-world   "/hello"   6 minutes ago   Exited (0) 6 minutes ago             suspicious_shamir
80ae3b27224b   hello-world   "/hello"   6 days ago      Exited (0) 6 days ago                nice_lehmann
c8a57ae8dad8   hello-world   "/hello"   6 days ago      Exited (0) 6 days ago                strange_shaw
```

# HA2

## FLASK_APP.PY

```bash
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Docker and Flask!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

## REQUIREMENTS.TXT

```bash
flask
```

## DOCKERFILE

```bash
# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /my_flask_app

# Копируем файлы приложения
COPY flask_app.py .
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Указываем порт, который будет слушать приложение
EXPOSE 5000

# Команда запуска Flask-приложения
CMD ["python", "flask_app.py"]
```

## BUILD DOCKER-IMAGE

```bash
docker build -t flask-app .

[+] Building 1.2s (10/10) FINISHED                                                                                                                                            docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                    0.0s
 => => transferring dockerfile: 601B                                                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                     1.0s
 => [internal] load .dockerignore                                                                                                                                                       0.1s
 => => transferring context: 2B                                                                                                                                                         0.0s
 => [1/5] FROM docker.io/library/python:3.11-slim@sha256:0ce77749ac83174a31d5e107ce0cfa6b28a2fd6b0615e029d9d84b39c48976ee                                                               0.0s
 => [internal] load build context                                                                                                                                                       0.1s
 => => transferring context: 277B                                                                                                                                                       0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                                                           0.0s
 => CACHED [3/5] COPY flask_app.py .                                                                                                                                                    0.0s
 => CACHED [4/5] COPY requirements.txt .                                                                                                                                                0.0s
 => CACHED [5/5] RUN pip install --no-cache-dir -r requirements.txt                                                                                                                     0.0s
 => exporting to image                                                                                                                                                                  0.0s
 => => exporting layers                                                                                                                                                                 0.0s
 => => writing image sha256:2c31f86583d73a92a8537c832df1a127b82f84c26a52ee362f7ae34c08575c76                                                                                            0.0s
 => => naming to docker.io/library/flask-app
```

## DOCKER RUN

```bash
docker run -d -p 5000:5000 --name my_first_app flask-app
```

## ACCESS TO THE APPLICATION

```bash
curl http://localhost:5000

Hello from Docker and Flask!
```
## LIST THE RUNNING CONTAINERS

```bash
docker ps -a

CONTAINER ID   IMAGE         COMMAND                 CREATED             STATUS                         PORTS                                         NAMES
e9bb6fb48f66   flask-app     "python flask_app.py"   18 seconds ago      Up 17 seconds                  0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   my_first_app
55131263054c   hello-world   "/hello"                About an hour ago   Exited (0) About an hour ago                                                 suspicious_shamir
80ae3b27224b   hello-world   "/hello"                6 days ago          Exited (0) 6 days ago                                                        nice_lehmann
c8a57ae8dad8   hello-world   "/hello"                6 days ago          Exited (0) 6 days ago                                                        strange_shaw
```

## KILL (STOP) & DELETE CONTAINER

```bash
docker kill my_first_app

docker rm my_first_app

docker ps -a

CONTAINER ID   IMAGE         COMMAND    CREATED             STATUS                         PORTS     NAMES
55131263054c   hello-world   "/hello"   About an hour ago   Exited (0) About an hour ago             suspicious_shamir
80ae3b27224b   hello-world   "/hello"   6 days ago          Exited (0) 6 days ago                    nice_lehmann
c8a57ae8dad8   hello-world   "/hello"   6 days ago          Exited (0) 6 days ago                    strange_shaw
```

