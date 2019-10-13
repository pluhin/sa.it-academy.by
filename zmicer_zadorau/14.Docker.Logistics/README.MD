# 14. Docker. Logistics
========

## Automate task 13.Docker.Lading by Jenkins

* [github path]:(https://github.com/pankrys/13.docker)

* [dockerhub path]:(https://cloud.docker.com/repository/docker/pankrys/13.docker/general)

#### jenkins pipline output:

```bash

Started by GitHub push by pankrys
Obtained Jenkinsfile from git git@github.com:pankrys/13.docker.git
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/71.docker2.build
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:pankrys/13.docker.git # timeout=10
Fetching upstream changes from git@github.com:pankrys/13.docker.git
 > git --version # timeout=10
 > git fetch --tags --progress -- git@github.com:pankrys/13.docker.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 3db376a248f1741255f25760da6abc75bf1a1f0b (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3db376a248f1741255f25760da6abc75bf1a1f0b
Commit message: "del_yum"
 > git rev-list --no-walk dae2f67d9b4e1208e6b3ec3057e6a1a01a84922c # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Building image)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ docker build -t pankrys/13.docker:8 .
Sending build context to Docker daemon  108.5kB

Step 1/7 : FROM alpine:latest
 ---> 961769676411
Step 2/7 : RUN apk update     && apk upgrade     && apk add --no-cache python py-pip bash
 ---> Using cache
 ---> f835f204b748
Step 3/7 : RUN mkdir /var/lib/apisoft
 ---> Using cache
 ---> 2c1eafaf1892
Step 4/7 : RUN pip install Flack
 ---> Using cache
 ---> 4e7e249ee293
Step 5/7 : COPY run.py /var/lib/apisoft
 ---> Using cache
 ---> 8eae630c1636
Step 6/7 : EXPOSE 5000
 ---> Using cache
 ---> 34ee35b6d739
Step 7/7 : CMD ["python", "/var/lib/apisoft/run.py"]
 ---> Using cache
 ---> 79c061e26bdd
Successfully built 79c061e26bdd
Successfully tagged pankrys/13.docker:8
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy Image)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u pankrys -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/71.docker2.build@tmp/03eab765-922e-4993-8a23-08f52c7aaaf7/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[Pipeline] {
[Pipeline] sh
+ docker tag pankrys/13.docker:8 pankrys/13.docker:8
[Pipeline] sh
+ docker push pankrys/13.docker:8
The push refers to repository [docker.io/pankrys/13.docker]
1daff940bcc0: Preparing
b679b502c266: Preparing
841f1f9d2364: Preparing
d7d8f1f07825: Preparing
03901b4a2ea8: Preparing
1daff940bcc0: Layer already exists
841f1f9d2364: Layer already exists
03901b4a2ea8: Layer already exists
b679b502c266: Layer already exists
d7d8f1f07825: Layer already exists
8: digest: sha256:543fec9cc3955302aaffd67dcf898b0b15cecf984842eee5d7eaf16c23c3f8e4 size: 1365
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Remove Unused docker image)
[Pipeline] sh
+ docker rmi pankrys/13.docker:8
Untagged: pankrys/13.docker:8
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```
#### webhook

Reqest:
```bash
Request URL: http://commontools.ru:8888/github-webhook/
Request method: POST
content-type: application/json
Expect: 
User-Agent: GitHub-Hookshot/749b00a
X-GitHub-Delivery: 4ab9b1c8-e90c-11e9-8743-7deee8e20ebd
X-GitHub-Event: push
```

Response:
```bash
Content-Length: 2
Date: Mon, 07 Oct 2019 14:11:01 GMT
Server: Jetty(9.4.z-SNAPSHOT)
X-Content-Type-Options: nosniff
```

## Create docker compose file which contains the following applications:

https://raw.githubusercontent.com/pankrys/sa.it-academy.by/m-sa2-09-19/zmicer_zadorau/13.Docker.Lading/docker.png

docker-compose.yml

```yml
---
version: '3'

services:
  nginx:
    image: nginx:latest
    container_name: nginx
    ports:
      - "8082:80"
    volumes:
    - ./html:/usr/share/nginx/html

  sonarr:
    image: linuxserver/sonarr
    container_name: sonarr
    depends_on: 
      - nginx
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Minsk
    ports:
      - 8989:8989

  radarr:
    image: linuxserver/radarr
    container_name: radarr
    depends_on: 
      - nginx
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Minsk
    ports:
      - 7878:7878
```
links http://commontools.ru:8082

![links]:(https://raw.githubusercontent.com/pankrys/sa.it-academy.by/m-sa2-09-19/zmicer_zadorau/14.Docker.Logistics/r&s.png)
