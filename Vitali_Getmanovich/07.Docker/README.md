# 07.Docker
## Python application
```python3
import socket
import sys


# specify Host and Port
HOST = ''
PORT = 5000

soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
        # With the help of bind() function
        # binding host and port
        soc.bind((HOST, PORT))

except socket.error as message:

        # if any error occurs then with the
        # help of sys.exit() exit from the program
        print('Bind failed. Error Code : '
                + str(message[0]) + ' Message '
                + message[1])
        sys.exit()

# print if Socket binding operation completed
print('Socket binding operation completed')

# With the help of listening () function
# starts listening
soc.listen(9)

conn, address = soc.accept()
# print the address of connection
print('Connected with ' + address[0] + ':'
        + str(address[1]))
```
---
## Dockerfile
```bash
FROM python:3.11-slim
COPY application.py ./
ENTRYPOINT [ "python", "application.py" ]
```
---
## Docker build
```bash
vitali@vitali-VirtualBox:~/Course/071.Docker$ docker build -t socket:1.0 .
[+] Building 2.6s (7/7) FINISHED
 => [internal] load build definition from dockerfile                       0.2s
 => => transferring dockerfile: 127B                                       0.0s
 => [internal] load .dockerignore                                          0.1s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim        1.5s
 => [internal] load build context                                          0.0s
 => => transferring context: 774B                                          0.0s
 => CACHED [1/2] FROM docker.io/library/python:3.11-slim@sha256:d0e839882  0.0s
 => [2/2] COPY application.py ./                                           0.6s
 => exporting to image                                                     0.2s
 => => exporting layers                                                    0.2s
 => => writing image sha256:99cbf3d59506286420d0ada007cba66d0b6b559e348d1  0.0s
 => => naming to docker.io/library/socket:1.0    
 ```
---
## Docker images
```bash
vitali@vitali-VirtualBox:~/Course/071.Docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
socket       1.0       99cbf3d59506   About a minute ago   128MB
```
---
## Docker run
```bash 
vitali@vitali-VirtualBox:~/Course/071.Docker$ docker run --name socket -t -p 5500:5500 socket:1.0
Socket binding operation completed

```
---
## Docker ps
```bash
vitali@vitali-VirtualBox:~/Course/071.Docker$ docker ps
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS          PORTS                                       NAMES
4c2148d128b1   socket:1.0   "python application.…"   25 seconds ago   Up 22 seconds   0.0.0.0:5500->5500/tcp, :::5500->5500/tcp   socket

```
---
## Check and test
```bash 
vitali@vitali-VirtualBox:~/Course/071.Docker$ sudo ss -tlpn
[sudo] password for vitali:
State     Recv-Q    Send-Q       Local Address:Port        Peer Address:Port    Process
LISTEN    0         128              127.0.0.1:631              0.0.0.0:*        users:(("cupsd",pid=2660566,fd=7))
LISTEN    0         4096         127.0.0.53%lo:53               0.0.0.0:*        users:(("systemd-resolve",pid=1937102,fd=14))
LISTEN    0         128                0.0.0.0:22               0.0.0.0:*        users:(("sshd",pid=742,fd=3))
LISTEN    0         4096               0.0.0.0:5500             0.0.0.0:*        users:(("docker-proxy",pid=2885100,fd=4))
LISTEN    0         128                   [::]:22                  [::]:*        users:(("sshd",pid=742,fd=4))
LISTEN    0         128                  [::1]:631                 [::]:*        users:(("cupsd",pid=2660566,fd=6))
LISTEN    0         4096                  [::]:5500                [::]:*        users:(("docker-proxy",pid=2885105,fd=4))
```
```bash
vitali@vitali-VirtualBox:~/Course/071.Docker$ telnet localhost 5500
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Connection closed by foreign host.
```
