## Docker image

[Docker_Hub](https://hub.docker.com/repository/docker/alexv8288/hello_fastapi)

## Docker file

```dockerfile
FROM python:3.10-slim-buster
WORKDIR /app

RUN pip install fastapi
RUN pip install "uvicorn[standard]"

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

```

## Workflow
[GitHub](https://github.com/alexv8888/09docker)

```yaml
name: Docker Image CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:

  build_and_push:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Login to Docker Hub
      uses: docker/login-action@v1
      with:  
        username: ${{ secrets.DOCKER_HUB_USERNAME }}
        password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

    - name: Build and push
      uses: docker/build-push-action@v2
      with:
        context: ./
        file: ./Dockerfile
        push: true
        tags: ${{ secrets.DOCKER_HUB_USERNAME }}/hello_fastapi:latest
```
## Run the image

```bash
az@az-HP:~/fast$ docker run -dp 7777:80 --name hello_world alexv8288/hello_fastapi:latest
Unable to find image 'alexv8288/hello_fastapi:latest' locally
latest: Pulling from alexv8288/hello_fastapi
751ef25978b2: Already exists 
43bc0ba3761d: Already exists 
628f2db78cbb: Already exists 
ee29c3416e00: Already exists 
0faa11303504: Already exists 
944f0b7a6a31: Pull complete 
40292ad880fc: Pull complete 
ffdf521a4f60: Pull complete 
2f1705bb8bdf: Pull complete 
Digest: sha256:3375d382935be49b6cf15e4fd08339fe4079e26e7a63046dbc81f80fc0629cdd
Status: Downloaded newer image for alexv8288/hello_fastapi:latest
6569f5f700b441be0c215d71c02d23cc2c9b14c425fc5a43fa65dc7ee5c10787
az@az-HP:~/fast$ curl http://localhost:7777
{"Hello":"World"}

az@az-HP:~/fast$ docker logs hello_world 
INFO:     Started server process [1]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:80 (Press CTRL+C to quit)
INFO:     172.17.0.1:57464 - "GET / HTTP/1.1" 200 OK

```