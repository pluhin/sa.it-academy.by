# Homework for 07.Docker
---
## Create image
```bash
svv@ubuntu:~/devops/07.Docker$ docker build -t python_app .
[+] Building 3.7s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                        0.0s
 => => transferring dockerfile: 151B                                                        0.0s
 => [internal] load .dockerignore                                                           0.0s
 => => transferring context: 2B                                                             0.0s
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster                   3.5s
 => [internal] load build context                                                           0.0s
 => => transferring context: 710B                                                           0.0s
 => [1/3] FROM docker.io/library/python:3.8-slim-buster@sha256:f51af6b4116b1c3a5a7934070b0  0.0s
 => CACHED [2/3] COPY ./app.py ~/app.py                                                     0.0s
 => CACHED [3/3] WORKDIR ~                                                                  0.0s
 => exporting to image                                                                      0.0s
 => => exporting layers                                                                     0.0s
 => => writing image sha256:a2e15719961b97ca9c5daf2eaa2f616c3ddb25d3359883af2885eafa0acc15  0.0s
 => => naming to docker.io/library/python_app       
```
## Docker images
```bash
svv@ubuntu:~/devops/07.Docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
python_app   latest    a2e15719961b   30 hours ago   116MB
nginx        latest    904b8cb13b93   8 days ago     142MB

```
## Work container
```bash
svv@ubuntu:~/devops/07.Docker$ docker run -p 8080:8080 -it --name web python_app
172.17.0.1 - - [10/Mar/2023 02:06:43] "GET / HTTP/1.1" 200 -
```
## Test 
```bash
svv@ubuntu:~$ curl localhost:8080
<html><head><meta charset="utf-8"><title>Http APP</title></head><body>HI</body></html>
```