[Link to Dockerhub](https://hub.docker.com/repository/docker/valera1992/docker)

### PORT LISTENER

This Dockerfile based on python:2 image from [here](https://hub.docker.com/_/python).

#### How-to:

* Run Dockerfile

```bash
docker build -t python_port:v1 -f Dockerfile .
```

* Run docker container with port forwarding

```bash
docker run -it -p 1337:8888 python_port:v1
```

* Open new connection to host in new tab

* Connect to port via telnet

```bash
telnet localhost 1337
```

### Basic output

```bash
user@user:~$ telnet localhost 1337
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
Welcome to the server. Type something and hit enter
allo
You wrote me...allo
...:)
You wrote me...
...:)kek
You wrote me...kek
...:)
```
