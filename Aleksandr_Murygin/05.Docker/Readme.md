## [Docker repository](https://hub.docker.com/repository/docker/aleksandrmur/2rep)

## Dockerfile
```sh
FROM python:3.7.2-alpine3.8

RUN mkdir /script

COPY . /script

WORKDIR /script

ENV PYTHONUNBUFFERED=1

CMD ["python", "python.py"]
```
## Commands
```sh
 docker pull aleksandrmur/2rep
 docker run -it -p 9000:8000 aleksandrmur/2rep
```
## Test
```sh
curl -iv localhost:9000
* Rebuilt URL to: localhost:9000/
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 9000 (#0)
> GET / HTTP/1.1
> Host: localhost:9000
> User-Agent: curl/7.58.0
> Accept: */*
>
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
HTTP/1.0 200 OK
< Server: SimpleHTTP/0.6 Python/3.7.2
Server: SimpleHTTP/0.6 Python/3.7.2
< Date: Thu, 04 Mar 2021 11:32:20 GMT
Date: Thu, 04 Mar 2021 11:32:20 GMT
< Content-type: text/html; charset=utf-8
Content-type: text/html; charset=utf-8
< Content-Length: 420
Content-Length: 420

<
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
<li><a href=".git/">.git/</a></li>
<li><a href="Dockerfile">Dockerfile</a></li>
<li><a href="python.py">python.py</a></li>
</ul>
<hr>
</body>
</html>
* Closing connection 0
```
