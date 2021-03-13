# 05.Docker
## Dockerfile
```sh
FROM python:3

RUN mkdir /test

COPY . /test

CMD python /test/python_listener.py 9003

EXPOSE 9003
```
## Dockerhub link
[Dockerhub](https://hub.docker.com/repository/docker/sergeikoltochihin/python-listener/general)
## Commands history
```sh
docker build -t python-listener -f 05.Dockerfile .
docker run -it -p 9003:9003 --name python-listener python-listener
docker build -t sergeikoltochihin/python-listener:1 -f 05.Dockerfile .
docker login
docker push sergeikoltochihin/python-listener:1
```
## Testing
You can use any curl command like GET/POST.
Basic example provided below
```sh
curl -G  127.0.0.1:9003 -d "asdasdasd" --verbose

*   Trying 127.0.0.1:9003...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 9003 (#0)
> GET /?asdasdasd HTTP/1.1
> Host: 127.0.0.1:9003
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Server: BaseHTTP/0.6 Python/3.9.2
< Date: Tue, 02 Mar 2021 07:44:27 GMT
< Content-type: text/html
< 
* Closing connection 0
GET request for /?asdasdasd
```
