# 08. Docker. Docker compose

## Docker Compose for Application Stacks

### Selected a combination of services (Joomla and MySQL) to create a multi-container applic

### Created a Docker Compose YAML file to define the services, networks, and volumes.

**_Docker compose file:_**
```yaml
version: '3.8'
services:
  joomla:
    image: joomla:latest
    container_name: joomla
    ports:
      - "80:80"
    environment:
      JOOMLA_DB_HOST: mysql
      JOOMLA_DB_USER: ${DB_USR}
      JOOMLA_DB_PASSWORD: ${DB_PASS}
      JOOMLA_DB_NAME: ${DB_NAME}
    env_file:
      - .env
    depends_on:
      - mysql
    networks:
      - joomla-network
    volumes:
      - joomla-data:/var/www/html
    restart: unless-stopped

  mysql:
    image: mysql:latest
    container_name: mysql
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_RPASS}
      MYSQL_DATABASE: ${DB_NAME}
      MYSQL_USER: ${DB_USR}
      MYSQL_PASSWORD: ${DB_PASS}
    env_file:
      - .env
    networks:
      - joomla-network
    volumes:
      - mysql-data:/var/lib/mysql
    restart: unless-stopped

networks:
  joomla-network:
    driver: bridge

volumes:
  joomla-data:
  mysql-data:
```

### Configured environment variables and dependencies between services.
Using file `.env` for passwords and names
```bash
cat .env
DB_USR=joomla
DB_PASS=joomla
DB_NAME=joomla
DB_RPASS=Root!32
```

### Run the application stack using the `docker-compose up` command.
_first time:_
```bash 
docker-compose up -d
[+] Running 22/22
 ✔ joomla 21 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                                    300.6s
   ✔ e67fdae35593 Pull complete                                                                                                                                                       100.4s
   ✔ 22a19ba793cb Pull complete                                                                                                                                                         0.9s
   ✔ 46e419350351 Pull complete                                                                                                                                                       276.9s
   ✔ 8de997c28946 Pull complete                                                                                                                                                         1.7s
   ✔ 1d7540f99b47 Pull complete                                                                                                                                                        74.4s
   ✔ 12a700ba0368 Pull complete                                                                                                                                                        75.0s
   ✔ 9b19829d9fc5 Pull complete                                                                                                                                                        75.9s
   ✔ d44a7be08f84 Pull complete                                                                                                                                                       159.6s
   ✔ 84073d869176 Pull complete                                                                                                                                                       103.8s
   ✔ 6624316b1353 Pull complete                                                                                                                                                       165.0s
   ✔ 81ea0c762078 Pull complete                                                                                                                                                       160.7s
   ✔ 68680de1e42a Pull complete                                                                                                                                                       162.1s
   ✔ 0c351c6a1d3f Pull complete                                                                                                                                                       164.1s
   ✔ 6f2ebe67d411 Pull complete                                                                                                                                                       233.4s
   ✔ 315c7820bdaf Pull complete                                                                                                                                                       223.0s
   ✔ cad77a87fe8f Pull complete                                                                                                                                                       225.3s
   ✔ 26b26e50b40e Pull complete                                                                                                                                                       226.6s
   ✔ 13d6d2261e16 Pull complete                                                                                                                                                       229.9s
   ✔ cc5e0dd7d379 Pull complete                                                                                                                                                       267.7s
   ✔ 43a4db0686c8 Pull complete                                                                                                                                                       235.0s
   ✔ a8586a68c6d8 Pull complete                                                                                                                                                       237.0s
[+] Running 5/5
 ✔ Network 08dockerdocker_compose3_joomla-network  Created                                                                                                                              0.2s
 ✔ Volume "08dockerdocker_compose3_mysql-data"     Created                                                                                                                              0.0s
 ✔ Volume "08dockerdocker_compose3_joomla-data"    Created                                                                                                                              0.0s
 ✔ Container 08dockerdocker_compose3-mysql-1       Started                                                                                                                              1.4s
 ✔ Container 08dockerdocker_compose3-joomla-1      Started                                                                                                                              0.3s
```

_second tine:_
```bash
docker-compose up -d
[+] Running 5/5
 ✔ Network 08dockerdocker_compose3_joomla-network  Created                                                                                                                              0.2s
 ✔ Volume "08dockerdocker_compose3_joomla-data"    Created                                                                                                                              0.0s
 ✔ Volume "08dockerdocker_compose3_mysql-data"     Created                                                                                                                              0.0s
 ✔ Container mysql                                 Started                                                                                                                              0.3s
 ✔ Container joomla                                Started                                                                                                                              0.3s
➜  08.Docker.Docker_Compose3 docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                               NAMES
af0e5d5f95d7   joomla:latest   "/entrypoint.sh apac…"   15 seconds ago   Up 12 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   joomla
2d42b746b22e   mysql:latest    "docker-entrypoint.s…"   15 seconds ago   Up 13 seconds   3306/tcp, 33060/tcp                 mysql
```

### Access the application through a web browser or API client.
![This shit works](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/591e3476-9a22-47b3-9b8f-c7611ebe349c)

```bash
 curl -I http://localhost
HTTP/1.1 302 Found
Date: Mon, 16 Oct 2023 12:12:49 GMT
Server: Apache/2.4.56 (Debian)
X-Powered-By: PHP/8.0.30
Location: installation/index.php
Content-Type: text/html; charset=UTF-8
```
 
## Zabbix Docker compose
In order for Zabbix server and Zabbix web to use the DB, 
you need to add the DB root password to the environment in the Docker compose file.
Also add the necessary settings for the DB to the file and transfer it from the volume to the container.
Although, I think it would be possible to add everything through “commands”. 
But I won’t touch it anymore. As they say: “If it works, don’t touch it”

**_Docker-compose file_**
```yaml
version: '3'
services:
  zabbix-server:
    image: zabbix/zabbix-server-mysql:latest
    container_name: zabbix-server
    ports:
      - "10051:10051"
    volumes:
      - /etc/localtime:/etc/localtime:ro
    environment:
      - DB_SERVER_HOST=mysql
      #- DB_USER=zabbix
      - MYSQL_ROOT_PASSWORD=zabbix
      - MYSQL_USER=zabbix
      - MYSQL_PASSWORD=zabbix
      - MYSQL_DATABASE=zabbix
      - DB_SERVER_PORT=3306
      #- DB_PASSWORD=zabbix
      - ZBX_SERVER_HOST=zabbix-server
      - PHP_TZ=UTC
    depends_on:
      - mysql
    restart: unless-stopped

  zabbix-web:
    image: zabbix/zabbix-web-nginx-mysql:latest
    container_name: zabbix-web
    ports:
      - "8080:8080"
      - "8443:8443"
    volumes:
      - /etc/localtime:/etc/localtime:ro
    environment:
      - DB_SERVER_HOST=mysql
      - MYSQL_ROOT_PASSWORD=zabbix
      - MYSQL_USER=zabbix
      - MYSQL_PASSWORD=zabbix
      - MYSQL_DATABASE=zabbix
      - DB_SERVER_PORT=3306
      - ZBX_SERVER_HOST=zabbix-server
      - PHP_TZ=UTC
    depends_on:
      - zabbix-server
    restart: unless-stopped

  mysql:
    image: mysql:latest
    container_name: mysql
    ports:
      - "3306:3306"
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - mysql_data:/var/lib/mysql
      - ./mysql-init-scripts:/docker-entrypoint-initdb.d
    environment:
#      - MYSQL_ROOT_USER=root
      - MYSQL_ROOT_PASSWORD=zabbix
#      - MYSQL_USER=zabbix
#      - MYSQL_PASSWORD=zabbix
#      - MYSQL_DATABASE=zabbix
#      - MYSQL_CHARSET=utf8
#      - MYSQL_COLLATION=utf8_unicode_ci
    command: --character-set-server=utf8mb4 --collation-server=utf8mb4_bin
    restart: unless-stopped
volumes:
  mysql_data:
```

**_script mysql_**
```mysql
CREATE DATABASE IF NOT EXISTS zabbix character set utf8mb4 collate utf8mb4_bin;
CREATE USER IF NOT EXISTS 'zabbix'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'zabbix';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
SET GLOBAL log_bin_trust_function_creators = 1;
```

**_Check_**
![Zabbix_in_web](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/ed5c81bd-e2a0-4bb2-acbf-2af4a845c15b)
![Zabbix_log_console](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/50a5d893-f303-437a-93b7-50b95eb71230)



## Docker build automation (github action)

**[GitHub link](https://github.com/IPaul32/sa2-25-23-Ivanchuk "Ivanchuk Pavel HW 8 step 2")**

**_Docker file:_**
```bash
FROM python:3.9 as builder

LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

COPY app/app.py .

RUN echo -e "#!/bin/bash\npython /python-game/app.py" > /python-game/app && chmod +x /python-game/app

FROM python:3.9-slim

COPY --from=builder /python-game/app /usr/local/bin/

CMD ["app"]
```

**_Github action file:_**

```yaml
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "master"
jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to the Container registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GIT_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ghcr.io/ipaul32/docker_build:1

      - name: Slack notification SUCCESS
        uses: rtCamp/action-slack-notify@v2
        if: success()
        env:
          SLACK_CHANNEL: github_action
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_COLOR: ${{ job.status }}
          SLACK_MESSAGE: 'Pushing build_docker:${{ github.ref_name }} image is SUCCESS'
          SLACK_TITLE: Post Title
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

      - name: Slack notification FAIL
        uses: rtCamp/action-slack-notify@v2
        if: failure()
        env:
          SLACK_CHANNEL: github_action
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_COLOR: ${{ job.status }}
          SLACK_MESSAGE: 'Pushing build_docker:${{ github.ref_name }} image is FAIL'
          SLACK_TITLE: Post Title
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
### Check 

![docker_action_1](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/8c230241-8d58-4b8c-84f0-0b985d82bd45)

---

![docker_action_2](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/af2424e3-51ef-469f-94d8-7f0ad1a00660)

---

![docker_secrets](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/6387a6ba-68e2-495c-9266-477446c29790)

---

![docker_slack_notifications](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/9ccb81e0-aed9-4868-b247-c9b46c61479f)
