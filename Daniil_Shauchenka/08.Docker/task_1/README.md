```

Dockerfile builds the java app via gradle and runs it in a lightweight jdk 21 image
docker-compose.yml defines 2 services: db + app(depends on db) 

to run: docker compose up -d 
to stop docker compose down (-v to reset db volume)

```
