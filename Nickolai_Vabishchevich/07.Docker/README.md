# 07.Docker
  
## Preparing

### Docker file

```bash
FROM python:3.8-slim-buster

COPY ./listener.py ~/listener.py

WORKDIR ~

EXPOSE 8484

ENTRYPOINT "python3" "listener.py"
```

### Python application

```bash
import socket

ip = ""
port = 8484

print("Listener started on %s:%s" % (ip, port))

def listener():
    listener_socket = socket.socket()
    listener_socket.bind((ip, port))
    listener_socket.listen(2)
    conn, address = listener_socket.accept()
    conn.send(b'SUCCESS! WELCOME TO THE SERVER!\n')
    print("Connection from: " + str(address))
    conn.close()

if __name__ == '__main__':
    listener()
```

### Build docker image 
  
```bash
root@vnl:/home/vnl/docker/07.docker/HW# docker build -t port_listener:my .
[+] Building 50.8s (8/8) FINISHED                                                                                                                             
 => [internal] load .dockerignore                                                                                                                        0.8s
 => => transferring context: 2B                                                                                                                          0.1s
 => [internal] load build definition from dockerfile                                                                                                     0.8s
 => => transferring dockerfile: 159B                                                                                                                     0.1s
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster                                                                                4.2s
 => [internal] load build context                                                                                                                        0.2s
 => => transferring context: 458B                                                                                                                        0.0s
 => [1/3] FROM docker.io/library/python:3.8-slim-buster@sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2                         39.2s
 => => resolve docker.io/library/python:3.8-slim-buster@sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2                          0.0s
 => => sha256:f51af6b4116b1c3a5a7934070b0761d1dcb82592ee7e8ecee8ab93d3e2a3cfe2 988B / 988B                                                               0.0s
 => => sha256:4bc25e1810c14af78ca0235ff6f63740113540fd49f8dc5bc6c7b456572b5806 1.37kB / 1.37kB                                                           0.0s
 => => sha256:48d520b650a800fe7fd19f1160e51a1b49fac63bc1db79fd39a0b6725d6c1c92 7.83kB / 7.83kB                                                           0.0s
 => => sha256:80cabd6bcbca49b0801424a2bdcaf90246874314263f92e67eb3c907c6d29747 232B / 232B                                                               1.5s
 => => sha256:e53683fb464bd118081a539c199f8918d31828d851085907fa5a1c5ee324efb3 2.78MB / 2.78MB                                                          16.4s
 => => sha256:92b8eda1d319c19e0ab4aa21abc8021b8cf9d7d661fff6f586791ef10d8e087a 10.85MB / 10.85MB                                                        34.1s
 => => sha256:ae9d18f64c345e73676a90377c9df323289bd1a750e1845cdde42464f3486067 3.17MB / 3.17MB                                                          18.0s
 => => extracting sha256:e53683fb464bd118081a539c199f8918d31828d851085907fa5a1c5ee324efb3                                                                3.0s
 => => extracting sha256:92b8eda1d319c19e0ab4aa21abc8021b8cf9d7d661fff6f586791ef10d8e087a                                                                2.2s
 => => extracting sha256:80cabd6bcbca49b0801424a2bdcaf90246874314263f92e67eb3c907c6d29747                                                                0.0s
 => => extracting sha256:ae9d18f64c345e73676a90377c9df323289bd1a750e1845cdde42464f3486067                                                                1.7s
 => [2/3] COPY ./listener.py ~/listener.py                                                                                                               4.1s
 => [3/3] WORKDIR ~                                                                                                                                      0.6s
 => exporting to image                                                                                                                                   0.6s
 => => exporting layers                                                                                                                                  0.5s
 => => writing image sha256:aa2fcdfb1558a50746fe67b018f7fd77b383af86357dfa662ac709e8dd8b73fe                                                             0.0s
 => => naming to docker.io/library/port_listener:my                                                                                                      0.1s
```

### Running image 

```bash
root@vnl:/home/vnl/docker/07.docker/HW# docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
port_listener   my        37c0d8cb98af   19 seconds ago   116MB

root@vnl:/home/vnl/docker/07.docker/HW# docker run -it -p 8484:8484 --name listener port_listener:my
Listener started on :8484

root@vnl:/home/vnl/docker/07.docker/HW# docker ps
CONTAINER ID   IMAGE              COMMAND                   CREATED         STATUS         PORTS                                       NAMES
68dc02ff451f   port_listener:my   "/bin/sh -c '\"python…"   8 seconds ago   Up 6 seconds   0.0.0.0:8484->8484/tcp, :::8484->8484/tcp   listener

```

## CLI output

### docker image output

```bash
root@vnl:/home/vnl/docker/07.docker/HW# docker run -it -p 8484:8484 --name listener port_listener:my
Listener started on :8484
Connection from: ('172.17.0.1', 40112)
``` 

### curl

```bash 
root@vnl:/home/vnl/docker/07.docker/HW# curl --http0.9 127.0.0.1:8484
SUCCESS! WELCOME TO THE SERVER!
```

### telnet

```bash
root@vnl:/home/vnl/docker/07.docker/HW# telnet 127.0.0.1 8484
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
SUCCESS! WELCOME TO THE SERVER!
Connection closed by foreign host.
```
