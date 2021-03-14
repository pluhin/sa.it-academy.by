###### link to dockerhub
<https://hub.docker.com/r/polyak852/05_hw>

###### history of testing command
```
[root@localhost 05_hw]# docker build -t 05_hw:1 -f Dockerfile .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM python:3.9.2-alpine3.13
3.9.2-alpine3.13: Pulling from library/python
ba3557a56b15: Already exists
996c4f0e31fa: Pull complete
476a615c7791: Pull complete
1f2ae9e45137: Pull complete
cdcfcfbaf716: Pull complete
Digest: sha256:437482dd314471f5f10967f7376489d9e7f67c111850c123cc725a1741b66aac
Status: Downloaded newer image for python:3.9.2-alpine3.13
 ---> 36a177f36775
Step 2/4 : ADD echo-server.py /
 ---> 08297a3a1a3c
Step 3/4 : CMD ["python3", "./echo-server.py"]
 ---> Running in 4f38df9d3fc3
Removing intermediate container 4f38df9d3fc3
 ---> a0425b69385c
Step 4/4 : EXPOSE 8888
 ---> Running in 7fa301596e28
Removing intermediate container 7fa301596e28
 ---> ce3b7ba332c7
Successfully built ce3b7ba332c7
Successfully tagged 05_hw:1

[root@localhost 05_hw]# docker run -it -d -p 8888:8888 --name tester_port 05_hw:1
9fce8a9fd12401890dd0da24ceff36f65f72f910e49f567e216770500cf4b029

[root@localhost 05_hw]# telnet localhost 8888
Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Connection closed by foreign host.

[root@localhost 05_hw]# docker push polyak852/05_hw:1
The push refers to repository [docker.io/polyak852/05_hw]
An image does not exist locally with the tag: polyak852/05_hw
[root@localhost 05_hw]# docker build -t polyak852/05_hw:1 -f Dockerfile .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM python:3.9.2-alpine3.13
 ---> 36a177f36775
Step 2/4 : ADD echo-server.py /
 ---> Using cache
 ---> 08297a3a1a3c
Step 3/4 : CMD ["python3", "./echo-server.py"]
 ---> Using cache
 ---> a0425b69385c
Step 4/4 : EXPOSE 8888
 ---> Using cache
 ---> ce3b7ba332c7
Successfully built ce3b7ba332c7
Successfully tagged polyak852/05_hw:1

```