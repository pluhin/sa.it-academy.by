# **07.Docker**
### **Dockerfile**
```bash
FROM python:3.11-slim
WORKDIR /app
COPY test.py ./
EXPOSE 8081
ENTRYPOINT ["python", "test.py"]
```

### **test.py**
```bash
from http.server import BaseHTTPRequestHandler, HTTPServer

class myHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()

        message = "Server working!"

        self.wfile.write(bytes(message, "utf8"))



server = HTTPServer(('', 8081), myHandler)
server.serve_forever()
```

### **Docker build**
```bash
root@ubuntu:/home/ivan/07.Docker# docker build -t demo:10 -f dockerfile .
[+] Building 2.3s (8/8) FINISHED
 => [internal] load build definition from dockerfile                       0.1s
 => => transferring dockerfile: 133B                                       0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim        2.2s
 => [1/3] FROM docker.io/library/python:3.11-slim@sha256:d0e839882b87135b  0.0s
 => [internal] load build context                                          0.0s
 => => transferring context: 29B                                           0.0s
 => CACHED [2/3] WORKDIR /app                                              0.0s
 => CACHED [3/3] COPY test.py ./                                           0.0s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:67ac1ef6b8ca66b5178933bc4ac8c1edae2a8280881b6  0.0s
 => => naming to docker.io/library/demo:10                                 0.0s
root@ubuntu:/home/ivan/07.Docker#
```

### **Docker images**
```bash
root@ubuntu:/home/ivan/07.Docker# docker images
REPOSITORY    TAG       IMAGE ID       CREATED             SIZE
demo          10        67ac1ef6b8ca   23 minutes ago      128MB
demo          7         ec7ee237aba6   About an hour ago   128MB
demo          8         ec7ee237aba6   About an hour ago   128MB
demo          6         f4bb75171638   About an hour ago   128MB
demo          9         f4bb75171638   About an hour ago   128MB
<none>        <none>    b25ae220104d   About an hour ago   128MB
demo          5         5bbb4485cf3c   2 hours ago         128MB
demo          4         3a4c9fdf1b86   2 hours ago         128MB
demo          1         520a7158b13c   2 hours ago         123MB
hello-world   latest    feb5d9fea6a5   17 months ago       13.3kB
```

### **Curl result**
```bash
root@ubuntu:/home/ivan/07.Docker# curl http://127.0.0.1:8081
Server working!root@ubuntu:/home/ivan/07.Docker#
```

### **history**
```bash
 vim dockerfile
  382  docker build -t demo:2 -f dockerfile .
  383  docker run -p 5000:5000 --name demo demo:2
  384  docker run -p 8080:8080  demo:2
  385  docker run --help
  386  clear
  387  docker pull localhost:8080/docker/app.py
  388  docker run -p 8080:8080  -d demo
  389  vim app.py
  390  docker build -t demo:3 -f dockerfile .
  391  ll
  392  rm requirements.txt
  393  docker build -t demo:3 -f dockerfile .
  394  vim dockerfile
  395  docker build -t demo:4 -f dockerfile .
  396  docker run -p 8080:8080 demo:4
  397  docker images
  398  curl http://localhost:8080
  399  docker ps
  400  vim app.py
  401  docker build -t demo:5 -f dockerfile .
  402  docker run -p 8080:8080 demo:5
  403  vim app.py
  404  docker build -t demo:6 -f dockerfile .
  405  docker run -p 8080:8080 demo:6
  406  vim app.py
  407  docker build -t demo:6 -f dockerfile .
  408  docker run -p 8080:8080 demo:6
  409  apt install curl
  410  curl http://localgost:8080
  411  curl http://localhost:8080
  412  curl http://:8080
  413  vim app.py
  414  docker build -t demo:7 -f dockerfile .
  415  docker run -p 8080:8080 demo:7
  416  curl http://localhost:8080
  417  docker ps
  418  docker ps -a
  419  docker run -d -t -i demo:7 /bin/bash
  420  curl http://localhost:8080
  421  ps -a
  422  clear
  423  curl http://localhost:8080
  424  netstat -ln | grep 8080
  425  apt install netstat
  426  apt install nettools
  427  apt install net tools
  428  apt find net
  429  apt search net
  430  apt search netools
  431  apt search nettools
  432  apt search netstat
  433  apt install net-tools
  434  netstat -ln | grep 8080
  435  sudo iptables -A INPUT -i lo -j ACCEPT
  436  sudo iptables -A OUTPUT -o lo -j ACCEPT
  437  sudo iptables -L
  438  curl http://localhost:8080
  439  docker ps
  440  docker ps -a
  441  docker stop all
  442  docker stop ps -qa
  443  docker stop ps -a
  444  docker stop ps
  445  clear
  446  docker status
  447  systemctl status docker
  448  clear
  449  ll
  450  vim dockerfile
  451  docker build -t demo:8 -f dockerfile .
  452  docker run -p 8080:8080 demo:8
  453  docker ps
  454  curl http://localhost:8080
  455  docker -ps -a
  456  docker -ps a
  457  docker -ps
  458  docker ps -a
  459  docker logs happy_joliot
  460  docker run -p 8080::8080 demo:8
  461  docker run -p 8080:8080 demo:8
  462  docker start `docker ps -q -l` && docker attach `docker ps -q -l`
  463  docker start demo:8
  464  docker staкt 4593f04f4543
  465  docker start 4593f04f4543
  466  docker ps
  467  curl http://localhost:8080
  468  docker start -i 4593f04f4543
  469  docker ps
  470  curl http://localhost:8080
  471  docker start -i 4593f04f4543
  472  docker network ls
  473  docker network 1fe5aa505fe0  4593f04f4543
  474  docker network connect 1fe5aa505fe0  4593f04f4543
  475  curl http://localhost:8080
  476  docker ps
  477  docker ps -a
  478  docker up
  479  docker up -d
  480  vim app.py
  481  docker build -t demo:9 -f dockerfile .
  482  docker run demo:9
  483  docker run -p 8080:8080 demo:9
  484  docker ps
  485  docker ps  -a
  486  vim app.py
  487  vim dockerfile
  488  docker images
  489  vim app.py
  490  docker logs b80a6fd280b6
  491  docker build -t demo:10 -f dockerfile .
  492  docker run -p 8081:8081 --name demo demo:10
  493  curl http://127.0.0.1:8081
  494  docker images
  495  history
```