```bash
10745  docker --version
10746  git pull
10747  cd  demo
10748  mkdir 05.Docker
10749  cd 05.Docker
10750  ls
10751  clear
10752  docker search httpd
10753  docker pull httpd
10754  docker images
10755  docker rmi $(docker images -q)
10756  docker stop $(docker ps -aq)
10757  docker rm $(docker ps -aq)
10758  docker rmi $(docker images -q)
10759  docker pull httpd
10760  docker images
10761  docker rmi $(docker images -q)
10762  docker rmi $(docker images -q) -f
10763  docker images
10764  docker pull httpd
10765  docker run -d -p 80:80 httpd
10766  docker run -d -p 81:80 httpd
10767  docker ps 
10768  curl -I http://localhost:81
10769  ps aux | grep http
10770  ps aux | grep httpd
10771  docker ps 
10772  docker exec -it deb6e53cf307 bash
10773  docker ps
10774  docker kill deb6e53cf307
10775  docker rm deb6e53cf307
10776  cd /tmp
10777  mkdir html
10778  vim html/index.html
10779  docker run -d -p 81:80 -v /tmp/html:/var/www/html httpd
10780  docker ps 
10781  docker exec -it ba19c0545402 bash
10782  docker kill ba19c0545402 
10783  docker run -d -p 81:80 -v /tmp/html:/usr/local/apache2/htdocs httpd
10784  date >> html/index.html
10785  docker ps
10786  docker kill 5172ce1e6268
10787  cat html/index.html
10788  cd  ~/Documents/git_repos/home/sa.it-academy.by
10789  cd  demo/05.Docker
10790  vim Dockerfile
10791  docker build .
10792  docker inspect 5b985bcf9e13
10793  docker build -t first_imeage:v1.0.0 .
10794  docker images
10795  docker build -t first_imeage:v1.1.0 .
10796  docker images
10797  vim Dockerfile
10798  docker build --target base -t multi/base:v1.0 .
10799  docker build --target zip -t multi/zip:v1.0 .
10800  docker ps
10801  docker images
10802  docker build --target base -t multi/base:v1.0 --target zip -t multi/zip:v1.0 . 
10803  vim 01.Dockerfile
10804  docker build -it demo:1 .
10805  docker build -t demo:1 -f 01.Dockerfile .
10806* iwconfig wlp2s0| grep "Bit "
10807  docker ps 
10808  docker images
10809  vim 02.Dockerfile
10810  vim 01.Dockerfile
10811  vim 02.Dockerfile
10812  docker build -t demo:2 -f 02.Dockerfile .
10813  docker images
10814  meld 01.Dockerfile 02.Dockerfile
10815  vim 03.Dockerfile
10816  docker build -t demo:3 -f 03.Dockerfile .
10817  docker inspect demo:2
10818  docker inspect demo:3
10819  vim 03.Dockerfile
10820  docker images
10821  vim 04.Dockerfile
10822  docker build -t demo:4 -f 04.Dockerfile .
10823  docker inspect demo:4
10824  docker images
10825  vim index.html
10826  vim nginx.conf
10827  vim 05.Dockerfile
10828  docker build -t demo:5 -f 05.Dockerfile .
10829  docker run -d -p 81:80 demo:5
10830  docker ps
10831  docker kill 96309f74022a
10832  docker images
10833  vim 05.Dockerfile
10834  docker build -t pluhin31/test_sa:test -f 05.Dockerfile .
10835  docker build -t pluhin31/test_sa_1:test -f 05.Dockerfile .
10836  docker push pluhin31/test_sa_1:test
10837  docker search pluhin31/test_sa_1
10838  docker search pluhin31/test_sa
10839  docker search pluhin31
10840  vim  ../../../docker-ansible/Dockerfile
10841  vim  ../../../docker-cent-yum/Dockerfile
10842  history| grep "centos"
10843  history| grep "yum"
```