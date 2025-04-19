### 07.Docker instalation

### Homework Assignment 1: Docker Installation and Basic Commands
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings  
do curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \                                                                          
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update 
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  docker --version                                                                
Docker version 28.0.4, build b8034c0
sudo docker run hello-world 
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pull complete
Digest: sha256:fc08e727181e2668370f47db6319815c279ed887e2f01be96b94106bc2781430
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

sudo usermod -aG docker $USER
```

 logout

```bash
 docker ps                                                                       
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

docker version                                                                  
Client: Docker Engine - Community
 Version:           28.0.4
 API version:       1.48
 Go version:        go1.23.7
 Git commit:        b8034c0
 Built:             Tue Mar 25 15:07:16 2025
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          28.0.4
  API version:      1.48 (minimum version 1.24)
  Go version:       go1.23.7
  Git commit:       6430e49
  Built:            Tue Mar 25 15:07:16 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.27
  GitCommit:        05044ec0a9a75232cad458027ca83437aae3f4da
 runc:
  Version:          1.2.5
  GitCommit:        v1.2.5-0-g59923ef
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

### Homework Assignment 2: Building a Docker Image with Dockerfile

``` bash
  mkdir flask-docker-app
  cd flask-docker-app
  vim app.py
  vim Dockerfile
  docker build -t flask-app .

  [+] Building 22.5s (9/9) FINISHED                docker:default
 => [internal] load build definition from Dockerfile       0.0s
 => => transferring dockerfile: 152B                       0.0s
 => [internal] load metadata for docker.io/library/python  1.9s
 => [internal] load .dockerignore                          0.0s
 => => transferring context: 2B                            0.0s
 => [1/4] FROM docker.io/library/python:3.9-slim@sha256:9  9.9s
 => => resolve docker.io/library/python:3.9-slim@sha256:9  0.0s
 => => sha256:a0b0cfc480ce03c723a597904 14.93MB / 14.93MB  4.0s
 => => sha256:9aa5793609640ecea2f06451a 10.41kB / 10.41kB  0.0s
 => => sha256:d6e2ddca278e1b84c1a934ca8f0 1.75kB / 1.75kB  0.0s
 => => sha256:501f96d59d707efd12df137b6d0 5.29kB / 5.29kB  0.0s
 => => sha256:8a628cdd7ccc83e90e5a95888 28.23MB / 28.23MB  4.4s
 => => sha256:74018f7cfa8f2965fd86b13c38f 3.51MB / 3.51MB  0.6s
 => => sha256:97d21b95fb00ac3b08975ab6f8709f3 250B / 250B  0.9s
 => => extracting sha256:8a628cdd7ccc83e90e5a95888fcb0ec2  3.3s
 => => extracting sha256:74018f7cfa8f2965fd86b13c38f71417  0.4s
 => => extracting sha256:a0b0cfc480ce03c723a597904bcfbf28  1.4s
 => => extracting sha256:97d21b95fb00ac3b08975ab6f8709f3a  0.0s
 => [internal] load build context                          0.0s
 => => transferring context: 223B                          0.0s
 => [2/4] WORKDIR /app                                     0.3s
 => [3/4] COPY app.py /app                                 0.0s
 => [4/4] RUN pip install Flask                            9.7s
 => exporting to image                                     0.5s
 => => exporting layers                                    0.5s
 => => writing image sha256:35d4c6c0da42e004d0e10a11cae94  0.0s

 docker run -d -p 5000:5000 --name first-flask-app flask-app
ed866d4ece26a188df3219bbc7d5c9bd73ec840404d8e526e9b9b09e2fbabca8

curl http://localhost:5000
Hello, Dockerized Flask World!%
```
