# 07.Docker

## Task1

### Scripts:
```bash
  180 sudo apt-get update
  181 sudo apt-get install ca-certificates curl
  182 sudo install -m 0755 -d /etc/apt/keyrings
  183 sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  184 sudo chmod a+r /etc/apt/keyrings/docker.asc
  185  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  186  sudo apt-get update
  187  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  188  sudo docker run hello-world
  189  docker --version
  190  sudo usermod -aG docker $USER
  191  docker run hello-world
  192  history
```

### Output:
```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

## Task2

## Scripts
```bash
  210  sudo mkdir 07.Docker
  211  cd 07.Docker/
  216  sudo cp -r /mnt/c/git/git-ops .
  217  ls -la
  255  sudo vim Dockerfile
  256  docker build -t spring-boot-app .
  257  docker run -d -p 8080:8080 spring-boot-app
  258  curl --write-out "%{http_code}" --silent --output /dev/null http://localhost:8080/api/check
  259  history
```

## Dockerfile for spring boot app
```dockerfile
FROM openjdk:21-jdk-slim
RUN useradd -ms /bin/bash tester
USER tester
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```