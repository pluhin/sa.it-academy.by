
```bash
10487  cd  ../../
10488  git pull
10489  clear
10490  docker version
10491  docker info
10492  dockr ps
10493  docker ps
10494  docker kill webserver
10495  clear
10496  docker search nginx
10497  docker pull nginx
10498  docker inspect nginx
10499  docker images
10500  docker run -p 81:80 --name webserver nginx
10501  docker rm $(docker ps -aq)
10502  docker run -p 81:80 --name webserver nginx
10503  docker run -d -p 81:80 --name webserver nginx
10504  docker rm $(docker ps -aq)
10505  docker run -d -p 81:80 --name webserver nginx
10506  docker ps
10507  curl -s localhost:81 
10508  docker container logs webserver
10509  docker exec -it webserver bash
10510  docker stop webserver
10511  socker ps
10512  docker ps
10513  docker rm $(docker ps -aq)
10514  mkdir 05.Docker
10515  cd 05.Docker
10516  mkdir 00
10517  cd 00
10518  vim index.html
10519  docker run -d -p 81:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
10520  curl -s localhost:81 
10521  docker stop webserver
10522  docker rm $(docker ps -aq)
10523  cd ../
10524  ls
10525  ls -l 
10526  docker build -t first_image:v1.2.0 .
10527  docker images | grep first
10528  docker inspect first_image:v1.2.0
10529  clear
10530  docker build --target base -t first_image:base .
10531  docker build --target zip -t first_image:zip .
10532  docker build --target zip -t first_image:zip  --target base first_image:base .
10533  docker build --target zip -t first_image:zip  --target base -t first_image:base .
10534  vim 01.Dockerfile
10535  docker build -it demo:1 .
10536  docker build -t demo:1 -f 01.Dockerfile .
10537* clear
10538  docker images | grep demo
10539  docker inspect demo:1
10540  vim 02.Dockerfile
10541  docker build -t demo:2 -f 02.Dockerfile .
10542* top
10543  docker images | grep demo
10544  docker inspect demo:2
10545  docker run -it demo:2 bash
10546  vim 03.Dockerfile
10547  docker build -t demo:3 -f 03.Dockerfile .
10548  docker images | grep demo
10549  docker inspect demo:3
10550  vim 04.Dockerfile
10551  docker build -t demo:4 -f 04.Dockerfile .
10552  docker images | grep demo
10553  docker inspect demo:4
10554  vim 05.Dockerfile
10555  vim nginx.conf
10556  cp  00/index.html ./
10557  ls
10558  vim 05.Dockerfile
10559  docker build -t demo:5 -f 05.Dockerfile .
10560  docker images | grep demo
10561  docker run -p 81:80 --name webserver demo:5
10562* top
10563  docker build -t pluhin31/demo_sa:5 -f 05.Dockerfile .
10564  docker push pluhin31/demo_sa:5
10565  docker build -t jfrog.it-academy.by/public/demo_sa:5 -f 05.Dockerfile .
10566  docker push jfrog.it-academy.by/public/demo_sa:5
10567  vim 06.Dockerfile
10568  docker build -t nmap:my -f 06.Dockerfile .
10569  docker run -t nmap:my 
10570  docker run -t nmap:my 192.168.1.100
10571* cd ../
10572* git clone git@github.com:pluhin/test_build.git
10573* cd test_build
10574* ls
10575* vim Dockerfile
10576* vim index.html
10577* git add --all
10578* git commit -m "new changes"
10579* git push
```