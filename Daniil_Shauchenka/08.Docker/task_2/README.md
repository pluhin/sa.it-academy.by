```
Dockerfile consists of 2 parts: build + runtime
github actions configured in docker-build.yml
pushed to dockerhub https://hub.docker.com/repository/docker/dshauchenka/docker-compose-2/general
connected slack app in my own channel to notify me about builds
all the credentials and sensitive data is stored in github secrets

to run locally:
docker pull dshauchenka/docker-compose-2:latest
docker run -p 8080:8080 dshauchenka/docker-compose-2:latest
```
