# 05.Docker
## Dockerfile
```
FROM alpine:latest

MAINTAINER IKorolev

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip \
    && mkdir /myapp

COPY q.py /myapp/q.py

CMD ["python3", "/myapp/q.py"]

EXPOSE 6589
```
[Dockerhub](https://hub.docker.com/r/korolev731/test)

## Script_lisener
```
import socket

# Configure socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('', 6589))
server.listen()

# Listen requests
while True:
    client_socket, addr = server.accept()
    request = client_socket.recv(1024)
    print ('Connected ' + addr[0] + ':' + str(addr[1]))
    client_socket.sendall(b'Welcome to Server! nakonec poluchilos')
    client_socket.close()
```
## Test Logs
```
[dom]# curl localhost:80
Its Works!

[dom]# telnet localhost 80
Trying ::1..
Connected to localhost.
Escape character is '^]'.
```
