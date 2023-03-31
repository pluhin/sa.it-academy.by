### Homework 07. Docker by Karabanovich_Pavel

#### Create port.py

```bash

from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return 'Connect to port 7777 successful.   Have a nice day ! \n'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7777)
```

#### Create dockerfile

```bash

FROM python:3.9-slim-buster
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
COPY port.py /
EXPOSE 7777
CMD ["python", "/port.py"]```bash
```

#### Create file requirements.txt

```bash

Flask==2.2.3
```

#### Command

```bash

streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ nano port.py

streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ nano dockerfile

streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ nano requirements.txt

streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ docker build -t port-python-app:7777 -f dockerfile .

[+] Building 1.0s (9/9) FINISHED
 => [internal] load .dockerignore                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                         0.0s
 => [internal] load build definition from dockerfile                                                                                                    0.0s
 => => transferring dockerfile: 570B                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.9-slim-buster                                                                               0.9s
 => [1/4] FROM docker.io/library/python:3.9-slim-buster@sha256:0ac1e4889c90d3117680b33cbdd397e3d95098b4c6bcff8600035fa5343527ed                         0.0s
 => [internal] load build context                                                                                                                       0.0s
 => => transferring context: 285B                                                                                                                       0.0s
 => CACHED [2/4] COPY requirements.txt /                                                                                                                0.0s
 => CACHED [3/4] RUN pip install --no-cache-dir -r /requirements.txt                                                                                    0.0s
 => [4/4] COPY port.py /                                                                                                                                0.0s
 => exporting to image                                                                                                                                  0.0s
 => => exporting layers                                                                                                                                 0.0s
 => => writing image sha256:ca6ba3b5c7217e1e66979f15a8d92fee15af6371d3ef33aced952224637f4151                                                            0.0s
 => => naming to docker.io/library/port-python-app:7777                                                                                                 0.0s
streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ docker run -d -p 7777:7777 port-python-app:7777
6c1f2bb4af5c47128ba7645c949fb13e29b28314b98337aba544df3d6e4c3517
streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ curl http://localhost:7777/
####Connect to port 7777 successful.   Have a nice day !
```

#### Repository

```bash

streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ docker images
REPOSITORY                              TAG              IMAGE ID       CREATED             SIZE
port-python-app                         7777             ca6ba3b5c721   9 minutes ago       127MB
jfrog.it-academy.by/public/jenkins-ci   P.Karabanovich   739b57bdd92f   22 hours ago        777MB
first_image                             base             585fe29a6729   2 weeks ago         24.3MB
first_image                             v1.0             585fe29a6729   2 weeks ago         24.3MB
nginx                                   latest           904b8cb13b93   4 weeks ago         142MB
```

#### Docker container

```bash
streamx1@ubuntu-222:~/sa.it-academy.by/Pavel_Karabanovich/07.Docker$ docker ps
CONTAINER ID   IMAGE                  COMMAND             CREATED             STATUS             PORTS                                       NAMES
6c1f2bb4af5c   port-python-app:7777   "python /port.py"   10 minutes ago      Up 10 minutes      0.0.0.0:7777->7777/tcp, :::7777->7777/tcp   friendly_chatelet
```
