# Homework 07.Docker

>Note: I had newest Ubuntu 22.04 in my VM. Installation of Docker was little differ from old Ubuntu or  Debian distrs.  

## Homework Assignment 1: Docker Installation and Basic Commands

```bash
  696  mkdir 07.Docker
  697  cd 07.Docker
  698  sudo apt-get update\nsudo apt-get install ca-certificates curl gnupg\nsudo install -m 0755 -d /etc/apt/keyrings\ncurl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg\nsudo chmod a+r /etc/apt/keyrings/docker.gpg\n\n# Add the repository to Apt sources:\necho \\n  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \\n  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \\n  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\nsudo apt-get update
  699  sudo apt-get update sudo apt-get install ca-certificates curl gnupg sudo install -m 0755 -d /etc/apt/keyrings curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg sudo chmod a+r /etc/apt/keyrings/docker.gpg
  700  date
  701  sudo apt install curl software-properties-common ca-certificates apt-transport-https -y
  702  curl -f -s -S -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  703  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
  704  sudo apt update
  705  apt-cache policy docker-ce
  706  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  707  service docker status
  708  sudo service docker status
  709  docker --version
  710  sudo docker run hello-world
  711  docker ps
  712  docker pull hello-world
  713  docker run hello-world
  714  docker ps
  715  sudo apt install docker-ce
  716  systemctl status docker
  717  docker run hello-world
  718  docker ps
  719  docker ps -a
  720  docker images
  721  history >> README.md
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

```bash

723 mkdir pyapp
724 cd pyapp
725 vim Dockerfile
726 vim requirments.txt
727 app.py
728 docker build -t my-app -f Dockerfile .
729 docker run -p 5000:5000 my-app
730 vim requirments.txt
731 history >> ../README.md
```
Dockerfile
```DOCKER
FROM python:3.9
WORKDIR /pyapp
COPY requirments.txt requirments.txt
RUN pip install -r requirments.txt
COPY . .
ENV  FLASK_APP=app.py
ENV FLASK_ENV=development
EXPOSE 5000
CMD ["flask","run","-host=0.0.0.0"]
```
requirments.txt
>Note: I had some troubles when I built Docker image. And I added to requirments one more package.
```
Flask==2.1.3
Werkzeug==2.2.2
```
app.py
```Python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```
