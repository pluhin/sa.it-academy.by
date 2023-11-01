# 07. Docker
---

## 1: Docker Installation and Basic Commands

Installing Docker

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
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
Docker version 24.0.6, build ed223bc
```

Pulling the official "hello-world" Docker image

```bash
docker run hello-world
docker ps -a
```

Output

```bash
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
bb617f47f4bf   hello-world   "/hello"   17 minutes ago   Exited (0) 17 minutes ago             confident_ganguly
```

## 2: Building a Docker Image with Dockerfile

simpleFlaskApp.py

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '<h1>Hello, World!</h1>'

if __name__ == '__main__':
    app.run(debug=True)
```

requirements.txt

```
Flask==2.1.3
Werkzeug==2.0.2
```

Dockerfile

```bash
FROM python:3.9
WORKDIR /home/goshaker/07.Docker
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python3", "simpleFlaskApp.py"]
```

Building image

```bash
docker build -t app:v1 -f Dockerfile .
```

Running image

```bash
docker run -p 5000:5000 app:v1
```