# 07.Docker

## Docker build

```bush
admin1@igor:~/07.docker$ docker build -t python_server:1.0 -f Dockerfile .
[+] Building 0.7s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                   0.0s
 => => transferring dockerfile: 127B                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                    0.7s
 => [1/3] FROM docker.io/library/python:3.11-slim@sha256:d0e839882b87135b355361efeb9e9030c9d2a808da06434f4c99eb4009c15e64                                                              0.0s
 => [internal] load build context                                                                                                                                                      0.0s
 => => transferring context: 963B                                                                                                                                                      0.0s
 => CACHED [2/3] WORKDIR /server                                                                                                                                                       0.0s
 => [3/3] COPY main.py ./                                                                                                                                                              0.0s
 => exporting to image                                                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                                                0.0s
 => => writing image sha256:24a7a663c4b945861bd6cbe06f256dee5907cc9a7f60d05c2ec8904dffc1da60                                                                                           0.0s
 => => naming to docker.io/library/python_server:1.0                
 ```
 
## Docker images

 ```bush
admin1@igor:~$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
python_server   1.0       fb6c3f6b1d6c   17 minutes ago   128MB
 ```

## Run docker and test

 ```bush
admin1@igor:~/07.docker$ docker run -p 8080:8080 python_server:1.0
172.17.0.1 - - [08/Mar/2023 12:17:13] "GET / HTTP/1.1" 200 -
 


admin1@igor:~$ curl http://localhost:8080
<html><head><title>Python server!</title></head><p>Request: /</p><body><p>This is an example web server.</p></body></html>
```

## Docker ps

 ```bush
admin1@igor:~$ docker ps
CONTAINER ID   IMAGE               COMMAND            CREATED              STATUS              PORTS                                       NAMES
fca386af3dc3   python_server:1.0   "python main.py"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   cool_meitner
 ```

