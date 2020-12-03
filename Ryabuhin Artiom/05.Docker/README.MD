# 05. Docker

### Dockerfile

```bash
FROM ubuntu:16.04
LABEL MAINTANER=""
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app
```

### link to Dockerhub

[Dockerhub](https://hub.docker.com/repository/docker/chesterart/work)

### History of testing commands

```bash
sudo docker run -d -p 8080:5000 chesterart/work:test
user@buntudocker:~/work$ curl http://localhost:8080
Welcome!user@buntudocker:~/work$
```

### Dockerhub/Github integration

![N|1](https://thumb.cloud.mail.ru/weblink/thumb/xw1/59T3/4aXRTvVoF/github_integration.JPG?x-email=maildrop%40mail.ru)
