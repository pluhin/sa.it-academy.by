# Homework report for 09.Docker by Siarhei Kaliuha

---

## Repository URLs:
* [GitHub](https://github.com/s-kalyuga/09.Docker)
* [DockerHub](https://hub.docker.com/r/skalyuga/docker_build)


## Brief description
Github Action triggered by push to *main* branch.  
Created Docker image with Python application uploaded to DockerHub registry.  
Python application is simple Flask based script, that should listen port 80 and return *message* when curl it.


## Local build and run (final check before push to GitHub):
```
vagrant@vagrant-ubuntu-20:~/09.Docker$ docker build -t local:3 -f Dockerfile .
Sending build context to Docker daemon  74.24kB
Step 1/5 : FROM python:3-alpine
 ---> 27edb73bd1fc
Step 2/5 : RUN apk update     && apk upgrade     && apk add --no-cache python3     && pip3 install --no-cache flask
 ---> Using cache
 ---> 8565c2ede39c
Step 3/5 : COPY flaskapi.py /flaskapi.py
 ---> 888a649ee5dd
Step 4/5 : EXPOSE 80
 ---> Running in 4046014ef9c3
Removing intermediate container 4046014ef9c3
 ---> 3ed42b4fd19f
Step 5/5 : CMD ["python3",  "./flaskapi.py"]
 ---> Running in 314706ccdc85
Removing intermediate container 314706ccdc85
 ---> 494b75b38171
Successfully built 494b75b38171
Successfully tagged local:3

vagrant@vagrant-ubuntu-20:~/09.Docker$ docker run -d -p 80:80 --name flaskapilocal3 local:3
c5bec2d65afe754786905e5c2b1a6b215c5a03f04842d64f7761ceef14e9ddc1

vagrant@vagrant-ubuntu-20:~/09.Docker$ curl http://localhost/
Test API operational!
Using Docker!
```

## Automated build and upload image to DockerHub using GitHub Action:

![alt text](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/09.Docker/action.jpg)


## Download automatically created image from DockerHub to local VM and run:
```
vagrant@vagrant-ubuntu-20:~/09.Docker$ docker pull skalyuga/docker_build
Using default tag: latest
latest: Pulling from skalyuga/docker_build
2408cc74d12b: Already exists
2f22aa6a21a6: Already exists
54cc066f118a: Already exists
03624af3d529: Already exists
4ae78d2f3e6f: Already exists
1e721ed731b8: Pull complete
8cfe601d0165: Pull complete
Digest: sha256:6627c9c3499ee3fe852785405c1ec0bf9ebf294b783123bfbbce4bb09c44bbd3
Status: Downloaded newer image for skalyuga/docker_build:latest
docker.io/skalyuga/docker_build:latest

vagrant@vagrant-ubuntu-20:~/09.Docker$ docker run -d -p 80:80 --name flaskapilocal skalyuga/docker_build
1a2f65860b0ab2c2f5abe70ca5ce7c4bdfce57af0062628bfbd8f69a7ec7f4b4

vagrant@vagrant-ubuntu-20:~/09.Docker$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                               NAMES
1a2f65860b0a   skalyuga/docker_build   "python3 ./flaskapi.…"   42 seconds ago   Up 41 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   flaskapilocal

```

## Test result:
```
vagrant@vagrant-ubuntu-20:~/09.Docker$ curl http://localhost/
Test API operational!
Using Docker!

vagrant@vagrant-ubuntu-20:~/09.Docker$ docker logs 1a2f65860b0a
 * Serving Flask app 'flaskapi' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:80
 * Running on http://172.17.0.2:80 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 331-567-513
172.17.0.1 - - [04/Jul/2022 17:15:49] "GET / HTTP/1.1" 200 -

```