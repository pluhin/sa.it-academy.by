# Docker.Logistics
#### Create docker compose file which contains the following applications:
##### Work directory (all this files are in docker-compose folder):
```bash
~/work/git/docker/docker-compose-test > tree
.
├── app
│   └── index.html
└── docker-compose.yml

1 directory, 2 files
```
##### Docker-compose file:
```yml
version: '3'

services:
  sonar:
    image: linuxserver/sonarr
    container_name: sonarr
    environment:
      - TZ=Europe/Minsk
    ports:
      - "8989:8989"

  radar:
    image: linuxserver/radarr
    container_name: radarr
    environment:
      - TZ=Europe/Minsk
    ports:
      - "7878:7878"

  web:
    image: httpd
    container_name: app
    depends_on:
      - sonar
      - radar
    links:
      - sonar
      - radar
    ports:
      - "8500:80"
    volumes:
     - ./app:/usr/local/apache2/htdocs/
```
##### "APP":
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello from docker</title>
</head>
<body>
<h1>docker-compose</h1>
<a href="http://127.0.0.1:8989">Sonarr</a>
<a href="http://127.0.0.1:7878">Radarr</a>
</body>
</html>
```
##### Docker OUTPUT:
```bash
~/work/git/docker/docker-compose-test > docker-compose up -d
Starting radarr ... done
Starting sonarr ... done
Recreating app  ... done
~/work/git/docker/docker-compose-test > docker ps
CONTAINER ID        IMAGE                COMMAND              CREATED             STATUS              PORTS                    NAMES
0fa7a76a2931        httpd                "httpd-foreground"   37 seconds ago      Up 35 seconds       0.0.0.0:8500->80/tcp     app
10e57a516be2        linuxserver/radarr   "/init"              11 minutes ago      Up 36 seconds       0.0.0.0:7878->7878/tcp   radarr
72f0388f3493        linuxserver/sonarr   "/init"              11 minutes ago      Up 36 seconds       0.0.0.0:8989->8989/tcp   sonarr
~/work/git/docker/docker-compose-test > 
```
