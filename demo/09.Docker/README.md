```bash
11495  cd ../
11496  mkdir 09.Docker
11497  cd 09.Docker
11498  ls
11499  docker version
11500  docker info
11501  docker search nginx
11502  docker pull nginx
11503  docker images
11504  docker run -p 81:80 --name webserver nginx:latest
11505  docker run -d -p 81:80 --name webserver nginx:latest
11506  docker rm a3410e05ecda
11507  docker run -d -p 81:80 --name webserver nginx:latest
11508  docker ps
11509  docker container logs webserver
11510  docker exec -it webserver bash
11511  docker ps
11512  curl -s localhost:81 
11513  docker -
11514  docker --help
11515  docker run --help
11516  docker stop webserver
11517  curl -s localhost:81 
11518  docker ps
11519  docker rm $(docker ps -aq)
11520  ls
11521  vim index.html
11522  docker run -d -p 81:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
11523  vim index.html
11524  docker stop webserver
11525  docker rm $(docker ps -aq)
11526  docker run -d -p 81:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
11527  docker stop webserver
11528  docker run -d -p 81:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
11529  docker stop webserver
11530  docker rm $(docker ps -aq)
11531  vim Dockerfile
11532  docker build -t first_image:v1.2.0 .
11533  docker images
11534  docker inspect first_image:v1.2.0
11535  vim Dockerfile
11536  docker build --target zip -t first_image:zip  --target base -t first_image:base .
11537  docker inspect first_image:zip
11538  vim 01.Dockerfile
11539  docker build -t demo:1 -f 01.Dockerfile .
11540  docker images
11541  docker inspect demo:1
11542  vim 02.Dockerfile
11543  docker build -t demo:2 -f 02.Dockerfile .
11544  docker images
11545  docker run -it demo:1 bash
11546  docker run -it demo:2 bash
11547  vim 03.Dockerfile
11548  docker build -t demo:3 -f 03.Dockerfile .
11549  docker images
11550  docker inspect demo:3
11551  vim 04.Dockerfile
11552  docker build -t demo:4 -f 04.Dockerfile .
11553  docker images
11554  docker inspect demo:4
11555  vim 05.Dockerfile
11556  vim nginx.conf
11557  vim 05.Dockerfile
11558  docker build -t demo:5 -f 05.Dockerfile .
11559  docker ps
11560  docker images
11561  docker run -p 82:80 demo:5 --name web
11562  docker run -p 82:80 --name web demo:5
11563  vim 05.Dockerfile
11564  docker login
11565* docker search grafana
11566  docker build -t pluhin31/demo_sa:5 -f 05.Dockerfile .
11567  docker push pluhin31/demo_sa:5
11568  docker build -t jfrog.it-academy.by/public/demo_sa:10 -f 05.Dockerfile .
11569  docker images
11570  docker push jfrog.it-academy.by/public/demo_sa:10
11571  vim 06.Dockerfile
11572  docker build -t nmap:my -f 06.Dockerfile .
11573  docker image
11574  docker images
11575  docker run -t nmap:my -p 20-100 192.168.1.100
11576* cd /tmp
11577* git clone git@github.com:pluhin/test_build.git
11578* cd test
11579* cd ../test_build
11580* ls
11581* vim index.html
11582* git add --all
11583* git commit -m "Demo"
11584* git push
11585* docker search grafana

```
