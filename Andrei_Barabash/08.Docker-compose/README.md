## 1: Docker Compose for Application Stacks

### 4 Run the application stack 
```bash
docker compose up
```

### 5 Access the application through a web browse
localhost:8080

### 6 docker-compose file structure:
```docker-compose file

services:
  nginx:
  php:
  db:

volumes:
  db_data:
  
networks:
  app_network:
```


## 2: Docker build automation (github action)

### 3 Compile or package the application in the build stage.
```bash
docker build -t multistage . --target build
```

docker build -t multistage:build . --target build

docker run -it multistage:build --name php-build

### 5 Build the multi-stage Docker image and run a container based on it.

```bash
docker build -t multistage .

docker run -it multistage --name php-prod
```

