## Homework Assignment 1: Docker Installation and Basic Commands
```
# Docker installation
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
sudo systemctl status docker

# Add current user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Pull and run hello-world images
docker pull hello-world
docker run hello-world
docker ps
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

Directory: application 

Description: A simple flusk application that returns the current time in the requested time zone (or UTC time by default)

Build docker image:
```
cd application
docker build -t get_time_app .
```

Run docker application:
```
docker run -d -p 2222:2222 get_time_app
```

Test requests: 
```
curl http://localhost:2222/time
RS:
{
  "current_time": "2025-11-21 11:29:32",
  "timezone": "UTC"
}

curl http://localhost:2222/time?tz=America/New_York
RS:
{
  "current_time": "2025-11-21 06:29:26",
  "timezone": "America/New_York"
}
```

Docker logs example:
```
docker logs 82afd1f43b83
 * Serving Flask app 'get_time_app'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:2222
 * Running on http://172.17.0.2:2222
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 548-683-883
172.17.0.1 - - [21/Nov/2025 11:36:49] "GET /time HTTP/1.1" 200 -
172.17.0.1 - - [21/Nov/2025 11:37:02] "GET /time?tz=America/New_York HTTP/1.1" 200 -
```
