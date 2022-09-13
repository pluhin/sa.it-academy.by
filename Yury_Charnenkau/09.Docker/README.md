## 09.Docker

### Dockerfile:
```bash
FROM python:3.11-rc

RUN pip install fastapi
RUN pip install uvicorn

ADD main.py .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
```
### Links to docker image and github repository:

[https://hub.docker.com/r/yurycher/python_test](https://hub.docker.com/r/yurycher/python_test)

[https://github.com/yurycher/docker_build](https://github.com/yurycher/docker_build)

### Github workflow:
```bash
name: Publish Docker image

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
        uses: actions/checkout@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ github.actor }}
          password: ${{ secrets.DOCKER_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v3
        with:
          context: ./
          file: ./Dockerfile
          push: true
          tags: yurycher/python_test:latest
```
### History of testing command:
```bash
docker run -d -p 8080:8080 --name python_test yurycher/python_test
Unable to find image 'yurycher/python_test:latest' locally
latest: Pulling from yurycher/python_test
1671565cc8df: Already exists 
3e94d13e55e7: Already exists 
fa9c7528c685: Already exists 
53ad072f9cd1: Already exists 
d6b983117533: Already exists 
d8092d56ded5: Already exists 
705b7c5dcdf1: Already exists 
31a929d2d30d: Already exists 
69455fd6e5e1: Already exists 
51d70ce45129: Pull complete 
2f98f1b8be50: Pull complete 
d13064a16b4b: Pull complete 
Digest: sha256:4a894520f0b99b9019f6ffb0e1703cc627bfe4c0a189faa94294f57cde77cf03
Status: Downloaded newer image for yurycher/python_test:latest
2dac4b361e20e1e8dcb5176d08a619f5665ba59cc9f6a55f98e232fbde6bfc97

docker ps -a
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS                                       NAMES
2dac4b361e20   yurycher/python_test   "uvicorn main:app --…"   7 seconds ago   Up 5 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   python_test

docker logs python_test 
INFO:     Started server process [1]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:8080 (Press CTRL+C to quit)
INFO:     172.17.0.1:50786 - "GET / HTTP/1.1" 200 OK

curl http://127.0.0.1:8080/
"Hello world!"
```