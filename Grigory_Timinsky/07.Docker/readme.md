# Task 1 Docker Installation and Basic Commands

```bash
  122  sudo apt-get update
  123  sudo apt-get install ca-certificates curl
  124  sudo install -m 0755 -d /etc/apt/keyrings
  125  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  126  sudo chmod a+r /etc/apt/keyrings/docker.asc
  127  # Add the repository to Apt sources:
  128  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  129  sudo apt-get update
  130  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  132  systemctl status docker.service
  134  sudo docker pull hello-world
  136  sudo docker run hello-world
  137  sudo docker ps
```


# Task 2 Building a Docker Image with Dockerfile

```bash
  159  sudo docker build -t first_dockerapp .
  160  sudo docker run -p 5000:5000 first_dockerapp
```
