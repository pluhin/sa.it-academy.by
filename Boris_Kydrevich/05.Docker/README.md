### Link to Dockerhub
[My Dockerhub](https://hub.docker.com/repository/docker/sunbrooo/portscript)

### Dockerfile
````
FROM python:3.9.2-alpine3.13

ADD script.py /

CMD ["python3", "./script.py"]

EXPOSE 10451
````

### Script

`````

# python3

import socket

HOST = '127.0.0.1' 
PORT = 10451       

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
            conn.sendall(data)

`````


### My logs

`````
vagrant@debian10:~/test$ docker build -t sunbrooo/portscript:v0.1 .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM python:3.9.2-alpine3.13
 ---> 36a177f36775
Step 2/4 : ADD script.py /
 ---> Using cache
 ---> 8703c5e08eed
Step 3/4 : CMD ["python3", "./script.py"]
 ---> Using cache
 ---> 8c638f10deb4
Step 4/4 : EXPOSE 10451
 ---> Using cache
 ---> f8cfc79462fd
Successfully built f8cfc79462fd
Successfully tagged sunbrooo/portscript:v0.1
vagrant@debian10:~/test$ docker push sunbrooo/portscript:v0.1
The push refers to repository [docker.io/sunbrooo/portscript]
3e00dc097c41: Pushed 
ab4c23f7f8c0: Pushed 
4be634b17888: Pushed 
1665fa55a416: Pushed 
a5e95e9ad9ff: Pushed 
cb381a32b229: Pushed 
v0.1: digest: sha256:f2d23fc1c3a13aaa5053a5dcc039e0aa51f1d40d838b0a2395cfaedd01acb79c size: 1575

vagrant@debian10:~/test$ docker run -it -d -p 10451:10451 --name porttest sunbrooo/portscript:v0.1
61b4f01c760603c48b95b7044e93e3b56ea28443c44a957c85150a4ad013b474
vagrant@debian10:~/test$ telnet localhost 10451
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Connection closed by foreign host.
