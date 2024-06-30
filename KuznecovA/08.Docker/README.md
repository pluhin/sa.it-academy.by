# Home task 08. Docker. Docker compose

docker-compose.yaml
```bash
version: '3.3'

volumes:
  mongodb_volume:

services:
  service_01_web:
    restart: always
    build:
      context: service_01_web/
      dockerfile: Dockerfile
    container_name: service01web
    ports:
      - "8080:8080"
    environment:
      MONGO_DB_ADDR: mongodb
  service_02_mongodb:
    image: mongo:latest
    restart: always
    build:
      context: service_02_mongodb/
    volumes:
      - mongodb_volume:/data/db
    container_name: service02mongodb
  service_03_curl:
    build:
      context: service_03_curl/
      dockerfile: Dockerfile
    container_name: service03curl
```

service_01_web/requirements.txt
```bash
flask==2.2.2
```

service_01_web/Dockerfile
```bash
FROM python:3.7.9-slim-stretch

RUN mkdir -p /usr/src/app/

# Установите рабочую директорию в /usr/src/app/
WORKDIR /usr/src/app/

COPY . /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

# Сделайте порт 8081 доступным снаружи контейнера
EXPOSE 8080

# Переменная окружения для установки нудного часового пояса
ENV TZ=Europe/Minsk

# CMD ["python", "app.py"]
ENTRYPOINT ["python", "app.py"]
```
service_02_mongodb/Dockerfile - не создавался, всё что нужно в docker-compose.yaml
```bash
```
service_03_curl/Dockerfile
```bash
FROM python:3.7.9-slim-stretch

RUN mkdir -p /app/

# Установите рабочую директорию в /usr/src/app/
WORKDIR /app/

COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh

ENTRYPOINT ["/app/script.sh"]
```

# Result
```bash
docker ps -a

CONTAINER ID   IMAGE       COMMAND           CREATED              STATUS              PORTS                                       NAMES
66175cf56c81   web-hello   "python app.py"   About a minute ago   Up About a minute   0.0.0.0:8081->8081/tcp, :::8081->8081/tcp   web
```

Вызов:
```bash
curl -s http://172.17.0.2:8080
Hello, World!!!. - 25.06.2024 22:13:11
```

Контейнер возвращает:
```
172.17.0.1 - - [25/Jun/2024 22:13:11] "GET / HTTP/1.1" 200 -
```

Далее это вызов вставлен в контейнер service03curl.

```bash
docker compose up -d
...

docker images
REPOSITORY                   TAG       IMAGE ID       CREATED          SIZE
dockerproj-service_03_curl   latest    1b2714f20996   20 minutes ago   97.6MB
dockerproj-service_01_web    latest    79ce060859a4   34 minutes ago   107MB
mongo                        latest    95b3ba6bed35   4 weeks ago      797MB

docker ps -a

CONTAINER ID   IMAGE                        COMMAND                  CREATED         STATUS                            PORTS                                       NAMES
aa5266f5ced4   mongo:latest                 "docker-entrypoint.s…"   2 minutes ago   Restarting (132) 49 seconds ago                                               service02mongodb
ec9c0b8b3d11   dockerproj-service_01_web    "python app.py"          2 minutes ago   Up About a minute                 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   service01web
ea514933dd60   dockerproj-service_03_curl   "/app/script.sh"         2 minutes ago   Exited (127) About a minute ago                                               service03curl
```
