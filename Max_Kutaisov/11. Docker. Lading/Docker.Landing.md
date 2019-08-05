## `Docker.Landing`

**Dockerfile**

```
	FROM alpine:latest
	RUN apk add --update
	RUN echo "**** install Python ****"
	RUN apk add --no-cache python3
	RUN echo "**** Python version ****"
	RUN python3 --version
	RUN echo "**** COPY APP ****"
	COPY ./app_python /home/app_python
	RUN echo "**** set EXPOSE ****"
	EXPOSE 8000
	WORKDIR /home/app_python
	RUN echo "**** run Python ****"
	CMD python3 -m http.server --cgi
```

**App Python**

```
hello.py
--------

#!/usr/bin/python

print ("Content-type: text/html \n")
print("<h1>Hello World!</h1>")
```

```
env_var.py
--------

#!/usr/bin/python
import os

print("Content-type: text/html\r\n\r\n")
print("<font size=+10>Environment</font><br>")

for param in os.environ.keys():
print("<b>%20s</b>: %s<br>" % (param, os.environ[param]))
```

**Docker build - start**

```
docker build . -f Dockerfile_alpine -t alpine_python_1
```

**Docker build - progress build**

```
Sending build context to Docker daemon  18.43kB
Step 1/12 : FROM alpine:latest
latest: Pulling from library/alpine
050382585609: Pull complete
Digest: sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998
Status: Downloaded newer image for alpine:latest
 ---> b7b28af77ffe
Step 2/12 : RUN apk add --update
 ---> Running in 9a0dbb847722
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
OK: 6 MiB in 14 packages
 ---> 1f18e81d9daf
Removing intermediate container 9a0dbb847722
Step 3/12 : RUN echo "**** install Python ****"
 ---> Running in 52ebc77a1845
**** install Python ****
 ---> f04ad0c0248b
Removing intermediate container 52ebc77a1845
Step 4/12 : RUN apk add --no-cache python3
 ---> Running in 49cd32070893
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
(1/11) Installing libbz2 (1.0.6-r7)
(2/11) Installing expat (2.2.7-r0)
(3/11) Installing libffi (3.2.1-r6)
(4/11) Installing gdbm (1.13-r1)
(5/11) Installing xz-libs (5.2.4-r0)
(6/11) Installing ncurses-terminfo-base (6.1_p20190518-r0)
(7/11) Installing ncurses-terminfo (6.1_p20190518-r0)
(8/11) Installing ncurses-libs (6.1_p20190518-r0)
(9/11) Installing readline (8.0.0-r0)
(10/11) Installing sqlite-libs (3.28.0-r0)
(11/11) Installing python3 (3.7.3-r0)
Executing busybox-1.30.1-r2.trigger
OK: 69 MiB in 25 packages
 ---> ba7ccfdda54c
Removing intermediate container 49cd32070893
Step 5/12 : RUN echo "**** Python version ****"
 ---> Running in cddde3ecad3d
**** Python version ****
 ---> 970ea0b885d9
Removing intermediate container cddde3ecad3d
Step 6/12 : RUN python3 --version
 ---> Running in 380efb60b3eb
Python 3.7.3
 ---> 4c8b4af64e16
Removing intermediate container 380efb60b3eb
Step 7/12 : RUN echo "**** set EXPOSE ****"
 ---> Running in 76457360ab6a
**** set EXPOSE ****
 ---> bb5cc6a2be92
Removing intermediate container 76457360ab6a
Step 8/12 : EXPOSE 8000
 ---> Running in bbacc31c84ba
 ---> 71fd4e68a570
Removing intermediate container bbacc31c84ba
Step 9/12 : RUN echo "**** COPY app_python ****"
 ---> Running in 0d0f1256d475
**** COPY app_python ****
 ---> f54dfd994a41
Removing intermediate container 0d0f1256d475
Step 10/12 : COPY ./app_python /home/app_python
 ---> 8ee92d046de0
Removing intermediate container 3d05de02084b
Step 11/12 : RUN echo "**** run Python ****"
 ---> Running in 1a641477ac59
**** run Python ****
 ---> 3e10dd591cb5
Removing intermediate container 1a641477ac59
Step 12/12 : CMD python3 -m http.server --cgi
 ---> Running in 4171657c1a8a
 ---> d24b676ced1c
Removing intermediate container 4171657c1a8a
Successfully built d24b676ced1c
Successfully tagged alpine_python_1:latest
```

**Docker images**

```
docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine_python_1     latest              d24b676ced1c        58 seconds ago      60.2MB
alpine              latest              b7b28af77ffe        3 weeks ago         5.58MB
```

**Docker run**

```
docker run -d -p 8000:8000 alpine_python_1
```

**Docker list containers**

```
docker ps -a


CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                    NAMES
9276044ac503        alpine_python_1     "/bin/sh -c 'pytho..."   About a minute ago   Up About a minute   0.0.0.0:8000->8000/tcp affectionate_euler

```

**192.168.1.100:8000/cgi-bin/env_var.py**

![alt-текст](https://i.ibb.co/Ln9KvGx/env-par-py.jpg "env_var.py")

**192.168.1.100:8000/cgi-bin/hello.py**

![alt-текст](https://i.ibb.co/sm6mrzQ/hello-py.jpg "hello.py")

**Add image to docker hub**

```
docker login

Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.

Username: trenon
Password:

Login Succeeded
```

```
# rename created image
docker tag c204742fd67e trenon/alpine_python_1:latest
```

```
docker push trenon/alpine_python_1

18e8227bd96c: Pushed
dca2cd642481: Pushed
0b9d255e16af: Pushed
5776ffd8e98b: Pushed
1bfeebd65323: Pushed
latest: digest: sha256:08607b31226f3810cfcf2d6d80bc44157124fb938372f1703623d4fbb123e769 size: 1365
```

**Image link in docker hub**

```
https://cloud.docker.com/repository/docker/trenon/alpine_python_1
```
