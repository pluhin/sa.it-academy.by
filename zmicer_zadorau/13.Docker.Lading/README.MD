# 13. Docker. Lading
========

### Create a Docker file of any Python application

```Dockerfile

FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python py-pip bash

RUN mkdir /var/lib/apisoft
RUN pip install Flack
COPY run.py /var/lib/apisoft

EXPOSE 5000

CMD ["python", "/var/lib/apisoft/run.py"]


```


```python

from flask import Flask

app = Flask(__name__)
@app.route("/")
def hello():
    return "hello word \n"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)

```


### Add automated build for that image Docker hub

[link to docker hub](https://cloud.docker.com/repository/docker/pankrys/api/builds)
![image]docker.png

### Test it


```bash
curl -i localhost:5000


HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 10
Server: Werkzeug/0.16.0 Python/2.7.16
Date: Mon, 07 Oct 2019 07:56:59 GMT

hello word
```


