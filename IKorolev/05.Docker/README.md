# 05.Docker
## Dockerfile
```
FROM centos:latest

MAINTAINER IKorolev

RUN yum install epel-release -y \
    && yum update -y \
    && yum install python3-pip -y \
    && mkdir /www

COPY q.py /www/q.py

CMD ["python3", "/www/q.py"]

EXPOSE 6598
```
[Dockerhub](https://hub.docker.com/r/korolev731/test)

## Script_lisener
```
import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)


server.bind(('', 6598))
server.listen()
while True:
      client_socket, addr = server.accept()
      request = client_socket.recv(1024)
      print ('Connected ' + addr[0] + ':' + str(addr[1]))
      client_socket.sendall(b'Its Works!')
      client_socket.close()
```
