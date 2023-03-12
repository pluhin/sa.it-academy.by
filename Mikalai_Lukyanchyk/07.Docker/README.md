# 07.Docker

## Report

### **Build image**

```bash
git@testgit:~/07.Docker$ docker build -t python:test3 -f 01.Dockerfile .
[+] Building 0.6s (10/10) FINISHED
 => [internal] load build definition from 01.Dockerfile
 => => transferring dockerfile: 331B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/python:3.11-slim
 => [1/5] FROM docker.io/library/python:3.11-slim@sha256:d0e839882b87135b355361efeb9e9030c9d2a808da06434f4c99eb4009c15e64
 => [internal] load build context
 => => transferring context: 1.31kB
 => CACHED [2/5] WORKDIR /server
 => CACHED [3/5] RUN apt-get update     && apt-get upgrade
 => CACHED [4/5] COPY ./pages/* ./pages/0.0s
 => [5/5] COPY main.py 
 => exporting to image
 => => exporting layers
 => => writing image sha256:af441b7846ced9d77f9bdef946f87e74e888ab976d585f9ea7bcde6da79ff892
 => => naming to docker.io/library/python:test3
```
### **Docker images**

```bash
git@testgit:~/07.Docker$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
python        test3     af441b7846ce   13 minutes ago   146MB
python        test2     ae9ee3236303   15 minutes ago   146MB
python        test1     f7d4856ff6f2   27 minutes ago   146MB
hello-world   latest    feb5d9fea6a5   17 months ago    13.3kB
```

### **Docker containers**

```bash
git@testgit:~/07.Docker$ docker ps
CONTAINER ID   IMAGE          COMMAND            CREATED          STATUS          PORTS                                   NAMES
45db8637000b   python:test3   "python main.py"   14 minutes ago   Up 14 minutes   0.0.0.0:80->8081/tcp, :::80->8081/tcp   http3

```

### **Test webserver**

### Testing from parallel console (same host) ###

```bash
git@testgit:~/07.Docker$ curl localhost
<!DOCTYPE html>
<html >
  <head>
    <meta charset="utf-8">
    <title>
         Главная
    </title>
  </head>
  <body>
      <h1>
          Добро пожаловать на наш сервер
      </h1>
      <a href="/">Главная страница</a>
      <a href="/news">Страница новостей</a>
      <a href="/support">Обратная связь</a>
  </body>
</html>
```
### Testing from another VM in network ###
```bash
  07/03/2023   22:20.33   /home/mobaxterm  curl 192.168.184.3
<!DOCTYPE html>
<html >
  <head>
    <meta charset="utf-8">
    <title>
         Главная
    </title>
  </head>
  <body>
      <h1>
          Добро пожаловать на наш сервер
      </h1>
      <a href="/">Главная страница</a>
      <a href="/news">Страница новостей</a>
      <a href="/support">Обратная связь</a>
  </body>
</html>
```

### **Docker container logs** ###
```bash
git@testgit:~/07.Docker$ docker logs http3
172.17.0.1 - - [07/Mar/2023 19:20:42] "GET / HTTP/1.1" 200 -
192.168.184.1 - - [07/Mar/2023 19:25:06] "GET / HTTP/1.1" 200 -
```
