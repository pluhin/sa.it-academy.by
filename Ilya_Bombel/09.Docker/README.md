# 09.Docker homework

## To do:
* Create a Docker file of any Python application. As example: API (port) listener - Flask
* Add automated build for that image to Dockerhub using Github Action
* Run image as container and test it.  Send/receive API request using curl

## URL's to 
* [GitHub Docker test repo](https://github.com/NEM1GA/docker)/[Actions](https://github.com/NEM1GA/docker/actions)
* [DockerHub repo with automated build](https://hub.docker.com/repository/docker/nem1ga/docker_build)

### Dockerfile:
```
FROM python:3-alpine
MAINTAINER ilya.bombel@gmail.com
RUN apk update && apk add python3 
RUN pip3 install --no-cache-dir flask
ADD myapp.py /
CMD [ "python3", "./myapp.py" ]
EXPOSE 5000
```

### GitHub actions workflow file:
```
name: Docker build and push
on:
  push:
    branches:
    - master
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}

      - name: Build and push
        uses: docker/build-push-action@v2
        with:
          push: true
          tags: nem1ga/docker_build:latest
```

### Build docker container
```
docker build -t image:1 .
Sending build context to Docker daemon  4.096kB
Step 1/7 : FROM python:3-alpine
 ---> 8b74835e51c6
Step 2/7 : MAINTAINER ilya.bombel@gmail.com
 ---> Running in fb87f882c3c2
Removing intermediate container fb87f882c3c2
 ---> dc2e6689268e
Step 3/7 : RUN apk update && apk add python3
 ---> Running in 87e153adfba4
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
v3.15.4-159-g555cb2ef19 [https://dl-cdn.alpinelinux.org/alpine/v3.15/main]
v3.15.4-160-g46f168b847 [https://dl-cdn.alpinelinux.org/alpine/v3.15/community]
OK: 15858 distinct packages available
(1/4) Installing libgcc (10.3.1_git20211027-r0)
(2/4) Installing libstdc++ (10.3.1_git20211027-r0)
(3/4) Installing mpdecimal (2.5.1-r1)
(4/4) Installing python3 (3.9.7-r4)
Executing busybox-1.34.1-r5.trigger
OK: 62 MiB in 40 packages
Removing intermediate container 87e153adfba4
 ---> f7dd4a685b9d
Step 4/7 : RUN pip3 install --no-cache-dir flask
 ---> Running in ae156d600bdf
Collecting flask
  Downloading Flask-2.1.2-py3-none-any.whl (95 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 95.2/95.2 KB 1.9 MB/s eta 0:00:00
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting Jinja2>=3.0
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.1/133.1 KB 4.3 MB/s eta 0:00:00
Collecting Werkzeug>=2.0
  Downloading Werkzeug-2.1.2-py3-none-any.whl (224 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 224.9/224.9 KB 5.6 MB/s eta 0:00:00
Collecting click>=8.0
  Downloading click-8.1.3-py3-none-any.whl (96 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 96.6/96.6 KB 20.0 MB/s eta 0:00:00
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.1-cp310-cp310-musllinux_1_1_x86_64.whl (29 kB)
Installing collected packages: Werkzeug, MarkupSafe, itsdangerous, click, Jinja2, flask
Successfully installed Jinja2-3.1.2 MarkupSafe-2.1.1 Werkzeug-2.1.2 click-8.1.3 flask-2.1.2 itsdangerous-2.1.2
Removing intermediate container ae156d600bdf
 ---> 145cb2619748
Step 5/7 : ADD myapp.py /
 ---> 5d01b28dad95
Step 6/7 : CMD [ "python3", "./myapp.py" ]
 ---> Running in a4fa5ae7d786
Removing intermediate container a4fa5ae7d786
 ---> f7acab2eb49d
Step 7/7 : EXPOSE 5000
 ---> Running in 38480e7f7ef0
Removing intermediate container 38480e7f7ef0
 ---> cf7bcb4db12b
Successfully built cf7bcb4db12b
Successfully tagged image:1
```

### Running docker container and testing connection
```
$ docker run -d -p 5000:5000 image:1
b152cf0c5023bcc335f2d31dede89686115861e59c66f4f0c79f2bd7d63fcb4f
$ docker ps
CONTAINER ID   IMAGE     COMMAND                CREATED         STATUS         PORTS                                       NAMES
b152cf0c5023   image:1   "python3 ./myapp.py"   3 seconds ago   Up 3 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   pensive_boyd
$ curl http://localhost:5000/companies
[{"id": 1, "name": "Company One"}, {"id": 2, "name": "Company Two"}]vagrant@vagrant:~/docker$ docker logs b152cf0c5023
 * Serving Flask app 'myapp' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 656-485-352
172.17.0.1 - - [22/May/2022 12:01:48] "GET /companies HTTP/1.1" 200 -
```

[Credits for Flask task](https://blog.stoplight.io/python-rest-api)