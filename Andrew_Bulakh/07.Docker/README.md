# 07.Docker

## Homework Assignment 1: Docker Installation and Basic Commands
```bash
   sudo apt update && sudo apt upgrade
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

   sudo apt update
   sudo apt install docker-ce

   sudo systemctl start docker
   sudo systemctl enable docker

   docker --version
        Docker version 27.4.1, build b9d17ea

   docker pull hello-world
   docker run hello-world

   docker ps
       CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## Homework Assignment 2: Building a Docker Image with Dockerfile
Dockerfile
```bash
     FROM python:3.8-slim
     WORKDIR /app
     COPY requirements.txt requirements.txt
     RUN pip install -r requirements.txt
     COPY . .
     CMD ["python", "app.py"]
```

File app.py
```bash
          from flask import Flask
     app = Flask(__name__)

     @app.route('/')
     def home():
         return "Hello, Docker!"

     if __name__ == "__main__":
         app.run(host='0.0.0.0', port=5000)
```   

File requirements.txt
```bash
    Flask
```    

Create a Docker image
```bash
andrew@andrew-VirtualBox:~/07.docker/myapp$ sudo docker build -t myflaskapp .     
[+] Building 1.2s (10/10) FINISHED                                  docker:default
 => [internal] load build definition from dockerfile                          0.0s
 => => transferring dockerfile: 219B                                          0.0s
 => [internal] load metadata for docker.io/library/python:3.8-slim            0.6s
 => [internal] load .dockerignore                                             0.0s
 => => transferring context: 2B                                               0.0s
 => [1/5] FROM docker.io/library/python:3.8-slim@sha256:1d52838af602b4b5a831  0.0s
 => [internal] load build context                                             0.0s
 => => transferring context: 272B                                             0.0s
 => CACHED [2/5] WORKDIR /app                                                 0.0s
 => CACHED [3/5] COPY requirements.txt requirements.txt                       0.0s
 => CACHED [4/5] RUN pip install -r requirements.txt                          0.0s
 => [5/5] COPY . .                                                            0.3s
 => exporting to image                                                        0.1s
 => => exporting layers                                                       0.0s
 => => writing image sha256:e0bbb5e115ce50cfefccf6bbc8874f91aa6bba1373481357  0.0s
 => => naming to docker.io/library/myflaskapp                                 0.0s
                                0.0
```

Launching the container
```bash 
andrew@andrew-VirtualBox:~/07.docker/myapp$ sudo docker run -p 5000:5000 myflaskapp
 * Serving Flask app 'app'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
```

When I visit/refresh the page in the browser at http://localhost:5000, I see the message "Hello, Docker!" on the page. And in the terminal it appears:
```bash
172.17.0.1 - - [07/Jan/2025 14:13:04] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [07/Jan/2025 14:13:13] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [07/Jan/2025 14:13:21] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [07/Jan/2025 14:13:30] "GET / HTTP/1.1" 200 -
```
   
   


   

   
   
   
   
   
