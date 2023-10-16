# 07.Docker

##Docker Installation and Basic Commands

###Install Docker on my virtual environment^
I took all the installation commands from the official Docker website 
for the Debian operating system.

**Command history:**
```bash
 1347  mkdir 07.Docker
 1348  cd 07.Docker
 1349  apt update
 1350  apt upgrade
 1351  sudo apt-get update\nsudo apt-get install ca-certificates curl gnupg\nsudo install -m 0755 -d /etc/apt/keyrings\ncurl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg\nsudo chmod a+r /etc/apt/keyrings/docker.gpg\n\n# Add the repository to Apt sources:\necho \\n  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \\n  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \\n  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\nsudo apt-get update
 1352  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 1353  service docker status
 1354  sudo service docker status
```
**`sudo service docker status` command output:**
```bash
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset:
     Active: active (running) since Wed 2023-10-11 21:13:55 +03; 11min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 21699 (dockerd)
      Tasks: 8
     Memory: 45.3M
        CPU: 330ms
     CGroup: /system.slice/docker.service
             └─21699 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/cont

окт 11 21:13:53 gumcol-zabbix systemd[1]: Starting Docker Application Container
окт 11 21:13:54 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:54.00482647
окт 11 21:13:54 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:54.82666610
окт 11 21:13:55 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:55.37461080
окт 11 21:13:55 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:55.63817291
окт 11 21:13:55 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:55.63858936
окт 11 21:13:55 gumcol-zabbix dockerd[21699]: time="2023-10-11T21:13:55.82086791
окт 11 21:13:55 gumcol-zabbix systemd[1]: Started Docker Application Container E
```

---

### Verified the Docker installation by running the `docker --version` command:
```bash
   1355 docker --version
Docker version 24.0.6, build ed223bc
```

---

### Pulled the official "hello-world" Docker image and run a container based on it.

**Command history**
```bash 
 1358  docker pull hello-world
 1359  docker run hello-world
```

**Output of this commands**
```bash
➜  07.Docker docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:88ec0acaa3ec199d3b7eaf73588f4518c25f9d34f58ce9a0df68429c5af48e8d
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest
```

```bash
➜  07.Docker docker run hello-world

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

---

### List the running containers using the `docker ps` command
**Output of command:**
```bash
➜  07.Docker docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES```bash
```
```bash
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    9c7a54a9a43c   5 months ago   13.3kB

```




## Building a Docker Image with Dockerfile

### Wrote files for Node.js:
I decided make a web sait (have one simple html file):

**Setiings for site in `site-config.js`:**
```JavaScript
const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, 'site', req.url);
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/html' });
      res.end('404 Not Found');
    } else {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(data);
    }
  });
});

const port = process.env.PORT || 65535;

server.listen(port, () => {
  console.log('Server was enabled in port ${port}');
});
```

**Installing dependencies via `package.json`:**
```JavaScript
{
  "name": "gumcol_site",
  "version": "1.0.0",
  "description": "Using part gumcol site",
  "scripts": {
    "start": "node site-config.js"
  },
  "dependencies": {
    "http-server": "^0.12.3"
  }
}
```

**_HTML file is to big, so I will add it below in the report_**

---

### Make a `DockerFile`

```bash
FROM alpine

WORKDIR /gumcol_site

COPY site-config.js .
COPY site/page32002363.html .
COPY package.json .

RUN apk update \
    && apk add --no-cache nodejs npm \
    && rm -rf /var/cache/apk/* \
    && npm install

CMD ["npm", "start"]

EXPOSE 80
```

---

### Build docker image 

` 1433  docker build -t nodejs:packagejson .`

```bash
[+] Building 17.6s (11/11) FINISHED                                                                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                    0.1s
 => => transferring dockerfile: 292B                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                        1.0s
 => [1/6] FROM docker.io/library/alpine@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                         0.0s
 => [internal] load build context                                                                                                                                                       0.0s
 => => transferring context: 723B                                                                                                                                                       0.0s
 => CACHED [2/6] WORKDIR /gumcol_site                                                                                                                                                   0.0s
 => [3/6] COPY site-config.js .                                                                                                                                                         0.1s
 => [4/6] COPY site/page32002363.html .                                                                                                                                                 0.2s
 => [5/6] COPY package.json .                                                                                                                                                           0.2s
 => [6/6] RUN apk update     && apk add --no-cache nodejs npm     && rm -rf /var/cache/apk/*     && npm install                                                                        14.9s
 => exporting to image                                                                                                                                                                  1.1s
 => => exporting layers                                                                                                                                                                 1.1s
 => => writing image sha256:5ebf21a04f9eaaecceeb7af4a91f5b48d018573331eda34e4b078aed95c0de80                                                                                            0.0s
 => => naming to docker.io/library/nodejs:packagejson
```

```bash
docker images -a
REPOSITORY    TAG             IMAGE ID       CREATED          SIZE
nodejs        packagejson     5ebf21a04f9e   26 minutes ago   72.8MB
nodejs        sait_optimize   8271fa43765a   2 hours ago      59MB
nodejs        sait            177b74ebc905   2 hours ago      59MB
hello-world   latest          9c7a54a9a43c   5 months ago     13.3kB
```

Here I first created the image without adding dependencies, then I tried to make it smaller, 
but I realized that it weighs so much because of the file and the node module. 
Then adding dependency and npm, the image began to weigh even more

---

### Run a container based on the image

```bash
docker run nodejs:packagejson

> gumcol_site@1.0.0 start
> node site-config.js

Server was enabled in port ${port}
```

**Check Access:**
![Run nodejs](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/c5eae248-92d0-48eb-86a9-91d66abfe329) 


