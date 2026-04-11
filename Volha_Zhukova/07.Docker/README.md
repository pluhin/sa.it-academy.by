## 1. Install via apt repository
```bash
    6  sudo apt install ca-certificates curl
    7  sudo install -m 0755 -d /etc/apt/keyrings
    8  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    9  sudo chmod a+r /etc/apt/keyrings/docker.asc
   10  sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

   11  cat /etc/apt/sources.list.d/docker.sources
   12  apt update
   13  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   14  sudo systemctl status docker
   15  docker --version
   16  docker ps
   17  docker run hello-world
   18  docker ps
   19  docker ps -a
```

## 2. Run application using Docker