# Docker homework_09

## Repository links
[Github](https://github.com/S-Stepanenko/homework_09)

### Docker building
```bash
sergey@ubunru22:~/09.Docker$ docker build -t test:v0.2 -f Dockerfile .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM python:alpine
alpine: Pulling from library/python
213ec9aee27d: Already exists 
6b2a141cd227: Pull complete 
a292fad6b52e: Pull complete 
4593e4e33a59: Pull complete 
9fc487f38654: Pull complete 
Digest: sha256:0c46c7f15ee201a2e2dc3579dbc302f989a20b1283e67f884941e071372eb2cc
Status: Downloaded newer image for python:alpine
 ---> ce4168535f30
Step 2/3 : COPY server.py /server.py
 ---> a8fcd589e4ee
Step 3/3 : ENTRYPOINT ["python3","-u", "server.py"]
 ---> Running in 2185b256c58b
Removing intermediate container 2185b256c58b
 ---> 77c109217772
Successfully built 77c109217772
Successfully tagged test:v0.2
```

### RUN docker
```bash
sergey@ubunru22:~/09.Docker$ docker run -p 8001:8000 -d test:v0.2
8cb16149853ae28624bd11c5ad2c90799a9ef946f996c3c398ddbdba17e49c6b
```

### Testing server
```bash
sergey@ubunru22:~/09.Docker$ telnet localhost 8001
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

sergey@ubunru22:~/09.Docker$ curl http://127.0.0.1:8001
Hello world from hostname: dbd14e49182f
```

### Checks docker images.
```bash
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
test         v0.2      0a995767369e   5 minutes ago   47.8MB
python       alpine    2c167788a673   3 weeks ago     47.8MB


sergey@ubunru22:~/09.Docker$ docker images
REPOSITORY          TAG       IMAGE ID       CREATED          SIZE
test                v0.2      77c109217772   2 minutes ago    48.7MB
```
