# Docker file

```
FROM python:3.9.2-alpine3.13

WORKDIR /usr/src/app

COPY s_socket.py .

CMD [ "python", "s_socket.py" ]

```

# Build and test log

```
docker build -t arkadzit/s_socket:0.1 .
docker run -it -d -p 53210:53210 --name socket arkadzit/s_socket:0.1
telnet localhost 53210
    Trying ::1...
    Connection failed: Connection refused
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    ^]
    telnet> q
    Connection closed.
docker stop socket
docker push arkadzit/s_socket:0.1
```

# Automated build log

```
Cloning into '.'...
Warning: Permanently added the RSA host key for IP address '140.82.112.4' to the list of known hosts.
Reset branch 'master'
Your branch is up-to-date with 'origin/master'.
KernelVersion: 4.4.0-1060-aws
Components: [{u'Version': u'19.03.8', u'Name': u'Engine', u'Details': {u'KernelVersion': u'4.4.0-1060-aws', u'Os': u'linux', u'BuildTime': u'2020-03-11T01:24:30.000000000+00:00', u'ApiVersion': u'1.40', u'MinAPIVersion': u'1.12', u'GitCommit': u'afacb8b7f0', u'Arch': u'amd64', u'Experimental': u'false', u'GoVersion': u'go1.12.17'}}, {u'Version': u'1.2.13', u'Name': u'containerd', u'Details': {u'GitCommit': u'7ad184331fa3e55e52b890ea95e65ba581ae3429'}}, {u'Version': u'1.0.0-rc10', u'Name': u'runc', u'Details': {u'GitCommit': u'dc9208a3303feef5b3839f4323d9beb36df0a9dd'}}, {u'Version': u'0.18.0', u'Name': u'docker-init', u'Details': {u'GitCommit': u'fec3683'}}]
Arch: amd64
BuildTime: 2020-03-11T01:24:30.000000000+00:00
ApiVersion: 1.40
Platform: {u'Name': u'Docker Engine - Community'}
Version: 19.03.8
MinAPIVersion: 1.12
GitCommit: afacb8b7f0
Os: linux
GoVersion: go1.12.17
Starting build of index.docker.io/arkadzit/s_socket:first...
Step 1/4 : FROM python:3.9.2-alpine3.13
---> c89f09476494
Step 2/4 : WORKDIR /usr/src/app
---> Running in 85955bc0a579
Removing intermediate container 85955bc0a579
---> 03c4eb837016
Step 3/4 : COPY s_socket.py .
---> 22c07df0e1e6
Step 4/4 : CMD [ "python", "s_socket.py" ]
---> Running in 19c932c3531e
Removing intermediate container 19c932c3531e
---> 150a719e8733
Successfully built 150a719e8733
Successfully tagged arkadzit/s_socket:first
Pushing index.docker.io/arkadzit/s_socket:first...
Done!
Build finished
```