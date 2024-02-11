# 07. Docker
---

## 1: Docker Installation and Basic Commands

Installing Docker

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Verifying Docker version and add user to group
```bash
docker --version
sudo usermod -aG docker ${USER}
reboot
```

Output

```bash
Docker version 25.0.2, build 29cf629
```

Pulling the official "hello-world" Docker image

```bash
docker run hello-world
docker ps -a
```

Output

```bash
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
df36d7a48aa1   hello-world   "/hello"   18 seconds ago   Exited (0) 17 seconds ago             sweet_williams
```

## 2: Building a Docker Image with Dockerfile

Making directory for simple flask application

```bash
mkdir 07.Docker
cd 07.Docker
mkdir simple_flask_app
```

Setting up virtual environment for flask app

```bash
sudo apt install python3-virtualenv
virtualenv venv
source venv/bin/activate
pip install flask
pip freeze > simple_flask_app/requirements.txt
vim simple_flask_app/flask_app.py
```

flask_app.py

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
  return '<h1>My flask application in Docker</h2>'

if __name__ == '__main__':
  app.run(debug=True,host='0.0.0.0')
```

requirements.txt

```bash
blinker==1.7.0
click==8.1.7
Flask==3.0.2
itsdangerous==2.1.2
Jinja2==3.1.3
MarkupSafe==2.1.5
Werkzeug==3.0.1
```

Dockerfile

```bash
FROM python:3.10-slim-buster

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python3", "flask_app.py"]
```

Had some problems with pip install in Dockerfile. The solution

```bash
sudo vim /etc/default/docker
```

Add the following setting:

```bash
DOCKER_OPTS="--dns 8.8.8.8"
```

And restart docker daemon

```bash
sudo systemctl restart docker
```

Building image

```bash
docker build -t app:v1 -f Dockerfile .
```

Running image

```bash
docker run -p 5000:5000 app:v1
```

Making ssh tunnel to the host

```bash
ssh -L 5000:127.0.0.1:5000 goshaker@192.168.211.132 -f -N
```

Screenshot of the webpage

![Webpage Screenshot](https://github.com/Goshaker/DevOpsCourse/blob/master/07.Docker/Screen_of_webpage.png)