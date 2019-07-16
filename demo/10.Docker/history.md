```bash 
964  mkdir 10.Docker
  965  cd 10.Docker
  966  mkdir 01
  967  cd 01
  968  vim Dockerfile
  969  docker build .
  970  history
  971  sudo  docker rmi $(docker images -q)
  972  sudo  docker rm $(docker images -q)
  973  docker build .
  974  docker image ls
  975  docker build . -t new-image:v1.0
  976  docker image ls
  977  mkdir html
  978  touch html/index.html
  979  date html/index.html
  980  date > html/index.html
  981  date >> html/index.html
  982  docker run -d -p 80:80 -v ./html:/var/www/html:ro new-image:v1.0
  983  docker run -d -p 80:80 -v html:/var/www/html:ro new-image:v1.0
  984  docker ps
  985  docker stop 5f68d8f41d8e
  986  pwd
  987  docker run -d -p 80:80 -v /tmp/sa.it-academy.by/demo/10.Docker/01/html:/var/www/html:ro new-image:v1.0
  988  date >> html/index.html
  989  docker ps
  990  docker stop 3691617fd755
  991  cd ../
  992  mkdir 02
  993  cd 02
  994  vim Dockerfile1
  995  docker build -t demo:v1 -f Dockerfile1 .
  996  curl  http://deb.debian.org/debian/dists/wheezy/main/binary-amd64/Packages
  997  curl  http://deb.debian.org/debian/dists/wheezy/main/binary-amd64/Packages -vvv
  998  docker build -t demo:v1 -f Dockerfile1 .
  999  vim Dockerfile1
 1000  docker build -t demo:v1 -f Dockerfile1 .
 1001  docker images
 1002  cp Dockerfile1 Dockerfile2
 1003  vim Dockerfile2
 1004  docker build -t demo:v2 -f Dockerfile2 .
 1005* cd  /tmp/sa.it-academy.by/demo/10.Docker/02
 1006* cp Dockerfile2 Dockerfile3
 1007* vim Dockerfile3
 1008* docker build -t demo:v3 -f Dockerfile3 .
 1009  docker images
 1010  docker inspect -t demo:v2
 1011  docker inspect  demo:v2
 1012  docker inspect  demo:v1
 1013  vim Dockerfile
 1014  vim Dockerfile2
 1015* docker run -it demo:v3 bash
 1016* cp Dockerfile3 Dockerfile4
 1017* vim Dockerfile4
 1018* docker build -t demo:v4 -f Dockerfile4 .
 1019  docker images
 1020  cp Dockerfile4 Dockerfile5
 1021  vim Dockerfile5
 1022  docker build -t demo:v5 -f Dockerfile5 .
 1023  docker images
 1024  docker inspect demo:v5
 1025  docker inspect demo:v4
 1026  docker images
 1027  cp Dockerfile5 Dockerfile6
 1028  vim Dockerfile6
 1029  docker build -t demo:v6 -f Dockerfile6 .
 1030* vim nginx.conf
 1031* vim index.html
 1032* ls
 1033* cp Dockerfile6 Dockerfile7
 1034* vim Dockerfile7
 1035  vim Dockerfile6
 1036* docker build -t demo:v7 -f Dockerfile7 .
 1037* docker images
 1038  docker run -d -p 80:80 demo:v7
 1039* docker build -t pluhin31 -f Dockerfile7 .
 1040* /
 1041  docker build -t pluhin31/test:v7 -f Dockerfile7 .
 1042  docker push pluhin31/test:v7
 1043  docker search pluhin31
 1044* cd /tmp
 1045* mkdir test
 1046* cd test
 1047* git init
 1048* mc
 1049* mv Dockerfile7 Dockerfile
 1050* git add --all
 1051* git commit -m "Init commit"
 1052* git remote add origin git@github.com:pluhin/test.git
 1053* git push  -u  origin master
 1054  cd ../
```
