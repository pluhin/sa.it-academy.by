#
# 08. Docker. Docker compose
#
---
## Homework Assignment 1: Docker Compose for Application Stacks

### Install docker-compose
``` bash
sudo  curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ls -l /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
ls -l /usr/local/bin/docker-compose
docker-compose --version

Docker Compose version v2.23.3-desktop.2
```

### docker-compose.yaml

```bash
version: '3.3'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_secret
      MYSQL_DATABASE: drupal
      MYSQL_USER: drupal
      MYSQL_PASSWORD: drupal
  drupal:
    depends_on:
      - db
    image: drupal:latest
    ports:
      - "8000:80"
    volumes:
      - drupal_modules:/var/www/html/modules
      - drupal_profiles:/var/www/html/profiles
      - drupal_themes:/var/www/html/themes
      - drupal_sites:/var/www/html/sites
    restart: always
volumes:
  db_data:
  drupal_modules:
  drupal_profiles:
  drupal_themes:
  drupal_sites:
```

### Run the application

```bash
docker-compose up
curl http://localhost:8080
```