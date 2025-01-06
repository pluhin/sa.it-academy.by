# 07.Docker

## Homework Assignment 1: Docker Installation and Basic Commands

```bash
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
sudo usermod -aG docker pavel

docker --version
docker run hello-world
docker ps
docker ps -a
docker images
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

```bash
vim app.py
vim requirements.txt
vim Dockerfile
ll
docker build -t web-app .
docker ps
docker images
docker run web-app:latest
docker run -d web-app:latest
docker ps
curl localhost:5000
ss -tlpn
docker stop friendly_rubin
docker rm friendly_rubin
docker run -d -p 5000:5000 --name web-app web-app:latest
docker ps
curl localhost:5000
```