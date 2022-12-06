# 07.Docker

## Preparing. Links

Install Docker Engine, post-installation steps.

Link to the selected docker image (python:3.11-slim):

[>> Here <<](https://hub.docker.com/layers/library/python/3.11.0-slim/images/sha256-ff09e30b44097b761742f1c460f385046d3627c1cfdc5511e191b4274b416257?context=explore)

```bash
$ docker pull python:3.11-slim
3.11-slim: Pulling from library/python
025c56f98b67: Pull complete 
778656c04542: Pull complete 
3275e9074723: Pull complete 
9c14766361e2: Pull complete 
5882f66f020b: Pull complete 
Digest: sha256:b5ee5360b357dcd0ab2e1cc5e22fa589b6734bbd55776df6b1700994febf1527
Status: Downloaded newer image for python:3.11-slim
docker.io/library/python:3.11-slim
```

```bash
$ docker images
REPOSITORY   TAG         IMAGE ID       CREATED       SIZE
python       3.11-slim   15faa1ce7d77   7 hours ago   128MB
```

## Files

### index.html

```html
<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Docker container.</h1>
<h2>This is personal index.html running in python module http.server.</h2>
</body>
</html>
```

### server.py

```python
from http.server import BaseHTTPRequestHandler, HTTPServer
 
HOST = "0.0.0.0"
PORT = 8000
 
class MiniHTTP(BaseHTTPRequestHandler):
    def set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
 
    def do_HEAD(self):
        self.set_headers()
 
    def do_GET(self):
        if self.path == "/":
            self.set_headers()
            content = open("index.html", "rb").read()
            self.wfile.write(content)
        else:
            self.send_response(404)
        return
 
if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), MiniHTTP)
 
try:
    server.serve_forever()
except KeyboardInterrupt:
    pass
 
server.server_close()
print("Server stopped.")
```

### server.Dockerfile

```Dockerfile
FROM python:3.11-slim
LABEL maintainer="sgoser@gmail.com"
WORKDIR /server
COPY index.html ./
COPY server.py ./
EXPOSE 8000
ENTRYPOINT ["python", "server.py"]
```

## Run

```bash
$ docker build -f server.Dockerfile . -t webserver:v.2

Sending build context to Docker daemon  4.608kB
Step 1/7 : FROM python:3.11-slim
 ---> 15faa1ce7d77
Step 2/7 : LABEL maintainer="sgoser@gmail.com"
 ---> Running in 3ff4a440b73b
Removing intermediate container 3ff4a440b73b
 ---> 24d20ce9a5c9
Step 3/7 : WORKDIR /server
 ---> Running in dd55edc235be
Removing intermediate container dd55edc235be
 ---> 3bd7ae2e3759
Step 4/7 : COPY index.html ./
 ---> 40e3bd8580b5
Step 5/7 : COPY server.py ./
 ---> 59c42eb4e728
Step 6/7 : EXPOSE 8000
 ---> Running in 31c09acb0995
Removing intermediate container 31c09acb0995
 ---> a530e68a0f8c
Step 7/7 : ENTRYPOINT ["python", "server.py"]
 ---> Running in 3638780c2d7a
Removing intermediate container 3638780c2d7a
 ---> f3a3a0fd2c41
Successfully built f3a3a0fd2c41
Successfully tagged webserver:v.2
```

```bash
$ docker images

REPOSITORY   TAG         IMAGE ID       CREATED          SIZE
webserver    v.2         659d717e92a4   13 minutes ago   128MB
python       3.11-slim   15faa1ce7d77   8 hours ago      128MB
```

```bash
docker run --rm -p 80:8000 --name web-server webserver:v.2
```

## Result

### Testing from parallel console (same host)

```bash
sadmin@devops:~$ curl -I 192.168.45.15:80
HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.11.0
Date: Tue, 06 Dec 2022 21:11:56 GMT
Content-type: text/html

sadmin@devops:~$ curl 192.168.45.15:80
<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Docker container.</h1>
<h2>This is personal index.html running in python module http.server.</h2>
</body>
</html>

sadmin@devops:~$ curl localhost
<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Docker container.</h1>
<h2>This is personal index.html running in python module http.server.</h2>
</body>
</html>

sadmin@devops:~$ curl 127.0.0.1:80
<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Docker container.</h1>
<h2>This is personal index.html running in python module http.server.</h2>
</body>
</html>
```

### Testing from another VM in network

```bash
sadmin@exp:~$ curl 192.168.45.15
<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Docker container.</h1>
<h2>This is personal index.html running in python module http.server.</h2>
</body>
</html>

sadmin@exp:~$ curl -I 192.168.45.15:80
HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.11.0
Date: Tue, 06 Dec 2022 21:11:56 GMT
Content-type: text/html
```

### Docker container. Web-server's logs

```bash
$ docker run --rm -p 80:8000 --name web-server webserver:v.2
192.168.45.15 - - [06/Dec/2022 21:11:56] "HEAD / HTTP/1.1" 200 -
192.168.45.15 - - [06/Dec/2022 21:12:12] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [06/Dec/2022 21:12:28] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [06/Dec/2022 21:12:47] "GET / HTTP/1.1" 200 -
192.168.45.16 - - [06/Dec/2022 21:16:06] "GET / HTTP/1.1" 200 -
192.168.45.16 - - [06/Dec/2022 21:16:21] "HEAD / HTTP/1.1" 200 -
^CServer stopped.
```
