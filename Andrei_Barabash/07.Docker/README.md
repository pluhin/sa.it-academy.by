## 1 Docker Installation and Basic Command

### 1 Install Docker on your local machine

```bash
sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu noble stable"

sudo apt install docker-ce

sudo systemctl status docker

# add user to group
sudo groupadd docker

sudo usermod -aG docker $USER
```

### 2 Verify the Docker installation

```bash
docker info

docker --version
```

### 3 Pull the official "hello-world" Docker image and run it

```bash
docker run hello-world

docker ps
```

## 2 Building a Docker Image with Dockerfile

```Dockerfile
FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["python3", "app.py"]
```

### 4 Build the Docker image 
```bash
docker build -t flaskapi:v1 .
```

### 5 Run a container based on the image
```bash
docker run -it --name flask_api -p 8080:8080 flaskapi:v1
```

### Access application
```bash
curl localhost:8080
```
