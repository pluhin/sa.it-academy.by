### 07.Docker


## Dockerfile

```bash
FROM python:3.9.10-alpine3.15

LABEL maintainer="pasha.167988@yandex.by"

COPY server.py / 

WORKDIR /

CMD ["python3", "server.py"]
```


## server.py

```bash
from http.server import HTTPServer, BaseHTTPRequestHandler
import socket
import http.server
import socketserver
PORT = 8001
class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write("<html>\n<head>\n<title>Hello World</title>\n</head>\n</html>\n".encode("utf-8"))
try:
    server = http.server.HTTPServer(('0.0.0.0', PORT), MyHandler)
    print('Server is started\nListening on port =', PORT)
    server.serve_forever()
except KeyboardInterrupt:
    print('^C received, shutting down server')
    server.socket.close()
```
    
    
## Docker build

```bash
pavelogs@ubuntu20:~/07.Docker$ docker build -t server:1 .
[+] Building 1.4s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                              0.0s
 => => transferring dockerfile: 172B                                                                                                                              0.0s
 => [internal] load .dockerignore                                                                                                                                 0.1s
 => => transferring context: 2B                                                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.9.10-alpine3.15                                                                                       1.3s
 => [internal] load build context                                                                                                                                 0.0s
 => => transferring context: 31B                                                                                                                                  0.0s
 => [1/3] FROM docker.io/library/python:3.9.10-alpine3.15@sha256:eb3ce1f74a5c47b36ded338f9f2fdcdab7846300957c0646cdce3b6c2ec22d2b                                 0.0s
 => CACHED [2/3] COPY server.py /                                                                                                                                 0.0s
 => exporting to image                                                                                                                                            0.0s
 => => exporting layers                                                                                                                                           0.0s
 => => writing image sha256:91857e835221fb7eba63e15da7e1a367eb8774c9ea65f1471e00c57d11b2b235                                                                      0.0s
 => => naming to docker.io/library/server:1
```

## Docker images

```bash
pavelogs@ubuntu20:~/07.Docker$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
server       1         91857e835221   28 minutes ago   48.3MB
server       2         91857e835221   28 minutes ago   48.3MB
```



## Docker run

```bash
pavelogs@ubuntu20:~/07.Docker$ docker run -d -p 8001:8001 --rm --name webserver server:2
db913fce75b6b605e7f451de109b43575336aff6fe472a07498e22ede7468f18
```


## Curl

```bash
pavelogs@ubuntu20:~/07.Docker$ curl http://localhost:8001
<html>
<head>
<title>Hello World</title>
</head>
</html>
```

## telnet

```bash
pavelogs@ubuntu20:~/07.Docker$ pavelogs@ubuntu20:~/07.Docker$ telnet localhost 8001
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
^C
Connection closed by foreign host.

```


## Docker logs

```bash
pavelogs@ubuntu20:~$ docker run -p 8001:8001 --name webserver server:2
pavelogs@ubuntu20:~$ watch docker logs webserver
Every 2.0s: docker logs webserver 
Server is started
Listening on port = 8001
200.200.0.9 - - [08/Dec/2022 11:29:17] "GET / HTTP/1.1" 200 -
200.200.0.9 - - [08/Dec/2022 11:29:18] "GET / HTTP/1.1" 200 -
200.200.0.9 - - [08/Dec/2022 11:29:19] "GET / HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:23] "GET / HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:24] "GET /favicon.ico HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:24] "GET / HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:24] "GET /favicon.ico HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:25] "GET / HTTP/1.1" 200 -
200.200.0.56 - - [08/Dec/2022 11:29:25] "GET /favicon.ico HTTP/1.1" 200 -
^C
^C received, shutting down server
```










