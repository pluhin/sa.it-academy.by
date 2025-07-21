# Homework Assignment 1:
## docker-compose.yaml
```yaml
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: wppass
      WORDPRESS_DB_NAME: wpdb
    volumes:
      - wp_data:/var/www/html
    depends_on:
      - db

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: wpdb
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: wppass
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  wp_data:
  mysql_data:
```
## docker-compose up -d

```
[+] Running 25/25
 ✔ wordpress Pulled                                                                               11.8s
   ✔ 3da95a905ed5 Already exists                                                                   0.0s
   ✔ 57425fa1eb7f Pull complete                                                                    0.6s
   ✔ f05433f0219e Pull complete                                                                    6.3s
   ✔ 1e8752612fda Pull complete                                                                    6.3s
   ✔ b0c8e9ff96e5 Pull complete                                                                    6.8s
   ✔ ae79cd1ac319 Pull complete                                                                    6.8s
   ✔ 777f99eef8ce Pull complete                                                                    6.8s
   ✔ 8d5c7dfff743 Pull complete                                                                    7.0s
   ✔ f49d3e862d34 Pull complete                                                                    7.0s
   ✔ a546e38c8200 Pull complete                                                                    7.3s
   ✔ 6dada9a66036 Pull complete                                                                    7.3s
   ✔ bfb2326228ed Pull complete                                                                    7.3s
   ✔ 066a2c719815 Pull complete                                                                    7.4s
   ✔ 31cf41e2130b Pull complete                                                                    7.4s
   ✔ 4f4fb700ef54 Pull complete                                                                    7.4s
   ✔ 943e17fb1ac1 Pull complete                                                                    8.2s
   ✔ 0f8a1e4aa419 Pull complete                                                                    8.7s
   ✔ 631790c5f56e Pull complete                                                                    8.7s
   ✔ cf72a4578818 Pull complete                                                                    8.7s
   ✔ 91de36bfa962 Pull complete                                                                    8.8s
   ✔ a0e7e7a384b8 Pull complete                                                                    9.7s
   ✔ 38e95764cb8f Pull complete                                                                    9.8s
   ✔ 1dab42839c3d Pull complete                                                                    9.8s
   ✔ 3abbe1a5d4a4 Pull complete                                                                    9.8s
[+] Running 5/5
 ✔ Network 08docker-compose_default        Created                                                 0.0s
 ✔ Volume "08docker-compose_mysql_data"    Created                                                 0.0s
 ✔ Volume "08docker-compose_wp_data"       Created                                                 0.0s
 ✔ Container 08docker-compose-db-1         Started                                                 0.6s
 ✔ Container 08docker-compose-wordpress-1  Started                                                 0.4s
```
## curl -I http://localhost:8080

```
HTTP/1.1 302 Found
Date: Mon, 21 Jul 2025 18:51:08 GMT
Server: Apache/2.4.62 (Debian)
X-Powered-By: PHP/8.2.29
Expires: Wed, 11 Jan 1984 05:00:00 GMT
Cache-Control: no-cache, must-revalidate, max-age=0, no-store, private
X-Redirect-By: WordPress
Location: http://localhost:8080/wp-admin/install.php
Content-Type: text/html; charset=UTF-8
```

# Homework Assignment 2:

## .github/workflows/build.yaml

```
name: Publish Docker on Github

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
          tags: ghcr.io/2qic1/04.github-actions
```

## app/app.py

```
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
```

## app/requirements.txt

```
fastapi>=0.68.0
uvicorn>=0.15.0
```

## Dockerfile

```
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app/app.py"]
```
