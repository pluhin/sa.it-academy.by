# Docker Installation and Basic Commands

```
  340  cd 07.Docker/
  341  nano Dockerfile
  342  docker build -t first_image:v1.0 .
  343  docker images
  344  nano Dockerfile
  345  docker build --target zip -t first_image:zip --target base -t firs_image:base .
  346  docker images
  347  nano 01.Dockerfile
  348  docker build -t demo:1 -f 01.Dockerfile .
  349  docker images
  350  nano 02.Dockerfile
  351  docker build -t demo:2 -f 02.Dockerfile .
  352  docker images
  353  docker run -it demo:1 bash
  354  docker run -it demo:2 bash
  355  nano 03.Dockerfile
  356  docker build -t demo:3 -f 03.Dockerfile .
  357  docker images
  358  docker inspect demo:3
  359  docker inspect demo:2
  360  nano 04.Dockerfile
  361  docker build -t demo:4 -f 04.Dockerfile .
  362  docker images
  363  docker inspect demo:4
  366  cat index.html 
  367  cat nginx.conf 
  369  cat 05.Dockerfile 
  370  docker build -t demo:5 -f 05.Dockerfile .
  371  docker run -p 80:80 demo:5
  372  docker images
  374  cat 06.Dockerfile 
  375  docker build -t demo:6 -f 06.Dockerfile .
  376  docker build -t nmap:first -f 06.Dockerfile .
  377  docker run -t nmap:first -p 22 192.168.201.9
  378  nano ~/.bashrc
  379  source ~/.bashrc
  380  nmap -p 22 192.168.201.9

```
# Building a Docker Image a Flask Application with Dockerfile

```
  400  cd /var/www/TestApp
  401  sudo mkdir -p app/static app/templates
  402  sudo nano app/__init__.py
  403  sudo nano app/views.py
  404  sudo nano uwsgi.ini
  405  sudo nano main.py
  406  sudo nano requirements.txt
  407  sudo nano Dockerfile
  408  sudo nc localhost 56733 < /dev/null; echo $?
  409  sudo nano start.sh
  410  sudo bash start.sh
  416  sudo docker ps
       ip -a
       HTTP://172.17.0.1:56733
```
