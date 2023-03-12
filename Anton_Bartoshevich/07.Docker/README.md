# Create a Docker file of any Python application
## Create the Python application
```bash
import socket
import sys
HOST = ''   
PORT = 1234 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    sys.exit()
s.listen(10)
while 1:
    conn, addr = s.accept()
s.close()
```
## Create the Dockerfile
```bash
FROM ubuntu
RUN  apt-get -y update && apt-get -y upgrade && apt-get -y install python3-pip
COPY port_listener.py /home
CMD ["python3", "/home/port_listener.py"]
```
# Run image as container and test it
## History of commands
```bash
 1274  vi Dockerfile
 1284  docker build -t app:3 -f Dockerfile .
 1288  docker run -d -it app:3
 1289  docker ps
 1290  docker inspect app:3 | grep IPAddress
 1290  telnet 172.17.0.2 1234
    Trying 172.17.0.2...
    Connected to 172.17.0.2.
    Escape character is '^]'.
    ^]
    telnet> Connection closed.
 1315  docker login
 1316  docker tag app:3 caymankey/app:3
 1317  docker push app:3
```
# [Docker image](https://hub.docker.com/repository/docker/caymankey/app/general)