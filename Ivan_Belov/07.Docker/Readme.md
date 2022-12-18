#### 07.Docker

##### Report

###### Build image
###
```bash
ivan@itacademy:~/ITA/07.Docker$ sudo docker build -t httpserver:1.3 .
Sending build context to Docker daemon  3.584kB
Step 1/5 : FROM python:3.8-slim-buster
 ---> 241ddc060a49
Step 2/5 : COPY ./server.py ~/server.py
 ---> Using cache
 ---> 5caf97360b64
Step 3/5 : WORKDIR ~
 ---> Using cache
 ---> 08ffde420532
Step 4/5 : EXPOSE 8888
 ---> Running in 9e5f55b470b8
Removing intermediate container 9e5f55b470b8
 ---> 96510f16e835
Step 5/5 : ENTRYPOINT "python3" "server.py"
 ---> Running in 063e0fd464cf
Removing intermediate container 063e0fd464cf
 ---> 46c7a6ca9afd
Successfully built 46c7a6ca9afd
```

###### Docker containers
###
```bash
ivan@itacademy:~/it_academy/sa.it-academy.by/Ivan_Belov/07.Docker$ sudo docker ps
[sudo] password for ivan: 
CONTAINER ID   IMAGE            COMMAND                   CREATED             STATUS             PORTS                                       NAMES
f33a9bf56e9a   httpserver:1.3   "/bin/sh -c '\"python…"   About an hour ago   Up About an hour   0.0.0.0:8000->8888/tcp, :::8000->8888/tcp   practical_chandrasekhar
```

###### Test
#
```bash
➜  ~ curl 192.168.1.68:8000
<html><head><meta charset="utf-8"><title>Http server</title></head><body>Hello from Dockerfile</body></html>%               
➜  ~ 
```

