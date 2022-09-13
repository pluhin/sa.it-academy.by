

## Build Docker File
```bash
vagrant@debian11:~/09.Docker/test1$ docker build -t image:5 .
Sending build context to Docker daemon  4.608kB
Step 1/10 : FROM alpine:latest
 ---> 9c6f07244728
Step 2/10 : ENV PYTHONUNBUFFERED=1
 ---> Using cache
 ---> 252f98790dc7
Step 3/10 : RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
 ---> Using cache
 ---> 0a6d17a501d5
Step 4/10 : RUN python3 -m ensurepip
 ---> Using cache
 ---> 3efbbe171986
Step 5/10 : RUN pip3 install --no-cache --upgrade pip setuptools
 ---> Using cache
 ---> 59f2ad348ab8
Step 6/10 : RUN mkdir ./app
 ---> Using cache
 ---> c615188f890c
Step 7/10 : WORKDIR ./app
 ---> Using cache
 ---> bee7442e2fbc
Step 8/10 : COPY ./app/* .
 ---> e072d43f52ca
Step 9/10 : EXPOSE 8899
 ---> Running in 48d46f390a6e
Removing intermediate container 48d46f390a6e
 ---> 3229ef05e659
Step 10/10 : CMD ["python3", "listener.py"]
 ---> Running in 7131ac460fda
Removing intermediate container 7131ac460fda
 ---> 8b52b8034a75
Successfully built 8b52b8034a75
Successfully tagged image:5

```

## Run Docker conteiner
```bash
vagrant@debian11:~/09.Docker/test1$ docker run -d -p 8080:8090 image:5
00c77ac316f7edefe0828ac9422f8057d81c9cc8b8951cee78fab3c7bdd99be8
```
## Test app
```bash
vagrant@debian11:~/09.Docker/test1$ docker ps
CONTAINER ID   IMAGE     COMMAND                 CREATED         STATUS         PORTS                              NAMES
00c77ac316f7   image:5   "python3 listener.py"   4 seconds ago   Up 3 seconds   8899/tcp, 0.0.0.0:8080->8090/tcp   beautiful_mccarthy

vagrant@debian11:~/09.Docker/test1$ curl -d "hello" localhost:8080
Hello Andrei Luchanok
```

## Github action
```bash
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "master"
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
          password: ${{ secrets.DOCKER_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/luchik51/homework:1

```

## Github Action Docker build
https://github.com/Luchik51/homework/runs/8267845689?check_suite_focus=true

## Docker conteiner
```bash
docker pull ghcr.io/luchik51/homework:2
```
