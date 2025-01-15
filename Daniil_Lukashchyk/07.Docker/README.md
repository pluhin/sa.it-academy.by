# HA1:

## Docker Installation and Basic Commands 

```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb\_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
ip a
sudo nano /lib/systemd/system/docker.service
sudo usermod -aG docker ${user}
su - ${user}

```

### ps and version command results

```
docker --version
Docker version 27.4.1, build b9d17ea

docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
830fba11b698   hello-world   "/hello"   40 seconds ago   Exited (0) 39 seconds ago             zealous_nash

```

# HA2:

## Building a Docker Image with Dockerfile

```bash
mkdir Dokerfiles
touch Dockerfile
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
curl  http://localhost:5000/
Hello, World
```
