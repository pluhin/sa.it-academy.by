# Docker home task.

## Repository links
[Github](https://github.com/Demo2886/Doker_build)
[Package ](https://github.com/users/Demo2886/packages/container/package/doker_build)

### Docker building
```bash
$ docker build -t test:v0.2 -f Dockerfile .
Sending build context to Docker daemon  5.632kB
Step 1/3 : FROM python:alpine
alpine: Pulling from library/python
df9b9388f04a: Pull complete
a1ef3e6b7a02: Pull complete
7a687728470e: Pull complete
4ecf30de1710: Pull complete
a1f99e431609: Pull complete
Digest: sha256:21c71a37aaa8b4bec1d07f373c7f32322d935accfeeb0b0860be1df6b194ecb5
Status: Downloaded newer image for python:alpine
 ---> 2c167788a673
Step 2/3 : COPY server.py /server.py
 ---> 6a1e7595fdd6
Step 3/3 : ENTRYPOINT ["python3","-u", "server.py"]
 ---> Running in 212b6e8a514f
Removing intermediate container 212b6e8a514f
 ---> 0a995767369e
Successfully built 0a995767369e
Successfully tagged test:v0.2
```

### RUN docker
```bash
$ docker run -p 8001:8000 -d test:v0.2
dbd14e49182f013c9853f14c7ee7657b608749fa73f8723a4aa0e191b18b0de8
```

### Testing server
```bash
$ telnet localhost 8001
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

$ curl http://127.0.0.1:8001
Hello world from hostname: dbd14e49182f
```

### Checks docker images.
```bash
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
test         v0.2      0a995767369e   5 minutes ago   47.8MB
python       alpine    2c167788a673   3 weeks ago     47.8MB


$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                                       NAMES
dbd14e49182f   test:v0.2   "python3 -u server.py"   3 minutes ago   Up 3 minutes   0.0.0.0:8001->8000/tcp, :::8001->8000/tcp   frosty_chaplygin
```
