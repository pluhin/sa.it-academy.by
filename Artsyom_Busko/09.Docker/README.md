# 09.Docker

## Links
- [github](https://github.com/agbusko/it-academy)
- [dockerhub](https://hub.docker.com/repository/docker/agbusko/listener)

## Dockerfile
```
FROM alpine:latest 

LABEL maintainer="agbusko@gmail.com"

RUN apk --update add python3

WORKDIR /opt

COPY listener.py /opt/

CMD ["python3", "/opt/listener.py"]
```
## listener
```python
import socket

s = socket.socket()
host = '0.0.0.0'
port = 1247
s.bind((host,port))
s.listen(5)
while True:
    c, addr = s.accept()
    print("Connection accepted from " + repr(addr[1]))

    c.send("Server approved connection\n")
    print (repr(addr[1]) + ": " + c.recv(1026))
    c.close()
```
## pipeline
```yaml
name: CI

on:
  push:
    branches: dev

jobs:
  login:
    runs-on: ubuntu-latest
    steps:    
      -
        name: Checkout repo
        uses: actions/checkout@v2
        
      -
        name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      -
        name: Build the Docker image
        run: docker build -t listener:v1 .
      -
        name: Tag the Docker image
        run: docker tag listener:v1 agbusko/listener
      -
        name: Push the Docker image to the registry
        run: docker push agbusko/listener
```

## tests
*server*
```bash
root@dev01-all-u20srv:~# docker run -it -p 1247:1247 --name listenernew agbusko/listener
```

*client*
```bash
telnet 192.168.199.2 1234
```

*result*
```
Trying 192.168.199.2...
Connected to 192.168.199.2.
Escape character is '^]'.
Connection closed by foreign host.
```
