# 08.Docker.Docker-compose
---

## 1: Docker Compose for Application Stacks

Installing docker-compose

```bash
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
sudo chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
```

Output

```bash
Docker Compose version v2.3.3
```

docker-compose.yml

```yaml
version: '3.3'
services:
  drupal:
    image: drupal:latest
    depends_on:
      - db
    environment:
      - DRUPAL_DB_HOST=drupal
      - DRUPAL_DB_NAME=${DB_NAME}
      - DRUPAL_DB_USER=${DB_USER}
      - DRUPAL_DB_PASSWORD=${DB_PASS}
    env_file:
      - .env
    ports:
      - "8080:80"
    volumes:
      - drupal_data:/var/www/html
    restart: always

  db:
    image: mysql:5.7
    environment:
      - MYSQL_DATABASE=${DB_NAME}
      - MYSQL_USER=${DB_USER}
      - MYSQL_PASSWORD=${DB_PASS}
      - MYSQL_ROOT_PASSWORD=${DB_RPASS}
    env_file:
      - .env
    volumes:
      - db_data:/var/lib/mysql
    restart: always

volumes:
  drupal_data:
  db_data:
```

Run the application

```bash
docker-compose up
```

Making ssh tunnel in git bash

```bash
ssh -L 8080:127.0.0.1:8080 goshaker@192.168.211.130 -f -N
```

## 2: Docker Compose for Application Stacks

[Github repo for task 2](https://github.com/Goshaker/Docker-compose)

Making directory for application

```bash
mkdir /home/goshaker/08.Docker.Docker-compose/app
```

app.py

```python
#MathOps class
class Calculator:
  #empty constructor
  def __init__(self):
    pass
  #add method - given two numbers, return the addition
  def add(self, x1, x2):
    return x1 + x2
  #multiply method - given two numbers, return the 
  #multiplication of the two
  def multiply(self, x1, x2):
    return x1 * x2
  #subtract method - given two numbers, return the value
  #of first value minus the second
  def subtract(self, x1, x2):
    return x1 - x2
  #divide method - given two numbers, return the value
  #of first value divided by the second
  def divide(self, x1, x2):
    if x2 != 0:
      return x1/x2
```

Making .github/workflows

```bash
mkdir .github/workflows
```

build.yaml

```yaml
name: Publish Docker on Github

on:
  release:
    types: [published]
  push:
    branches:
      - "main"

jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2

      - name: Log in to the Container registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/goshaker/docker-compose
```

Dockerfile

```bash
FROM python:3.9

WORKDIR /app

COPY app/app.py .

EXPOSE 5000
```