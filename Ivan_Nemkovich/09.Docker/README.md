# 09.Docker

## Link to Docker image
- [Github](https://github.com/ivan-nemkovich/docker_build/pkgs/container/docker_build)

### How to download
```bash
docker pull ghcr.io/ivan-nemkovich/docker_build:latest
```

## Dockerfile
```bash
FROM python:alpine3.15

LABEL maintainer="inemkovich@gmail.com"

RUN apk update \
    && pip install flask \
    && mkdir /api
COPY api.py /api/api.py
CMD ["python", "./api/api.py"]
EXPOSE 5000
```

## History
```bash
ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ docker pull ghcr.io/ivan-nemkovich/docker_build:latest
latest: Pulling from ivan-nemkovich/docker_build
df9b9388f04a: Already exists 
a1ef3e6b7a02: Already exists 
7a687728470e: Already exists 
4ecf30de1710: Already exists 
c3b27164aa0c: Already exists 
402c43ef4613: Pull complete 
000d26999038: Pull complete 
Digest: sha256:ee43a10843ae5519e92873b4ea90e999020dac6f44ae83c7586998017b0eff6a
Status: Downloaded newer image for ghcr.io/ivan-nemkovich/docker_build:latest
ghcr.io/ivan-nemkovich/docker_build:latest
ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ docker images 
REPOSITORY                            TAG          IMAGE ID       CREATED         SIZE
ghcr.io/ivan-nemkovich/docker_build   latest       a81546a7f828   8 minutes ago   62MB
api_listener                          v1.0         713a05bcf392   2 hours ago     62MB
python                                alpine3.15   8b74835e51c6   3 days ago      47.8MB
hello-world                           latest       feb5d9fea6a5   7 months ago    13.3kB
ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ docker run -d -p 8081:5000 --name api_listener2 ghcr.io/ivan-nemkovich/docker_build:latest 
b04521f63f0cde4209d022746b9c150af3a6118a01e570925d6c9e9183a007b0
ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ curl http://localhost:8081/companies
[{"id": 1, "name": "Company One"}, {"id": 2, "name": "Company Two"}]ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ docker ps
CONTAINER ID   IMAGE                                        COMMAND                 CREATED         STATUS         PORTS                                       NAMES
b04521f63f0c   ghcr.io/ivan-nemkovich/docker_build:latest   "python ./api/api.py"   8 minutes ago   Up 8 minutes   0.0.0.0:8081->5000/tcp, :::8081->5000/tcp   api_listener2
63b3a91c1615   api_listener:v1.0                            "python ./api/api.py"   2 hours ago     Up 2 hours     0.0.0.0:80->5000/tcp, :::80->5000/tcp       api_listener
ivan@UbMain:~/devops/it-academy.by/Ivan_Nemkovich/09.Docker$ docker logs b04521f63f0c
 * Serving Flask app 'api' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.3:5000 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 330-802-416
172.17.0.1 - - [21/May/2022 19:41:04] "GET /companies HTTP/1.1" 200 -
172.17.0.1 - - [21/May/2022 19:47:57] "GET /companies HTTP/1.1" 200 -
```
