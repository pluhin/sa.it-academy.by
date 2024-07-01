## 07.Docker

---

### Docker Installation and Basic Commands

---

1. Install Docker on your local machine or a virtual environment:

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
``` 

- Install the latest version:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

2. Verify the Docker installation by running the docker --version command:

```bash
docker --version
```

- Output:

```
vshvedov@vshvedov:~$ docker --version
Docker version 26.1.4, build 5650f9b
```

3. Pull the official "hello-world" Docker image and run a container based on it:

```bash
sudo docker run hello-world
```

- Output:

```
vshvedov@vshvedov:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete
Digest: sha256:266b191e926f65542fa8daaec01a192c4d292bff79426f47300a046e1bc576fd
Status: Downloaded newer image for hello-world:latest

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

4. List the running containers using the docker ps command: 

```bash
sudo docker ps -a
```

- Output:

```
vshvedov@vshvedov:~$ sudo docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
3dafb3a7d8f0   hello-world   "/hello"   57 seconds ago   Exited (0) 56 seconds ago             busy_ishizaka

```

5. Document the installation process and the commands used for verification:

---

### Building a Docker Image with Dockerfile

---

1. Create a new directory for your Dockerfile and application code:

```bash
mkdir 07.Docker
cd 07.Docker
```

2. Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js):

```bash
nano application.py
```

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World"
```

```bash
nano dockerfile
```

```yml
FROM python:latest
RUN pip3 install Flask
RUN mkdir /app
COPY application.py /app
EXPOSE 5000
CMD ["flask","--app","/app/application.py","run","--host=0.0.0.0"]
```

3. Copy your application code into the image and set the necessary environment.


4. Build the Docker image using the docker build command:

```bash
sudo docker build . -t simple_flask-app
```

5. Run a container based on the image and access the web application:

```bash
sudo docker run -d -p 5000:5000 --name vshvedov-flask1 simple_flask-app
```

```bash
sudo docker ps
```
- Output:

```
CONTAINER ID   IMAGE              COMMAND                  CREATED          STATUS         PORTS                                       NAMES
1478f635e1e6   simple_flask-app   "flask --app /app/ap…"   10 seconds ago   Up 8 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   vshvedov-flask1
```

6. Document the steps taken to create the Dockerfile, build the image, and access the app:

```bash
curl  http://localhost:5000/
```

- Output:

```
vshvedov@vshvedov:~/07.Docker$ curl  http://localhost:5000/
Hello, World
```