## Dockerfile

```bash
 
FROM debian:stretch-slim

RUN apt update \
    && apt install -y python3 \
    && mkdir /python_app \
    && touch /python_app/connection.log

COPY server.py /python_app
COPY client.py /python_app

CMD ["python3", "/python_app/server.py"]


EXPOSE 9999

```

## Dockerhub

[DockerHub](https://hub.docker.com/repository/docker/kirill123433353463/python_app)

## Workflows

[Workflows](https://github.com/KirillNichiporov/Docker)

## Action file

```bash

name: Docker build and push
on:
  push:
    branches:
    - master
jobs:
  build_image_job:
    runs-on: ubuntu-latest
    name: Build Docker Image
    permissions:
      packages: write
      contents: read
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}

      - name: Build and push
        uses: docker/build-push-action@v2
        with:
          push: true
          tags:  kirill123433353463/python_app:v2.0

```

## Results test

```bash

root@kirill:/home/docker_python# ./server.py &
[1] 43032
root@kirill:/home/docker_python# ./client.py
Got a connection from ('127.0.0.1', 35544)
Thank you for connecting

root@kirill:/home/docker_python# ./client.py
Got a connection from ('127.0.0.1', 36868)
Thank you for connecting

root@kirill:/home/docker_python# ./client.py
Got a connection from ('127.0.0.1', 36870)
Thank you for connecting

root@kirill:/home/docker_python# ./client.py
Got a connection from ('127.0.0.1', 36872)
Thank you for connecting

```

