
## Alex_Muzhichenko_09.Docker

---

[Github](https://github.com/amuzhichenko/docker)
[Dockerhub](https://hub.docker.com/repository/docker/amuzhichenko/amuzhichenko_docker)


### Dockerfile

```bash

FROM python:3.4
RUN pip install Flask==0.10.1
WORKDIR /app
COPY app /app
CMD ["python", "myapp.py"]


```

### My_Python_app


```bash


from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
return 'Hello World!\n'
if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')


```


### build_docker_image.yaml


```bash

name: Alex_Muzhichenko_Docker image CI

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
          context: .
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/amuzhichenko_docker:v1


```

### Build and run docker

```bash

alex@ubuntutest:~/docker$ docker build -t amuzhichenko_docker:v1 .
Sending build context to Docker daemon  6.144kB
Step 1/5 : FROM python:3.4
 ---> 8c62b065252f
Step 2/5 : RUN pip install Flask==0.10.1
 ---> Using cache
 ---> e906d3bc25ff
Step 3/5 : WORKDIR /app
 ---> Using cache
 ---> 13e0f3473e69
Step 4/5 : COPY app /app
 ---> Using cache
 ---> 1970845fb5d2
Step 5/5 : CMD ["python", "myapp.py"]
 ---> Using cache
 ---> 197dc4e5fc6d
Successfully built 197dc4e5fc6d
Successfully tagged amuzhichenko_docker:v1
alex@ubuntutest:~/docker$ docker run -d -p 5000:5000 amuzhichenko_docker:v1
3f92614f391264d37a374b5c084c538fc6d19ea5dd4c656a3a39ce4a5eba9234
alex@ubuntutest:~/docker$ docker ps
CONTAINER ID   IMAGE                    COMMAND             CREATED         STATUS         PORTS                                       NAMES
3f92614f3912   amuzhichenko_docker:v1   "python myapp.py"   3 seconds ago   Up 3 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   exciting_solomon

```

### Test

```bash

alex@ubuntutest:~/docker$ curl localhost:5000
Hello World!


```
