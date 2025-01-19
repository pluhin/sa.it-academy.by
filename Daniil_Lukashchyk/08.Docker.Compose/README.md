# 08.Docker.Docker-compose
---

## 1: Docker Compose for Application Stacks

Installing docker-compose

```bash
sudo curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
docker-compose --version
```

Output

```bash
Docker Compose version v2.24.5
```

docker-compose.yaml

```yaml
version: '3.3'
services:
  drupal:
    image: drupal:latest
    depends_on:
      - db
    environment:
      - DRUPAL_DB_HOST=${DB_NAME}
      - DRUPAL_DB_NAME=${DB_NAME}
      - DRUPAL_DB_USER=${DB_USER}
      - DRUPAL_DB_PASSWORD=${DB_PASS}
    env_file:
      - .env
    ports:
      - "8080:80"
    volumes:
      - drupal_modules:/var/www/html/modules
      - drupal_profiles:/var/www/html/profiles
      - drupal_themes:/var/www/html/themes
      - drupal_sites:/var/www/html/sites
    restart: always

  db:
    image: mysql:5.7
    environment:
      - MYSQL_DATABASE=${DB_NAME}
      - MYSQL_USER=${DB_USER}
      - MYSQL_PASSWORD=${DB_PASS}
      - MYSQL_ROOT_PASSWORD=${ROOT_PASS}
    env_file:
      - .env
    volumes:
      - db_data:/var/lib/mysql
    restart: always

volumes:
  db_data:
  drupal_modules:
  drupal_profiles:
  drupal_themes:
  drupal_sites:
```

Run the application

```bash
docker-compose up
```

Output

```bash
[+] Running 31/31
 ✔ db 11 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                    65.1s
   ✔ 20e4dcae4c69 Pull complete                                                                                                                         39.7s
   ✔ 1c56c3d4ce74 Pull complete                                                                                                                         34.6s
   ✔ e9f03a1c24ce Pull complete                                                                                                                         36.2s
   ✔ 68c3898c2015 Pull complete                                                                                                                         39.1s
   ✔ 6b95a940e7b6 Pull complete                                                                                                                         39.8s
   ✔ 90986bb8de6e Pull complete                                                                                                                         40.5s
   ✔ ae71319cb779 Pull complete                                                                                                                         46.4s
   ✔ ffc89e9dfd88 Pull complete                                                                                                                         41.7s
   ✔ 43d05e938198 Pull complete                                                                                                                         53.2s
   ✔ 064b2d298fba Pull complete                                                                                                                         47.2s
   ✔ df9a4d85569b Pull complete                                                                                                                         47.9s
 ✔ drupal 18 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                         68.2s
   ✔ c57ee5000d61 Pull complete                                                                                                                         19.8s
   ✔ e8c14b2bf4d5 Pull complete                                                                                                                          0.6s
   ✔ 8ce454101f9e Pull complete                                                                                                                         47.1s
   ✔ 5cc00f80902c Pull complete                                                                                                                          1.5s
   ✔ 29b37124ca06 Pull complete                                                                                                                         10.0s
   ✔ e42f5ad5c25b Pull complete                                                                                                                         10.8s
   ✔ ec8bff4ba880 Pull complete                                                                                                                         11.6s
   ✔ 22e88459aeeb Pull complete                                                                                                                         15.2s
   ✔ 991f350d8b30 Pull complete                                                                                                                         16.0s
   ✔ 262dbbf5e87c Pull complete                                                                                                                         21.9s
   ✔ 38499d29be21 Pull complete                                                                                                                         20.6s
   ✔ b99eae53c563 Pull complete                                                                                                                         21.6s
   ✔ d420516e7c01 Pull complete                                                                                                                         22.3s
   ✔ 7f850d9bd22d Pull complete                                                                                                                         23.2s
   ✔ aaa2ea671c1c Pull complete                                                                                                                         23.3s
   ✔ ccd6b071331f Pull complete                                                                                                                         24.6s
   ✔ a18e14fa4439 Pull complete                                                                                                                         24.3s
   ✔ 630f6ee41695 Pull complete                                                                                                                         33.9s
[+] Running 2/8
 ⠋ Network 08dockerdocker-compose_default           Created                                                                                              1.9s
 ⠏ Volume "08dockerdocker-compose_drupal_themes"    Created                                                                                              1.9s
 ⠏ Volume "08dockerdocker-compose_drupal_sites"     Created                                                                                              1.9s
 ⠏ Volume "08dockerdocker-compose_db_data"          Created                                                                                              1.9s
 ⠏ Volume "08dockerdocker-compose_drupal_modules"   Created                                                                                              1.9s
 ⠏ Volume "08dockerdocker-compose_drupal_profiles"  Created                                                                                              1.9s
 ✔ Container 08dockerdocker-compose-db-1            Started                                                                                              1.0s
 ✔ Container 08dockerdocker-compose-drupal-1        Started         
```

Making ssh tunnel in git bash

```bash
ssh -L 8080:127.0.0.1:8080 burpee@192.168.171.128 -f -N
```

Screenshot of the webpage
![Webpage](image1.png)

Stop containers and remove volumes

```bash
docker-compose down --volumes
```

## 2: Docker Compose for Application Stacks

[Github repo for task 2](https://github.com/Gorilbl4/08.Docker.Compose)

app.py

```python
#MathOps class
class Calculator:
  #empty constructor
  def __init__(self):
    pass
  #add method - given two numbers, return the addition
  def add(self, x1, x2):
    return x1 + x2
  #multiply method - given two numbers, return the 
  #multiplication of the two
  def multiply(self, x1, x2):
    return x1 * x2
  #subtract method - given two numbers, return the value
  #of first value minus the second
  def subtract(self, x1, x2):
    return x1 - x2
  #divide method - given two numbers, return the value
  #of first value divided by the second
  def divide(self, x1, x2):
    if x2 != 0:
      return x1/x2
```

build.yaml

```yaml
name: Publish Docker on Github

on:
  release:
    types: [published]
  push:
    branches:
      - "main"

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

      - name: Log in to the Container registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v3
        with:
          context: .
          push: true
          tags: ghcr.io/gorilbl4/08.docker.compose
```

Dockerfile

```bash
FROM python:3.9

WORKDIR /app

COPY app.py .

EXPOSE 5000
```
