# 07.Docker

## Build

```bush
dzmtr_k@git_srv:~/07.Doker$ docker build -t my_app .
[+] Building 37.6s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                                              0.2s
 => => transferring dockerfile: 134B                                                                                                              0.1s
 => [internal] load .dockerignore                                                                                                                 0.1s
 => => transferring context: 2B                                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster                                                                         2.6s
 => [1/3] FROM docker.io/library/python:3.8-slim-buster@sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2                  30.3s
 => => resolve docker.io/library/python:3.8-slim-buster@sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2                   0.1s
 => => sha256:e53683fb464bd118081a539c199f8918d31828d851085907fa5a1c5ee324efb3 2.78MB / 2.78MB                                                    2.6s
 => => sha256:92b8eda1d319c19e0ab4aa21abc8021b8cf9d7d661fff6f586791ef10d8e087a 10.85MB / 10.85MB                                                  7.1s
 => => sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2 988B / 988B                                                        0.0s
 => => sha256:4bc25e1810c14af78ca0235ff6f63740113540fd49f8dc5bc6c7b456572b5806 1.37kB / 1.37kB                                                    0.0s
 => => sha256:48d520b650a800fe7fd19f1160e51a1b49fac63bc1db79fd39a0b6725d6c1c92 7.83kB / 7.83kB                                                    0.0s
 => => sha256:8fd419aca81cfd3987d61550e700546537628562693bc01acc9f85468f483706 27.14MB / 27.14MB                                                 11.1s
 => => sha256:80cabd6bcbca49b0801424a2bdcaf90246874314263f92e67eb3c907c6d29747 232B / 232B                                                        3.8s
 => => sha256:ae9d18f64c345e73676a90377c9df323289bd1a750e1845cdde42464f3486067 3.17MB / 3.17MB                                                    6.7s
 => => extracting sha256:8fd419aca81cfd3987d61550e700546537628562693bc01acc9f85468f483706                                                         9.1s
 => => extracting sha256:e53683fb464bd118081a539c199f8918d31828d851085907fa5a1c5ee324efb3                                                         1.1s
 => => extracting sha256:92b8eda1d319c19e0ab4aa21abc8021b8cf9d7d661fff6f586791ef10d8e087a                                                         3.9s
 => => extracting sha256:80cabd6bcbca49b0801424a2bdcaf90246874314263f92e67eb3c907c6d29747                                                         0.0s
 => => extracting sha256:ae9d18f64c345e73676a90377c9df323289bd1a750e1845cdde42464f3486067                                                         2.4s
 => [internal] load build context                                                                                                                 0.1s
 => => transferring context: 738B                                                                                                                 0.0s
 => [2/3] WORKDIR /src                                                                                                                            4.1s
 => [3/3] COPY src/app.py app.py                                                                                                                  0.1s
 => exporting to image                                                                                                                            0.1s
 => => exporting layers                                                                                                                           0.1s
 => => writing image sha256:5730deefafe55b323f59cc3de8ce1072d3bb1c59c967c40057fe858e3951f14c                                                      0.0s
 => => naming to docker.io/library/my_app                                                                                                         0.0s

 ```
 
## Images

 ```bush
dzmtr_k@git_srv:~/07.Doker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
my_app       latest    5730deefafe5   51 seconds ago   116MB
 ```

## Docker Test

 ```bush
dzmtr_k@git_srv:~/07.Doker$ docker run -d -p 5555:5555 --name my_app my_app:latest
60c23666e12dcc7237c5fe24b071779f571e092166894c7346c7a3c1b8eb375f
dzmtr_k@git_srv:~/07.Doker$ docker ps
CONTAINER ID   IMAGE           COMMAND                   CREATED          STATUS          PORTS                                       NAMES
60c23666e12d   my_app:latest   "/bin/sh -c '\"python…"   12 seconds ago   Up 10 seconds   0.0.0.0:5555->5555/tcp, :::5555->5555/tcp   my_app

dzmtr_k@git_srv:~/07.Doker$ telnet localhost 5555
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Welcome, type your info
Привет
Server output: Привет
Тест
Server output: Тест
Bye
Server output: Bye
^]
telnet> Connection closed.
dzmtr_k@git_srv:~/07.Doker$

```

