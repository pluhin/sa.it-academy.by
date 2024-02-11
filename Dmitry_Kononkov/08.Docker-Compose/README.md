# Homework Assignment 1: Docker Compose for Application Stacks
## Steps 1-3:
### docker-compose/docker-compose.yaml
```yaml
version: '3.3'

services:
  db:
    image: mysql:5.7
    env_file:
      - .env
    volumes:
      - db_data:/var/lib/mysql
    restart: always

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    restart: always
    ports:
      - "8000:80"
    env_file:
      - .env
    volumes:
      ["./wordpress_data:/var/www/html"]

volumes:
  db_data: {}
```
### docker-compose/.env
```
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=wordpress
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD=wordpress
WORDPRESS_DB_NAME=wordpress
```
## Step 4:
### docker-compose up -d
```
[+] Running 34/2
 ✔ db 11 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                       87.2s 
 ✔ wordpress 21 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                      76.1s 
[+] Running 2/4
 ⠇ Network docker-compose_default        Created                                                                                                            1.8s 
 ⠦ Volume "docker-compose_db_data"       Created                                                                                                            1.6s 
 ✔ Container docker-compose-db-1         Started                                                                                                            1.1s 
 ✔ Container docker-compose-wordpress-1  Started                                                                                                            1.1s 
```
### docker ps
```
CONTAINER ID   IMAGE              COMMAND                  CREATED         STATUS         PORTS                                   NAMES
6897df085bcc   wordpress:latest   "docker-entrypoint.s…"   8 seconds ago   Up 6 seconds   0.0.0.0:8000->80/tcp, :::8000->80/tcp   docker-compose-wordpress-1
0130caae39e7   mysql:5.7          "docker-entrypoint.s…"   8 seconds ago   Up 7 seconds   3306/tcp, 33060/tcp                     docker-compose-db-1
```
### docker volume ls
```
DRIVER    VOLUME NAME
local     28cfc7263a1fe4915d955649ea7b3febb70123b0acfc73ec24b5ca73faac5542
local     docker-compose_db_data
```
## Step 5:
### curl -I http://localhost:8000
```
HTTP/1.1 200 OK
Date: Sun, 11 Feb 2024 10:48:45 GMT
Server: Apache/2.4.57 (Debian)
X-Powered-By: PHP/8.2.15
Link: <http://192.168.100.110:8000/wp-json/>; rel="https://api.w.org/"
Content-Type: text/html; charset=UTF-8
```
### Check:
![wordpress](https://raw.githubusercontent.com/ussnorma/Git.Hosting.03/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-11%20%D0%B2%2012.37.14.png)

# Homework Assignment 2: Docker build automation (github action)
## Steps 1-6:
### .github/workflows/build_push.yaml
```yaml
name: Build and Push Docker image to DockerHub

on: push
jobs:
    push:
        name: Push Docker image to DockerHub
        runs-on: ubuntu-latest
        steps:
            - name: Checkout repo
              uses: actions/checkout@v3

            - name: Login to DockerHub
              uses: docker/login-action@v2
              with:
                username: ${{ secrets.DOCKERHUB_USERNAME }}
                password: ${{ secrets.DOCKERHUB_ACCESS_TOKEN }}

            - name: Build and Push image
              uses: docker/build-push-action@v4
              with: 
                push: true
                tags:  ussnorma/multi-stage-simple-golang-webapp:latest
```
### main.go
```
package main

import (
	"net/http"
	"os"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("<h1>Hello World!</h1>"))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/", indexHandler)
	http.ListenAndServe(":"+port, mux)
}

```
### go.mod
```
module github.com/kdimakon/simple-web-app-golang

go 1.21.0
```
### Dockerfile
```
FROM golang:1.12.0-alpine3.9 AS BuildStage
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .
EXPOSE 3000

FROM alpine:latest
WORKDIR /
COPY --from=BuildStage /app /app
EXPOSE 3000
CMD ["/app/main"]
```
### DockerHub repo:
![dockerhub](https://raw.githubusercontent.com/ussnorma/Git.Hosting.03/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-11%20%D0%B2%2014.04.48.png)
## Step 7:
### Slack notification:
![slack](https://raw.githubusercontent.com/ussnorma/Git.Hosting.03/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-11%20%D0%B2%2014.10.45.png)