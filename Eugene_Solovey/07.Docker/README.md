# 07.Docker

## Report

### Build image

```bash
e_solovey@nss:~/homework/sa.it-academy.by/Eugene_Solovey/07.Docker$ docker build -t webserver:v0 . -f Dockerfile
Sending build context to Docker daemon  3.584kB
Step 1/6 : FROM python:3.11-slim
3.11-slim: Pulling from library/python
8740c948ffd4: Pull complete
69038a8b17e6: Pull complete
be80bd1fa6e1: Pull complete
a82a83a9446e: Pull complete
5fa7ca705967: Pull complete
Digest: sha256:79095e304e31196bad049e74f666508ac81909d201ec9371f9f3cd68fa365cf6
Status: Downloaded newer image for python:3.11-slim
 ---> 9012e93183ab
Step 2/6 : LABEL maintainer="evgeniy.colovey@gmail.com"
 ---> Running in c8bee192b3df
Removing intermediate container c8bee192b3df
 ---> 4984001f26bb
Step 3/6 : WORKDIR /server
 ---> Running in ae1f2c358773
Removing intermediate container ae1f2c358773
 ---> 636bbdc7f079
Step 4/6 : COPY server.py ./
 ---> 85810923cc12
Step 5/6 : EXPOSE 8080
 ---> Running in bdf14b545f5a
Removing intermediate container bdf14b545f5a
 ---> 20ee64e454c4
Step 6/6 : ENTRYPOINT ["python", "server.py"]
 ---> Running in ff8e3cdb9095
Removing intermediate container ff8e3cdb9095
 ---> df34bc474b87
Successfully built df34bc474b87
Successfully tagged webserver:v0
```
### Docker images

```bash
e_solovey@nss:~/homework/sa.it-academy.by/Eugene_Solovey/07.Docker$ docker images
REPOSITORY    TAG           IMAGE ID       CREATED         SIZE
webserver     v0            df34bc474b87   3 minutes ago   128MB
``` 

### Docker containers

```bash
e_solovey@nss:~/homework/sa.it-academy.by/Eugene_Solovey/07.Docker$ docker ps
CONTAINER ID   IMAGE          COMMAND              CREATED          STATUS          PORTS                                   NAMES
7d25d8798623   webserver:v0   "python server.py"   25 seconds ago   Up 24 seconds   0.0.0.0:80->8080/tcp, :::80->8080/tcp   webserver
```

### Test webserver

```bash
e_solovey@nss:~/homework/sa.it-academy.by/Eugene_Solovey/07.Docker$ curl 127.0.0.1 80
<html><head><meta charset="utf-8"><title>Http server</title></head><body>Hello from Dockerfile</body></html>
```



