
## Docker file
```bash
FROM python:3.8.2
 
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY ./app.py /app/app.py

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
```

##
```bash
docker build -t mrishkaa/py_app:04 .
Sending build context to Docker daemon  63.49kB
Step 1/7 : FROM python:3.8.2

docker push mrishkaa/py_app:04      
The push refers to repository [docker.io/mrishkaa/py_app]
fbfc990b854c: Pushed 
4715f1948fa8: Layer already exists 
2dd688547bfe: Layer already exists 
508c3f3b7a64: Layer already exists 
7e453511681f: Layer already exists 
b544d7bb9107: Layer already exists 
baf481fca4b7: Layer already exists 
3d3e92e98337: Layer already exists 
8967306e673e: Layer already exists 
9794a3b3ed45: Layer already exists 
5f77a51ade6a: Layer already exists 
e40d297cf5f8: Layer already exists 
04: digest: sha256:37311e1d1c8452bae521843a90292d3fe0e460980454a4b037b2074d2ed84fa0 size: 2842

docker run -d -p 83:5000 mrishkaa/py_app:04
c935735ed3f86e95ea33b7308011b750be9256759103f20b35f4697151b15e01

docker ps                                  
CONTAINER ID        IMAGE                COMMAND             CREATED             STATUS              PORTS                  NAMES
c935735ed3f8        mrishkaa/py_app:04   "python3 app.py"    6 seconds ago       Up 5 seconds        0.0.0.0:83->5000/tcp   practical_diffie
```
## Request using curl
```bash
curl localhost:83
{"message":"Hello Flask app from Docker container"}
```


## Github <=> Dockerhub

[hub.docker](https://hub.docker.com/repository/docker/mrishkaa/py_app/builds)

[github](https://github.com/Veronika-Kylevskaya/docker_hub_integration)