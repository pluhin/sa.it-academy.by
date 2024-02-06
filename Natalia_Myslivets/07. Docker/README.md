# HA1:

## Docker Installation and Basic Commands 

```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

sudo usermod -aG docker ${USER}
su - ${USER}
docker run hello-world
```

### ps and version command results

```
docker --version
Docker version 25.0.2, build 29cf629

docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
6e9c15d5c425   hello-world   "/hello"   7 minutes ago    Exited (0) 7 minutes ago              musing_carver
d7170bb40648   hello-world   "/hello"   14 minutes ago   Exited (0) 14 minutes ago             bold_edison
```

# HA2:

## Building a Docker Image with Dockerfile

```bash
mkdir docker_lab
touch DockerFile
```
# Dockerfile

```Dockerfile

FROM python:latest
RUN pip3 install Flask
RUN mkdir /app
COPY app.py /app
EXPOSE 5000
CMD ["flask","--app","/app/app.py","run","--host=0.0.0.0"]
```

### app

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World"

```

```bash
docker build . -t flask-app
docker run -d -p 5000:5000 --name flask-app-01 flask-app
docker s
docker ps
curl  http://localhost:5000/
```

### answer

```bash
vagrant@srv01:~/docker_lab$ curl  http://localhost:5000/
Hello, World
```
