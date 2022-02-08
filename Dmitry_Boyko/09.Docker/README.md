# 09.Docker

### URLs repository and package
[Git repository link](https://github.com/devel0ne/09.Docker)
[DockerHub repository link](https://hub.docker.com/r/develone/09_docker_image)


### Dockerfile
```
FROM python:alpine
RUN mkdir /app
ADD ./server.py /app/server.py
WORKDIR /app
CMD ["python", "server.py", "80"]
```


### .github/workflows/docker-image-build.yaml

```yaml
name: Docker Image CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build_image_job:
    runs-on: ubuntu-latest
    name: Build Docker Image
    permissions:
      packages: write
      contents: read
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Login to DockerHub registry
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.docker_username }}
          password: ${{ secrets.docker_password }}

      - name: Build and push image
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: develone/09_docker_image:latest
```


### Running docker container
```
vagrant@ubuntu-jammy:~$ docker run -it -p 8888:80 develone/09_docker_image:latest 
Unable to find image 'develone/09_docker_image:latest' locally
latest: Pulling from develone/09_docker_image
59bf1c3509f3: Already exists 
07a400e93df3: Already exists 
812206835f4c: Already exists 
73342013dbd4: Already exists 
27450111daa5: Already exists 
a55b864cf76f: Pull complete 
d54af864c889: Pull complete 
4f4fb700ef54: Pull complete 
Digest: sha256:777e1f9754d75bebf97ca170a24d04197c9cf8cd0ab1c2753284ecb94d5a02db
Status: Downloaded newer image for develone/09_docker_image:latest
INFO:root:Starting httpd...
172.17.0.1 - - [08/Feb/2022 16:04:51] code 501, message Unsupported method ('HEAD')
172.17.0.1 - - [08/Feb/2022 16:04:51] "HEAD / HTTP/1.1" 501 -
```

### Testing connection
```
vagrant@ubuntu-jammy:~$ curl http://127.0.0.1:8888

GET request for /vagrant@ubuntu-jammy:~$ curl -I http://127.0.0.1:8888
HTTP/1.0 501 Unsupported method ('HEAD')
Server: BaseHTTP/0.6 Python/3.10.2
Date: Tue, 08 Feb 2022 16:04:51 GMT
Connection: close
Content-Type: text/html;charset=utf-8
Content-Length: 497
```
