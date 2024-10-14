# Homework Assignment 1: Docker Installation and Basic Commands

1. Install Docker on your local machine or a virtual environment.  
 Install by manual https://docs.docker.com/engine/install/ubuntu/  

2. Verify the Docker installation by running the docker --version command.  
```bash
fadeev@kirill:~$ docker --version
Docker version 27.3.1, build ce12230
```  
3. Pull the official "hello-world" Docker image and run a container based on it.
```bash
fadeev@kirill:~$ docker run hello-world

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
4. List the running containers using the docker ps command.
```bash
fadeev@kirill:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
e9606085e7a7   ubuntu    "bash"    37 seconds ago   Up 37 seconds             condescending_jackson
```
5. Document the installation process and the commands used for verification.


# Hwork Assignment 2: Building a Docker Image with Dockerfile

1. Create a new directory for your Dockerfile and application code.
```bash
fadeev@kirill:~$ mkdir Docker
fadeev@kirill:~$ cd Docker/
fadeev@kirill:~/Docker$
```
2. Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).
  *  package.json
```bash
{
  "name": "kirill_app",
  "version": "1.0.0",
  "description": "nodejs_app",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Fadeev_Kirill",
  "license": "ISC",
  "dependencies": {
    "express": "^4.21.1"
  }
}
```
  * app.js
```bash
const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
res.sendFile(path.join(__dirname, 'html', 'index.html'));
});

app.get('/about', (req, res) => {
res.sendFile(path.join(__dirname, 'html', 'about.html'));
});

app.get('/contact', (req, res) => {
res.sendFile(path.join(__dirname, 'html', 'contact.html'));
});

app.listen(port, () => {
console.log(`App listening at http://localhost:${port}`);
});
```
  * HTML pages
```bash
fadeev@kirill:~/Docker/app$ cat html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
</head>
<body>
<h1>Welcome to the Home Page</h1>
<button onclick="document.location='about'">About</button>
<button onclick="document.location='contact'">Contact</button>
</body>
</html>


fadeev@kirill:~/Docker/app$ cat html/about.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About</title>
</head>
<body>
<h1>About Us</h1>
<p>This page made by Kirill Fadeev.</p>
<button onclick="document.location='/'">Main page</button>
</body>
</html>


fadeev@kirill:~/Docker/app$ cat html/contact.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact</title>
</head>
<body>
<h1>Contact Us</h1>
<p>Tel no.: +2-222-22-22</p>
<p>E-mail: aa@mail.ru</p>
<button onclick="document.location='/'">Main page</button>
</body>
</html>
```
3. Copy your application code into the image and set the necessary environment.
  * Dockerfile
```bash
FROM node:14-alpine

LABEL maintainer="KirFad@mail.com"

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
```
4. Build the Docker image using the docker build command.  
```bash
docker build -t app_js:1 .
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/07.Docker/img/1.jpg)  
5. Run a container based on the image and access the web application.  
```bash
docker run --name web_app -p 80:3000 -d app_js:1
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/07.Docker/img/2.jpg)  
6. Document the steps taken to create the Dockerfile, build the image, and access the app.  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/07.Docker/img/3.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/07.Docker/img/4.jpg)  