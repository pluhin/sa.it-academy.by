
```bash
 9985  sudo apt install docker.io
 9986  docker version
 9987  clear
 9988  docker images
 9989  docker stop $(docker ps -aq)
 9990  docker rm $(docker ps -aq)
 9991  docker rmi $(docker images -q)
 9992  docker rm $(docker ps -aq)
 9993  docker rmi $(docker images -q) -f
 9994  docker rm $(docker ps -aq)
 9995  docker images
 9996  clear
 9997  docker ps
 9998  docker search httpd
 9999  docker pull httpd
10000  docker images
10001  docker run  httpd:latest
10002  clear
10003  docker run -d -p 80:80  httpd:latest
10004  docker ps
10005  curl http://localhost
10006  docker stop 7a9f95d1c4cb
10007  curl http://localhost
10008  cd /tmp
10009  mkdir www
10010  date > www/index.hmtl
10011  date > www/index.html
10012  docker run -d -p 80:80  -v /tmp/www:/var/www/htnl:ro httpd:latest
10013  curl http://localhost
10014  curl http://localhost/index.hmtl
10015  curl http://localhost/index.html
10016  docker ps
10017  docker kill ae249326daf3
10018  docker ps
10019  docker run -it  httpd:latest bash
10020  docker run -d -p 80:80  -v /tmp/www:/usr/local/apache2/htdocs:ro httpd:latest
10021  curl http://localhost/
10022  history
10023  clear
10024  cd ~/Documents/git_repos/home/sa.it-academy.by
10025  git pull
10026  cd  demo
10027  ls
10028  mkdir 05.Docker
10029  cd  05.Docker
10030  vim Dockerfile
10031  docker build .
10032  docker images
10033  docker rmi a77417781d02
10034  docker images
10035  docker build -t demo_sa/test:v1.0 .
10036  docker images
10037  vim Dockerfile
10038  docker build --target base -t multi/base:v1.0 --target zip -t multi/zip:v1.0 . 
10039  vim Dockerfile
10040  docker images
10041  docker build --target base -t multi/base:v1.0 . 
10042  docker ps
10043  docker kill 63e3401a8bca
10044  docker inspect demo_sa/test 
10045  docker inspect demo_sa/test:v1.0 
10046  docker history demo_sa/test:v1.0 
10047  docker history demo_sa/test:v1.0  --format "{{.CreatedBy}}" --no-trunc
10048  vim 01.Dockerfile
10049  docker build -t demo:v1 -f 01.Dockerfile .
10050  docker inspect demo:v1
10051  docker images
10052  vim 02.Dockerfile
10053  docker build -t demo:v2 -f 02.Dockerfile .
10054  docker inspect demo:v2
10055  docker images
10056  vim 03.Dockerfile
10057  docker build -t demo:v3 -f 03.Dockerfile .
10058  docker inspect demo:v3
10059  docker images
10060  vim 04.Dockerfile
10061  docker build -t demo:v4 -f 04.Dockerfile .
10062  docker inspect demo:v4
10063  docker images
10064  vim 04.Dockerfile
10065  vim 03.Dockerfile
10066  vim 05.Dockerfile
10067  vim nginx.conf
10068  vim index.html
10069  vim 05.Dockerfile
10070  docker build -t demo:v5 -f 05.Dockerfile .
10071  docker inspect demo:v5
10072  docker images
10073  docker run -d -p 80:80 demo:v5
10074  docker ps
10075  curl http://localhost
10076  docker build -t pluhin31/test_sa:v0 -f 05.Dockerfile .
10077  docker images
10078  docker push pluhin31/test_sa:v0
10079  docker logout
10080  docker login
10081* cd /tmp
10082* git clone git@github.com:pluhin/build_sa.git
10083* cd build_sa
10084* vim README.md
10085* vim Dockerfile
10086* git add --all
10087* git commit -m "m-sa2-14-20"
10088* git push
```