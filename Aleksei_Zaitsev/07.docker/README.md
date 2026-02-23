# 07. Docker

```bash
mkdir 07.docker
cd 07.docker/
git checkout -b 07.docker
git branch
# Install Docker on your local machine or a virtual environment.
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
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
newgrp docker
# Verify the Docker installation by running the docker --version command.
docker --version
# Pull the official "hello-world" Docker image and run a container based on it.
docker run hello-world
# List the running containers using the docker ps command.
docker ps
# https://docs.docker.com/engine/install/ubuntu/

# Create a new directory for your Dockerfile and application code.



docker login -u zaits3v

nano README.md
```