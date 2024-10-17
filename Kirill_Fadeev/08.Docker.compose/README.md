# Homework Assignment 1: Docker Compose for Application Stacks
1. Select a combination of services (e.g., web app, database) to create a multi-container application.
  * Nginx + MySQL + WordPress(FPM)  

2. Create a Docker Compose YAML file to define the services, networks, and volumes.
  * docker-compose.yaml
```bash
fadeev@kirill:~/wordpress$ cat docker-compose.yaml

services:
  db:
    image: mysql:8.0
    container_name: db
    restart: unless-stopped
    env_file: .env
    environment:
      - MYSQL_DATABASE=wordpress
    volumes:
      - dbdata:/var/lib/mysql
    command: '--default-authentication-plugin=mysql_native_password'
    networks:
      - app-network

  wordpress:
    depends_on:
      - db
    image: wordpress:5.1.1-fpm-alpine
    container_name: wordpress
    restart: unless-stopped
    env_file: .env
    environment:
      - WORDPRESS_DB_HOST=db:3306
      - WORDPRESS_DB_USER=$MYSQL_USER
      - WORDPRESS_DB_PASSWORD=$MYSQL_PASSWORD
      - WORDPRESS_DB_NAME=wordpress
    volumes:
      - wordpress:/var/www/html
    networks:
      - app-network

  webserver:
    depends_on:
      - wordpress
    image: nginx:1.15.12-alpine
    container_name: webserver
    restart: unless-stopped
    ports:
      - "80:80"
    volumes:
      - wordpress:/var/www/html
      - ./nginx-conf:/etc/nginx/conf.d
    networks:
      - app-network

volumes:
  wordpress:
  dbdata:

networks:
  app-network:
    driver: bridge
```
3. Configure environment variables and dependencies between services.
  * .env
```bash
fadeev@kirill:~/wordpress$ cat .env
MYSQL_ROOT_PASSWORD=root_pass
MYSQL_USER=your_wp_db_user
MYSQL_PASSWORD=wp_db_pass
```
  * nginx.conf
```bash
fadeev@kirill:~/wordpress$ cat nginx-conf/nginx.conf
server {
        listen 80;
        listen [::]:80;

        server_name fadeev.local ;

        index index.php index.html index.htm;

        root /var/www/html;

        location ~ /.well-known/acme-challenge {
                allow all;
                root /var/www/html;
        }

        location / {
                try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass wordpress:9000;
                fastcgi_index index.php;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_param PATH_INFO $fastcgi_path_info;
        }

        location ~ /\.ht {
                deny all;
        }

        location = /favicon.ico {
                log_not_found off; access_log off;
        }
        location = /robots.txt {
                log_not_found off; access_log off; allow all;
        }
        location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
                expires max;
                log_not_found off;
        }
}
```
4. Run the application stack using the docker-compose up or docker compose up command.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/1.jpg)  
5. Access the application through a web browser or API client.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/2.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/3.jpg)  
6. Document the Docker Compose file structure and the steps to deploy the application stack.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/4.jpg)  

# Homework Assignment 2: Docker build automation (github action)
1. Choose a programming language (e.g., Java, Go, Python) and a sample application.
  * NodeJS  
2. Write a multi-stage Dockerfile to build the application with different stages for build and runtime.
```bash
#Stage1: Build
FROM node:14-alpine AS build

LABEL maintainer="KirFad@mail.com"

RUN mkdir -p /home/app

WORKDIR /home/app

COPY package*.json ./

RUN npm install

COPY . .

#Stage2:runtime
FROM node:14-alpine AS runtime

RUN mkdir -p /home/app

WORKDIR /home/app

COPY --from=build /home/app .

EXPOSE 3000

CMD ["node", "app.js"]
```
3. Compile or package the application in the build stage.
```bash
FROM node:14-alpine AS build

LABEL maintainer="KirFad@mail.com"

RUN mkdir -p /home/app

WORKDIR /home/app

COPY package*.json ./

RUN npm install

COPY . .
```
4. Copy the compiled application into the runtime stage and configure it to run.
```bash
FROM node:14-alpine AS runtime

WORKDIR /home/app

COPY --from=build /home/app .

EXPOSE 3000

CMD ["node", "app.js"]
```
5. Build the multi-stage Docker image and run a container based on it.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/5.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/6.jpg)  

6. Push/publish image to docker hub and/or github container register.
```bash
name: Create and publish a Docker image

on:
  push:
    branches: ['main']

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build-and-push-image:
    runs-on: ubuntu-latest
      permissions:
      contents: read
      packages: write
      attestations: write
      id-token: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Log in to the Container registry
        uses: docker/login-action@65b78e6e13532edd9afa3aa52ac7964289d1a9c1
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}
      - name: Extract metadata (tags, labels) for Docker
        id: meta
        uses: docker/metadata-action@9ec57ed1fcdbf14dcef7dfbe97b2010124a938b7
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
      - name: Build and push Docker image
        id: push
        uses: docker/build-push-action@f2a1d5e99d037542a71f64918e516c093c6f3fc4
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
      - name: Generate artifact attestation
        uses: actions/attest-build-provenance@v1
        with:
          subject-name: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME}}
          subject-digest: ${{ steps.push.outputs.digest }}
          push-to-registry: true
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/7.jpg)  
7. Slack notification when build failed/success with image name/tag.
```bash
 notification:
    needs: build-and-push-image
    runs-on: ubuntu-latest
    steps:
    - name: Slack Notification
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: project
        SLACK_COLOR: ${{ job.status }}
        SLACK_MESSAGE: "Docker image is ready ${{ env.REGISTRY }}/${{ env.IMAGE_NAME}}"
        SLACK_TITLE: Docker image build status
        SLACK_USERNAME: GitHub
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/08.Docker.compose/img/8.jpg)  
8. Document the Dockerfile structure, the build process, and the advantages of multi-stage builds.