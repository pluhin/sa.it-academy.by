# Bash history

```bash
 1538  cd listener/
 1539  vim listener.py 
 1540  python listener.py 
 1544  vim Dockerfile
 1551  docker build -t port:1 .
 1560  docker images
 1574  docker run -p 8080:9090 -it port:1
 1594  git clone git@github.com:DenisDoubinin/test_docker.git
 1595  cd test_docker/
 1596  cp ~/Documents/Denis_Doubinin/09.Docker/listener/* ~/Documents/Denis_Doubinin/09.Docker/Git/test_docker/
 1597  ls -la
 1598  git status 
 1599  git add Dockerfile 
 1600  git commit -m "Test_Docker_push"
 1601  git status
 1602  git push
```
# Output

```bash
[denis@denis-PC listener]$ curl localhost:8080
GET / HTTP/1.1
HOST: LOCALHOST:8080
USER-AGENT: CURL/7.58.0
ACCEPT: */*

[denis@denis-PC listener]$ docker run -p 8080:9090 -it port:1
connected: ('172.17.0.1', 50590)
```

