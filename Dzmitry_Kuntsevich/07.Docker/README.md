#Homework Assignment 1:

##Installation Docker
```
 1098  mkdir 07.Docker
 1099  ls
 1100  cd 07.Docker/
 1101  sudo apt-get update
 1102  sudo apt-get install ca-certificates curl
 1103  sudo install -m 0755 -d /etc/apt/keyrings
 1104  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 1105  sudo chmod a+r /etc/apt/keyrings/docker.asc
 1106  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
 1107    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 1108  sudo apt-get update
 1109  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 1110  sudo usermod -aG docker $USER
```

##Pull the official "hello-world" Docker image and run a container based on it.
```
admin@Ubuntu:~/07.Docker$ docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
e6590344b1a5: Pull complete
Digest: sha256:ec153840d1e635ac434fab5e377081f17e0e15afab27beb3f726c3265039cfff
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest



admin@Ubuntu:~/07.Docker$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

##All containers (including stopped ones)

```
admin@Ubuntu:~/07.Docker$ docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
9ffc9a59fa7f   hello-world   "/hello"   6 minutes ago   Exited (0) 6 minutes ago             sweet_roentgen
```


#Homework Assignment 2:

##Creating a Project Structure

```
mkdir flask-docker 
cd flask-docker
mkdir app
```
 
##Creating a simple Flask application(app/app.py)

```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Flask!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

##requirements.txt:

```
flask==2.3.2
```

##Creation Dockerfile

```
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app/
EXPOSE 5000
CMD ["python", "./app/app.py"]
```

##Building an image and running a container

```
docker build -t web:1 -f Dockerfile .
docker run -d -p 5000:5000 --name my-flask web:1
```

##Functionality check
```
admin@Ubuntu:~/07.Docker/flask-docker$ curl http://localhost:5000
Hello from Flask!admin@Ubuntu:~/07.Docker/flask-docker$
```







