# 07.Docker.Docker compose

#### Repository for this Homework -> https://github.com/MisterRobo/sa.it-academy.by_08.Docker.Docker-compose

## Homework Assignment 1: Docker Compose for Application Stacks

```bash
mkdir 08.Docker.Docker-compose
ll
cd 08.Docker.Docker-compose
ll
vim docker-compose.yaml
docker ps
docker compose up -d
docker ps
curl -i localhost:8080
```

result:
```bash
docker compose up -d
[+] Running 3/3
 ✔ Network ha1_wp_network       Created                                                                                                           0.2s 
 ✔ Container mysql_service      Started                                                                                                           0.5s 
 ✔ Container wordpress_service  Started                                                                                                           0.9s 

docker ps           
CONTAINER ID   IMAGE              COMMAND                  CREATED         STATUS         PORTS                                     NAMES
4489021086dd   wordpress:latest   "docker-entrypoint.s…"   3 seconds ago   Up 2 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   wordpress_service
ee8b19cade9d   mysql:8.0          "docker-entrypoint.s…"   3 seconds ago   Up 2 seconds   3306/tcp, 33060/tcp                       mysql_service

curl -I localhost:8080
HTTP/1.1 302 Found
Date: Sun, 12 Jan 2025 13:32:27 GMT
Server: Apache/2.4.62 (Debian)
X-Powered-By: PHP/8.2.27
Expires: Wed, 11 Jan 1984 05:00:00 GMT
Cache-Control: no-cache, must-revalidate, max-age=0
X-Redirect-By: WordPress
Location: http://localhost:8080/wp-admin/install.php
Content-Type: text/html; charset=UTF-8
```

## Homework Assignment 2: Docker build automation (github action)



```Bash
vim Dockerfile
vim app.py
vim requirements.txt
ll
docker ps -a
docker images
docker build -t web-app:1.3 .
docker images
docker run -d -p 5000:5000 --name web-app web-app:1.3
curl 127.0.0.1:5000
```

Result:
```Bash
curl localhost:5000 
Hello, Docker!
```

