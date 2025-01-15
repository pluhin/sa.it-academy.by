## 07.Docker

### Homework Assignment 1: Docker Installation and Basic Commands

### History bash

```bash
  457  sudo apt-get update\nsudo apt-get install ca-certificates curl\nsudo install -m 0755 -d /etc/apt/keyrings\nsudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc\nsudo chmod a+r /etc/apt/keyrings/docker.asc
  458  echo \\n  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \\n  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \\n  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\nsudo apt-get update
  459  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  460  sudo usermod -aG docker $USER
  461  docker ps
  462  logout
  463  reboot
  464  docker ps
  465  docker run hello-world
  466  docker ps
  467  docker --version
  468  docker pull hello-world
  469  docker run hello-world
  470  docker ps
  471  docker ps -a
```

### Homework Assignment 2: Building a Docker Image with Dockerfile
### Dockerfile

```Dockerfile
FROM node:20.10.0-alpine AS builder
ARG build=null
ARG commit=null
ARG ver_tag=null
WORKDIR /app
COPY . ./
RUN npm install
RUN npm run build

FROM nginx:alpine
ARG build=null
ARG commit=null
ARG ver_tag=null
ENV ENV=$build
ENV COMMIT=$commit
ENV TAG=$ver_tag
COPY --from=builder /app/build /usr/share/nginx/html
COPY ./nginx/* /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Nginx default.conf
```nginx
server {
    listen 80;
    server_name localhost;

    location / {
	index index.html index.htm;
        root /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

}
```

### History bash
```bash
  488  npx create-react-app todo-list
  489  200~sudo apt update
  490  sudo apt install nodejs npm
  491  npx create-react-app todo-lis
  492  sudo npx create-react-app todo-lis
  493  cd todo-lis/
  494  ls
  495* ranger
  496  ls
  497  cd src
  498  ls
  499  sudo nano App.js
  500  ls
  501  sudo nano index.js
  502  z /
  503  cd home/docker07
  504  ls
  505  cp Dockerfile todo-list/
  506  ls
  507  cp Dockerfile todo-lis/
  508  sudo cp Dockerfile todo-lis/
  509  cd todo-lis
  510  ls
  511  sudo mkdir -p todo-list/nginx
  512  ls
  513  sudo mkdir -p nginx
  514  ls
  515  cd nginx
  516  sudo nano default.conf
  517  cd ../
  518  ls
  519  docker build -t todo-list .
  520  docker ps -a:
  521  docker ps -a
  522  sudo nano Dockerfile
  523  cd nginx
  524  cat default.conf
  525  docker build -t todo-list .
  526  cd ../
  527  docker build -t todo-list .
  528  sudo nano Dockerfile
  529  docker build -t todo-list .
  530  docker ps -a\
  531  docker ps -a
  532  docker run -p 80:80 todo-list
  533* curl http://localhost
```

## Result DOCKER_RUN

![img.png](img.png)
