# 09.Docker

## Repository 
* [Dockerhub](https://hub.docker.com/r/mnogosemok/mnogosemok_docker)
* [Git Hub Package ](https://github.com/users/mnogosemok/packages/container/package/doker_build)

### DockerFile
```bash
FROM python:alpine
MAINTAINER Vadim_Shishlo
COPY test_doker.py /test_doker.py
ENTRYPOINT ["python3","-u", "test_doker.py"]
```

### My Python PortBinding 
```bash
from http.server import HTTPServer, BaseHTTPRequestHandler
import socket

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello world from hostname: ' + socket.gethostname().encode())

SERVER_PORT = 8080
httpd = HTTPServer(('0.0.0.0', SERVER_PORT), SimpleHTTPRequestHandler)
print('Listening on port %s ...' % SERVER_PORT)
httpd.serve_forever()
```

### GitHub action file
```bash
name: Publish Docker

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
          password: ${{ secrets.TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
         context: .
         push: true
         tags: ghcr.io/mnogosemok/doker_build:latest


      - name: Login in DockerHub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push the Docker 
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/mnogosemok_docker:v1
```

### Run and test my Docker image (screen).
![Image 1](screen.jpg)
