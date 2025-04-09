### 07. Docker

#### Homework Assignment 1: Docker Installation and Basic Commands

I do the following steps locally on my virtual machine.

**1.Installing Docker**
Updating packages and installing dependencies
```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg
```
Added the official Docker GPG key
```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
Added a Docker repository
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Installed Docker itself
```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Checked the Docker version
```bash
docker --version

Docker version 28.0.4, build b8034c0
```
**2.Running the test container**
Downloaded the hello-world image
```bash
sudo docker pull hello-world
```
Started the container
```bash
sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.
```
Checked the list of running containers
```bash
sudo docker ps -a

CONTAINER ID   IMAGE         COMMAND    CREATED              STATUS                          PORTS     NAMES
5bce6a782d2c   hello-world   "/hello"   About a minute ago   Exited (0) About a minute ago             elastic_swanson
ae5249286aa3   hello-world   "/hello"   3 minutes ago        Exited (0) 3 minutes ago                  priceless_bell
f73a5f08e70f   hello-world   "/hello"   3 minutes ago        Exited (0) 3 minutes ago                  musing_galileo

```
#### Homework Assignment 2: Building a Docker Image with Dockerfile
I created a folder
```bash
mkdir -p ~/07.Docker/flask-app && cd ~/07.Docker/flask-app
```
Created a file app.py
```php
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Dockerized Flask App!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```
Created a Dockerfile
```bash
FROM python:3.9-slim

RUN pip install flask

COPY app.py /app/app.py

WORKDIR /app

EXPOSE 5000

CMD ["python", "app.py"]
```

Assembled the image through the command:
```bash
sudo docker build -t flask-app .
```
And ran the container through the command:
```bash
sudo docker run -d -p 5000:5000 --name my-flask-app flask-app
```
Result:
```bash
curl http://localhost:5000

Hello from Dockerized Flask App!
```
