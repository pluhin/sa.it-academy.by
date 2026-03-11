## Homework Assignment 1: Docker Compose for Application Stacks


Run the application stack using the docker-compose up or docker compose up command.

```bash
docker-compose up --build
curl http://localhost:8888
docker port flask_app
```

```log 
08.DockerCompose % curl http://localhost:8888
Connected to PostgreSQL: ('PostgreSQL 15.17 (Debian 15.17-1.pgdg13+1) on aarch64-unknown-linux-gnu, compiled by gcc (Debian 14.2.0-19) 14.2.0, 64-bit',)
fiodarau@EPBYMINW5591 08.DockerCompose % docker port flask_app
5000/tcp -> 0.0.0.0:8888
5000/tcp -> [::]:8888
```
