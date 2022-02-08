### 09.Docker

## DockerHub [link](https://hub.docker.com/repository/docker/dimatriput/docker_demo)

```bash
vagrant@ubuntu-bionic:~/docker/containerize-python-server$ docker run -d -p 8000:8000 simple_server
14a212767de1c891408742b380ca7484e9d67ae78999f068a013435fa99a52ce
vagrant@ubuntu-bionic:~/docker/containerize-python-server$ curl -iv localhost:8000
* Rebuilt URL to: localhost:8000/
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8000 (#0)
> GET / HTTP/1.1
> Host: localhost:8000
> User-Agent: curl/7.58.0
> Accept: */*
>
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
HTTP/1.0 200 OK
< Server: SimpleHTTP/0.6 Python/3.10.2
Server: SimpleHTTP/0.6 Python/3.10.2
< Date: Tue, 08 Feb 2022 20:54:29 GMT
Date: Tue, 08 Feb 2022 20:54:29 GMT
< Content-type: text/html; charset=utf-8
Content-type: text/html; charset=utf-8
< Content-Length: 354
Content-Length: 354

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
<li><a href="simple_server.py">simple_server.py</a></li>
</ul>
<hr>
</body>
</html>
* Closing connection 0
vagrant@ubuntu-bionic:~/docker/containerize-python-server$

```
