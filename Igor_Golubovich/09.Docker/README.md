# 09.Docker by Igor Golubovich

## Links to my Docker image

- [Docker Hub](https://hub.docker.com/repository/docker/golubovich91/web_test/)
- [Github repo](https://github.com/igor-golubovich/09.Docker_hm)

## Testing commands

```bash
igoz@Ubuntu20:~/Desktop/devops_homework/Docker$ docker build -t i_golubovich_image:v1.0 .
Sending build context to Docker daemon  43.01kB
Step 1/4 : FROM python:alpine
alpine: Pulling from library/python
df9b9388f04a: Pull complete
a1ef3e6b7a02: Pull complete
7a687728470e: Pull complete
4ecf30de1710: Pull complete
c3b27164aa0c: Pull complete
Digest: sha256:f4c1b7853b1513eb2f551597e2929b66374ade28465e7d79ac9e099ccecdfeec
Status: Downloaded newer image for python:alpine
 ---> 8b74835e51c6
Step 2/4 : MAINTAINER Igor_Golubovich
 ---> Running in 910462bbb416
Removing intermediate container 910462bbb416
 ---> 24c5eef7b2db
Step 3/4 : COPY test_api.py /test_api.py
 ---> f0ae10ab2007
Step 4/4 : ENTRYPOINT ["python3","-u", "test_api.py"]
 ---> Running in a9a9488bc654
Removing intermediate container a9a9488bc654
 ---> b669bcc6e860
Successfully built b669bcc6e860
Successfully tagged i_golubovich_image:v1.0

igoz@Ubuntu20:~/Desktop/devops_homework/Docker$ docker run -d -p 8090:8090 --name webserver i_golubovich_image:v1.0
9be4ea855ed7546cf457743b91f02fda7fb76fe8a65bbb57b80efcbe8f90cce7
igoz@Ubuntu20:~/Desktop/devops_homework/Docker$ curl http://localhost:8090
Webserver's test was success

igoz@Ubuntu20:~/Desktop/devops_homework/Docker$ telnet localhost 8090
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

Connection closed by foreign host.
igoz@Ubuntu20:~/Desktop/devops_homework/Docker
```
