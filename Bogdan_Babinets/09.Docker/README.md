# 09. Docker

## Dockerfile

```bash
FROM alpine
# Install python on base Alpine
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
# Run simple webserver
COPY se80.py /se80.py
CMD ["python","/se80.py"]
EXPOSE 80
```

## Links to Docker image and files

https://hub.docker.com/r/bb8312/09.docker
https://github.com/BB8312/docker_files/

## Run image as container

```bash
root@de64:~/doc/doc2# docker run -p 80:80 bb8312/09.docker:bb8312v1
Unable to find image 'bb8312/09.docker:bb8312v1' locally
bb8312v1: Pulling from bb8312/09.docker
2408cc74d12b: Pull complete
e1f2fe8071f5: Pull complete
cd6481165d72: Pull complete
9db48a443d5f: Pull complete
68689b01307c: Pull complete
Digest: sha256:866c48df9bdf0ac5fabd2f1a83cd1fed08fd5a555109e8d3252ea0c81785ab59
Status: Downloaded newer image for bb8312/09.docker:bb8312v1
172.17.0.1 - - [24/May/2022 14:07:45] "HEAD / HTTP/1.1" 200 -
172.17.0.1 - - [24/May/2022 14:07:50] "GET / HTTP/1.1" 200 -
192.168.153.1 - - [24/May/2022 14:08:56] "GET / HTTP/1.1" 200 -
192.168.153.1 - - [24/May/2022 14:08:59] code 404, message File not found
192.168.153.1 - - [24/May/2022 14:08:59] "GET /favicon.ico HTTP/1.1" 404 -
192.168.153.1 - - [24/May/2022 14:09:11] "GET /se80.py HTTP/1.1" 200 -
```

## History of testing command

```bash
root@de64:~# curl -I localhost
HTTP/1.0 200 OK
Server: SimpleHTTP/0.6 Python/3.10.4
Date: Tue, 24 May 2022 14:07:45 GMT
Content-type: text/html; charset=utf-8
Content-Length: 954

root@de64:~# curl localhost
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href=".dockerenv">.dockerenv</a></li>
<li><a href="bin/">bin/</a></li>
<li><a href="dev/">dev/</a></li>
<li><a href="etc/">etc/</a></li>
<li><a href="home/">home/</a></li>
<li><a href="lib/">lib/</a></li>
<li><a href="media/">media/</a></li>
<li><a href="mnt/">mnt/</a></li>
<li><a href="opt/">opt/</a></li>
<li><a href="proc/">proc/</a></li>
<li><a href="root/">root/</a></li>
<li><a href="run/">run/</a></li>
<li><a href="sbin/">sbin/</a></li>
<li><a href="se80.py">se80.py</a></li>
<li><a href="srv/">srv/</a></li>
<li><a href="sys/">sys/</a></li>
<li><a href="tmp/">tmp/</a></li>
<li><a href="usr/">usr/</a></li>
<li><a href="var/">var/</a></li>
</ul>
<hr>
</body>
</html>
```

## Screenshot screen.jpg which demonstrates testing by the browser is attached into folder 09.Docker
