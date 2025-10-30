## Homework Assignment 1: Docker Installation and Basic Commands
### 1. Install Docker

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

### 2. Verify the Docker installation

```bash
docker --version
```

### 3. Pull the official "hello-world" Docker image and run a container based on it.

```bash
docker pull hello-world
docker run hello-world
```

### 4. List the running containers

```bash
docker ps
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

### Files

- `Dockerfile` - image build instructions
- `app.py` - simple Flask app
- `requirements.txt` - python dependencies

### Quick Start

#### 1. Build image:
```bash
docker build -t my-hello-world .
```
#### 2. Run container:
```bash
docker run -d -p 5000:5000 my-hello-world
```
#### 3.Test:
```bash
curl http://localhost:5000/
```
