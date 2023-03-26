# 07.Docker

## Docker

```bash
FROM python:latest

WORKDIR /Docker
COPY docker.py ./
ENTRYPOINT ["python", "docker.py"]
```

## docker.py

```python
import http.server
import socketserver

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'This port is up')
        self.end_headers()

with socketserver.TCPServer(("", 8005), MyHandler) as httpd:
    print("Listening on port", 8005)
    httpd.serve_forever()
```

## images

```bash
root@vm1:~# docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
demo         2         0e6773cc8b3a   9 minutes ago    921MB
demo         1         29ba86f79093   22 minutes ago   921MB
nginx        latest    ac232364af84   2 days ago       142MB
```

## curl

```bash
root@vm1:~# curl http://127.0.0.1:8005
This port is up

172.17.0.1 - - [26/Mar/2023 13:10:16] "GET / HTTP/1.1" 200 -

```
