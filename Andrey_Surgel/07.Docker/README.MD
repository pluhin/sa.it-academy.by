# HA1

```bash
  519  docker --version
  520  docker pull hello-world
  521  docker run hello-wordl
  522  docker run hello-world
  523  docker ps
  524  docker run -dhello-world
  525  docker run -d hello-world
  526  docker ps
  528  docker images
```

# HA2

```bash
  531  git clone https://github.com/digitalocean/sample-nodejs.git
  532  ls
  533  nano Dockerfile
  534  ls
  535  docker build --name ha2:latest
  536  docker build --name ha2:latest .
  537  docker build --help
  538  docker build -t HA:2 .
  539  docker build -t ha:2 .
  540  docker images
  541  docker --help
  542  docker inspect ha:2
  543  docker run -d --name test ha:2
  544  docker ps
  545  curl localhost 3000
  546  curl localhost:3000
  547  telnet localhost:3000
  548  sudo apt install telnet
  549  telnet localhost:3000
  550  telnet localhost 3000
  551  docker ps
  552  docker logs test
  553  netstat -tulpn
  554  docker stop test
  555  docker rm test
  556  docker run -d -p 3000:3000 --name test ha:2
  557  docker ps
  558  telnet localhost 3000
  559  curl localhost:3000
```

## Dockerfile

```Dockerfile
FROM node:24

WORKDIR /app

COPY sample-nodejs/package.json ./


RUN npm install

COPY sample-nodejs/ ./

EXPOSE 3000


RUN useradd -ms /bin/bash test
USER test
CMD ['npm','start']
```