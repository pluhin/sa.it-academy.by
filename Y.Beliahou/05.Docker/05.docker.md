# 05.Docker

## apy.py
---
```
import socket

HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
PORT = 65432        # Port to listen on (non-privileged ports are > 1023)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
```
## dockerfile
---
```
FROM alpine:latest

MAINTAINER Y.Belyagov

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip \
    && mkdir /apiPython

COPY apy.py /apyPython/apy.py

CMD ["python3", "/apyPython/apy.py"]

EXPOSE 65432
```

##

[Link to see docker hub](https://hub.docker.com/repository/docker/belyagov/apy)


![alt text](https://github.com/mrvaart23/screenshots/blob/main/Screenshot%20from%202021-04-14%2000-48-02.png)


## Steps to reproduce
---
```bash
u2@Note:~$ sudo docker run -it -d -p 65432:65432  belyagov/apy:1
4266c73aec900fdc13e5b240fcf88f07f5ce1f956abaa01338f552f5325dc207
u2@Note:~$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                 NAMES
4266c73aec90        belyagov/apy:1      "python3 /apyPython/…"   15 seconds ago      Up 9 seconds        0.0.0.0:65432->65432/tcp              sad_ardinghelli
u2@Note:~$ netstat -tlpn
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:39501           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:32975           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:44789           0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:7071            0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:2049            0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:40545           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:55907           0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::35247                :::*                    LISTEN      -                   
tcp6       0      0 :::111                  :::*                    LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
tcp6       0      0 ::1:631                 :::*                    LISTEN      -                   
tcp6       0      0 :::65432                :::*                    LISTEN      -                   
tcp6       0      0 :::33177                :::*                    LISTEN      -                   
tcp6       0      0 :::53210                :::*                    LISTEN      -                   
tcp6       0      0 :::45019                :::*                    LISTEN      -                   
tcp6       0      0 :::2049                 :::*                    LISTEN      -                   
tcp6       0      0 :::56835                :::*                    LISTEN      -                   
u2@Note:~$ telnet 127.0.0.1 65432
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
Connection closed by foreign host.
```



## Automated hook from GIT
---
[Link to see build history](https://hub.docker.com/repository/docker/belyagov/apy/builds)


