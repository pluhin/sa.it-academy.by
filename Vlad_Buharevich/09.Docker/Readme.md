### 09.Docker
## Links to Rep
1. [Github](https://github.com/Buharevich/09.Docker)
2. [Dockerhub](https://hub.docker.com/repository/docker/darklas/docker_image)

### Action File

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
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/docker_image:v0.1
```
### Run image as container
![image](https://raw.githubusercontent.com/Buharevich/sa.it-academy.by/md-sa2-19-22/Vlad_Buharevich/09.Docker/Run%20image%20as%20container.png)
### Connection tests
![image](https://github.com/Buharevich/sa.it-academy.by/blob/md-sa2-19-22/Vlad_Buharevich/09.Docker/Telnet.png?raw=true)
