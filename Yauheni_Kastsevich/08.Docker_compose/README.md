#
# 08. Docker. Docker compose
#
---
## Homework Assignment 1: Docker Compose for Application Stacks

### Install docker-compose
``` bash
sudo  curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ls -l /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
ls -l /usr/local/bin/docker-compose
docker-compose --version

Docker Compose version v2.23.3-desktop.2
```

### docker-compose.yaml

```bash
version: '3.3'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_secret
      MYSQL_DATABASE: drupal
      MYSQL_USER: drupal
      MYSQL_PASSWORD: drupal
  drupal:
    depends_on:
      - db
    image: drupal:latest
    ports:
      - "8000:80"
    volumes:
      - drupal_modules:/var/www/html/modules
      - drupal_profiles:/var/www/html/profiles
      - drupal_themes:/var/www/html/themes
      - drupal_sites:/var/www/html/sites
    restart: always
volumes:
  db_data:
  drupal_modules:
  drupal_profiles:
  drupal_themes:
  drupal_sites:
```

### Run the application

```bash
docker-compose up
curl http://localhost:8080
```

## Homework Assignment 2: Docker build automation (github action)

### Dockerfile
``` bash
FROM node:14 AS builder
WORKDIR /app
COPY app/ .
RUN yarn install 

RUN yarn build

FROM node:15
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 3000
CMD ["npm", "run", "start"]
```

### My commands
``` bash
docker build -t jsapp:v5 .
docker run --name jsapp5 -p 5000:3000 jsapp:v5
docker login -u evgecha123
```

### docker-build.yaml
``` bash
name: Build and Push Docker image to DockerHub

on: push
jobs:
    push:
        name: Push Docker image to DockerHub
        runs-on: ubuntu-latest
        steps:
            - name: Checkout repo
              uses: actions/checkout@v3

            - name: Login to DockerHub
              uses: docker/login-action@v2
              with:
                username: ${{ secrets.DOCKERHUB_USERNAME }}
                password: ${{ secrets.DOCKERHUB_ACCESS_TOKEN }}

            - name: Build and Push image
              uses: docker/build-push-action@v4
              with: 
                push: true
                tags:  evgecha123/jsapp:latest
```