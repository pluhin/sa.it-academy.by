# 09.Docker
### Repository links
[Dockerhub](https://hub.docker.com/repository/docker/sergeis8v/docker_image)
[Github](https://github.com/sergei-sv/git_project)

### Dockerfile
```bash
FROM python:alpine
COPY server.py /server.py
ENTRYPOINT ["python3","-u", "server.py"]
```

### Action file
```bash
name: Docker image CI

on:
  release:
    types: [published]
  push:
    branches:
      - "main"
jobs:
  build_image:
    name: Build Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2

      - name: Login in DockerHub registry
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}

      - name: Build and push the Docker image
        uses: docker/build-push-action@v2
        with:
          context: ./docker
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/docker_image:v0.1
```
### Running docker container
```bash
docker run -p 8001:8000 -d sergeis8v/docker_image:v0.1
Unable to find image 'sergeis8v/docker_image:v0.1' locally
v0.1: Pulling from sergeis8v/docker_image
59bf1c3509f3: Pull complete 
07a400e93df3: Pull complete 
812206835f4c: Pull complete 
73342013dbd4: Pull complete 
27450111daa5: Pull complete 
00939199e7f0: Pull complete 
Digest: sha256:ad72d4b96e86b6c6b18806737c2aff04621126ca7801d4168ee5ab71a6c86e76
Status: Downloaded newer image for sergeis8v/docker_image:v0.1
59b80ba07ab77f3aaf04e9eeecc7b380c722d53227739faa24f54ba709546ca0
```

### Testing commands
```bash
sergei@sergei-pc:~/git/docker$ telnet localhost 8001
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

sergei@sergei-pc:~/git/docker$ curl http://127.0.0.1:8001
Hello world from hostname: 59b80ba07ab7
```