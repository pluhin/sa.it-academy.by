# 08. Docker. Docker compose.

## Homework Assignment 1: Docker Compose for Application Stacks

2. Create a Docker Compose YAML file to define the services, networks, and volumes

```bash
nano docker-compose.yml
```

docker-compose.yml:

```yml
version: '3.3'
services:
  drupal:
    image: drupal:latest
    depends_on:
      - db
    environment:
      - DRUPAL_DB_HOST=db
      - DRUPAL_DB_NAME=drupal
      - DRUPAL_DB_USER=drupal
      - DRUPAL_DB_PASSWORD=drupal
    ports:
      - "8080:80"
    volumes:
      - drupal_data:/var/www/html
    restart: always
  
  db:
    image: mysql:5.7
    environment:
      - MYSQL_DATABASE=drupal
      - MYSQL_USER=drupal
      - MYSQL_PASSWORD=drupal
      - MYSQL_ROOT_PASSWORD=root
    volumes:
      - db_data:/var/lib/mysql
    restart: always
  
volumes:
  drupal_data:
  db_data:
```

3. Run the application stack using the docker-compose up command

```bash
docker-compose up
```

4. Access the application through a web browser

In the terminal on your machine, type:

```shell
ssh -L 8080:127.0.0.1:8080 sasha@192.168.56.119 -f -N
```

Go in your browser to
```bash
http://localhost:8080/
```

## Homework Assignment 2: Docker build automation (github action)

My home work repository
[https://github.com/Mazurovsasha/08.Docker-compose.Docker-build-automation]

```bash
nano Dockerfile
```

Dockerfile:

```yaml
FROM python:3.9

WORKDIR /app

COPY app/app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

2. Write a multi-stage Dockerfile to build the application with different stages for build and runtime

```bash
mkdir -p .github/workflows/

nano build.yml
```

build.yml

```yml
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "master"
    paths:
      - "app/**"

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
          tags: ghcr.io/mazurovsasha/docker_build:1
```

setting CR_TOKEN:

- Go to setting account > developer settings > Personal access tokens > token (classic)
- Great new token (classic)
- Select "write:packages" 
- Copy token > go to setting repository > Secrets and variables > Actions > New repository secret > name secret "CR_TOKEN"

```bash
git ac "You name commit"

git push -u origin master
```
