## Repositories's urls : 

- [GitHub](https://github.com/nikolaikunai/docker_build)
- [DockerHbub](https://hub.docker.com/repository/docker/nikolaikunai/myproject)


## History of testing command
```
docker run -d -p 8080:80 myapp
06853a7ee3a9d0bd112bb3884bf58f86fe019219b5c989aa92da3afc18fe0d20

docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED         STATUS         PORTS                                   NAMES
06853a7ee3a9   myapp     "python myapp.py"   7 seconds ago   Up 6 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   hardcore_fermi

curl http://127.0.0.1:8080
Hello world from Nikolai

docker logs 06853a7ee3a9
 * Serving Flask app 'myapp' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:80
 * Running on http://172.17.0.2:80 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 376-121-720
172.17.0.1 - - [25/May/2022 08:11:25] "GET / HTTP/1.1" 200 -
```