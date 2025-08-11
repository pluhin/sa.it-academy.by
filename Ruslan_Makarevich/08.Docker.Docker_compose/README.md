# HA1: Docker Compose for Application Stacks

## Docker-compose.yaml

```bash
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: laravel-app
    working_dir: /var/www/html
    volumes:
      - ./src:/var/www/html
    networks:
      - laravel

  db:
    image: mysql:8
    container_name: laravel-db
    restart: always
    environment:
      MYSQL_DATABASE: laravel
      MYSQL_USER: laravel
      MYSQL_PASSWORD: secret
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - laravel

  nginx:
    image: nginx:latest
    container_name: laravel-nginx
    ports:
      - "8080:80"
    volumes:
      - ./src:/var/www/html
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - app
    networks:
      - laravel

volumes:
  db_data:

networks:
  laravel:
```

## Docker file

```bash
FROM php:8.2-fpm

RUN apt update && apt install -y \
    zip unzip git curl libpng-dev libonig-dev libxml2-dev libcurl4-openssl-dev \
    && docker-php-ext-install pdo pdo_mysql curl

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN useradd -ms /bin/bash laravel
WORKDIR /var/www/html
RUN chown -R laravel:laravel /var/www/html
USER laravel

USER root

CMD ["php-fpm"]
```

## default.conf

```bash
server {
    listen 80;
    index index.php index.html;
    root /var/www/html/public;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

## Command docker compose up

```bash

 docker compose up -d --build


[+] Running 11/11
 ✔ db Pulled                                                                                                                                                                          144.6s
   ✔ 6f32662abb49 Already exists                                                                                                                                                        0.0s
   ✔ 4a8ddcb7e704 Already exists                                                                                                                                                        0.0s
   ✔ 9dfd724488ff Pull complete                                                                                                                                                         2.2s
   ✔ 62e95972b5ba Pull complete                                                                                                                                                        11.2s
   ✔ f8ed25f276d2 Pull complete                                                                                                                                                        11.3s
   ✔ 7693567128de Pull complete                                                                                                                                                        11.3s
   ✔ 3ee4fe8287d7 Pull complete                                                                                                                                                        66.0s
   ✔ 75a13c9c15d3 Pull complete                                                                                                                                                        66.1s
   ✔ df267d9464e6 Pull complete                                                                                                                                                       141.2s
   ✔ 4fb3779ce7c8 Pull complete                                                                                                                                                       141.3s
#1 [internal] load local bake definitions
#1 reading from stdin 625B done
#1 DONE 0.0s

#2 [internal] load build definition from Dockerfile
#2 transferring dockerfile: 912B done
#2 DONE 0.0s

#3 [internal] load metadata for docker.io/library/php:8.2-fpm
#3 DONE 0.0s

#4 [internal] load .dockerignore
#4 transferring context: 2B done
#4 DONE 0.0s

#5 [1/6] FROM docker.io/library/php:8.2-fpm
#5 DONE 0.0s

#6 [2/6] RUN apt update && apt install -y     zip unzip git curl libpng-dev libonig-dev libxml2-dev libcurl4-openssl-dev     && docker-php-ext-install pdo pdo_mysql curl
#6 CACHED

#7 [3/6] RUN curl -sS https://getcomposer.org/installer | php &&     mv composer.phar /usr/local/bin/composer
#7 CACHED

#8 [4/6] RUN useradd -ms /bin/bash laravel
#8 DONE 1.3s

#9 [5/6] WORKDIR /var/www/html
#9 DONE 0.1s

#10 [6/6] RUN chown -R laravel:laravel /var/www/html
#10 DONE 0.7s

#11 exporting to image
#11 exporting layers
#11 exporting layers 0.3s done
#11 writing image sha256:9931a06836f7c124052f81f75fb34e015962bcb01a852bae4ff1f274990ccdcf 0.0s done
#11 naming to docker.io/library/08dockerdocker_compose-app 0.0s done
#11 DONE 0.4s

#12 resolving provenance for metadata file
#12 DONE 0.0s
[+] Running 6/6
 ✔ 08dockerdocker_compose-app               Built                                                                                                                                       0.0s
 ✔ Network 08dockerdocker_compose_laravel   Created                                                                                                                                     0.3s
 ✔ Volume "08dockerdocker_compose_db_data"  Created                                                                                                                                     0.0s
 ✔ Container laravel-app                    Started                                                                                                                                    12.3s
 ✔ Container laravel-db                     Started                                                                                                                                    12.6s
 ✔ Container laravel-nginx                  Started
```

## Command docker compose ps

```bash
NAME            IMAGE                        COMMAND                  SERVICE   CREATED          STATUS          PORTS
laravel-app     08dockerdocker_compose-app   "docker-php-entrypoi…"   app       42 minutes ago   Up 42 minutes   9000/tcp
laravel-db      mysql:8                      "docker-entrypoint.s…"   db        42 minutes ago   Up 42 minutes   3306/tcp, 33060/tcp
laravel-nginx   nginx:latest                 "/docker-entrypoint.…"   nginx     42 minutes ago   Up 42 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
```

## Print-screen Laravel

![Laravel app](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/08.Docker.Docker_compose/laravel.jpg)

# HA2: Docker build automation (github action)

## docker-build.yml

```bash
name: Buid and push Docker image

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Clone repository
      uses: actions/checkout@v3

    - name: Login in Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: B&P Docker img
      id: docker_build
      uses: docker/build-push-action@v4
      with:
        context: .
        push: true
        tags: dockeruser/mygoapp:latest

    - name: Push done
      if: success()
      run: |
        curl -X POST -H 'Content-type: application/json' \
        --data '{"text":":white_check_mark: Docker образ mygoapp:latest успешно собран и запушен!"}' \
        ${{ secrets.SLACK_WEBHOOK_URL }}

    - name: Push fail
      if: failure()
      run: |
        curl -X POST -H 'Content-type: application/json' \
        --data '{"text":":x: Сборка или пуш Docker образа mygoapp:latest завершились с ошибкой!"}' \
        ${{ secrets.SLACK_WEBHOOK_URL }}
```

## main.go

```bash
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Привет от Go-приложения!")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
```
## Print-screen Go app

![Hello go](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/08.Docker.Docker_compose/hello_go.jpg)

## Docker file (go_app)

```bash
FROM golang:1.21-alpine AS build

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o myapp

FROM alpine:latest

WORKDIR /app

COPY --from=build /app/myapp .

EXPOSE 8080

CMD ["./myapp"]
```

## Build & run locally

```bash
docker build -f Dockerfile_go -t mygoapp:latest .
docker run -p 8080:8080 mygoapp:latest
```

## Push image Docker Hub

```bash
docker login
docker tag mygoapp:latest dockeruser/mygoapp:latest
docker push dockeruser/mygoapp:latest
```

## Print-screen Slack notofication

![Slack notify](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/08.Docker.Docker_compose/slack_notification.png)
