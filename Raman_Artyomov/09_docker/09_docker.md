## Docker

[dockerhub](https://hub.docker.com/repository/docker/pupkinsvasily/test_python_listener)

### history
```bash
mkdir Docker
vim Dockerfile 
listen_5000.py
docker build -t pupkinsvasily/test_python_listener:0.01 .
docker run -d -p 5000:5000 --name test1 pupkinsvasily/test_python_listener:0.01
telnet 127.0.0.1 5000
docker stop test1
docker login
docker push pupkinsvasily/test_python_listener:0.01
```

### Docker output
```bash
# docker build -t pupkinsvasily/test_python_listener:0.01 .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM python:3.8
 ---> b716d5a96fde
Step 2/4 : COPY listen_5000.py /
 ---> Using cache
 ---> 7629e955a67b
Step 3/4 : CMD ["python3", "/listen_5000.py"]
 ---> Using cache
 ---> ceca59fa0e1f
Step 4/4 : EXPOSE 5000
 ---> Using cache
 ---> 5ac037a44430
Successfully built 5ac037a44430
Successfully tagged pupkinsvasily/test_python_listener:0.01
# docker run -d -p 5000:5000 --name test1 pupkinsvasily/test_python_listener:0.01
7c65de5e8126fb98079a6668e46c7bd15d2d6c4757849fe8979355648f070ccf
# telnet 127.0.0.1 5000
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
^]
telnet> Connection closed.
# docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
# docker push pupkinsvasily/test_python_listener:0.01
The push refers to repository [docker.io/pupkinsvasily/test_python_listener]
2cf8eae9df73: Pushed 
4bee83e267b5: Layer already exists 
a29b259e81f9: Layer already exists 
c75080a21a0a: Layer already exists 
4b4c002ee6ca: Layer already exists 
cdc9dae211b4: Layer already exists 
7095af798ace: Layer already exists 
fe6a4fdbedc0: Layer already exists 
e4d0e810d54a: Layer already exists 
4e006334a6fd: Layer already exists 
0.01: digest: sha256:fa6f9a3f05d4591123b6bd486d03e10a4fb2fcc352b2e70d58e5d73a3a6099c7 size: 2424
```

### Dockerfile
```bash
FROM python:3.8

COPY listen_5000.py /

CMD ["python3", "/listen_5000.py"]

EXPOSE 5000
```

### listen_5000.py
```python
#!/usr/bin/env python3

import socket

sock = socket.socket()
sock.bind(('', 5000))
sock.listen(1)
conn, addr = sock.accept()

print("connected:", addr)

while True:
    data = conn.recv(1024)
    if not data:
        continue
    conn.send(data)

conn.close()
```
