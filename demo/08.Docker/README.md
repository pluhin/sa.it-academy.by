```
  439  mkdir 08.Docker
  440  cd 08.Docker/
  441  cp ../07.Docker/06.Dockerfile ./Dockerfile
  442  cat Dockerfile
  443  c
  444  docker build -t jfrog.it-academy.by/public/nmap:3 .
  445  docker images
  446  docker login jfrog.it-academy.by
  447  docker push jfrog.it-academy.by/public/nmap:3
  448  docker pull ghcr.io/pluhin/docker_build:4
  449  mkdir {1..4}
  450  cd 1/
  451  ls
  452  vim docker-compose.yaml
  453  curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  454  sudo curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  455  ls -l /usr/local/bin/docker-compose
  456  sudo chmod +x  /usr/local/bin/docker-compose
  457  ls -l /usr/local/bin/docker-compose
  458  docker-compose --version
  459  docker-compose up
  460  docker-compose up -d
  461  docker-compose logs drupal
  462  docker-compose logs db
  463  docker-compose restart drupal
  464  docker-compose down --volumes
  465  cd ../2
  466  ls -l
  467  vim docker-compose.yaml
  468  cp ../../07.Docker/05.Dockerfile ./Dockerfile
  469  cat Dockerfile
  470  cp ../../07.Docker/index.html ./
  471  cp ../../07.Docker/nginx.conf ./
  472  ls -l
  473  vim docker-compose.yaml
  474  vim Dockerfile
  475  docker-compose up -d
  476  docker ps
  477  curl -I http://127.0.0.1:8001
  478  curl -I http://127.0.0.1:8002
  479  docker-compose exec service service01
  480  docker-compose exec service service_01
  481  docker-compose exec service service_01 sh
  482  docker-compose exec service01 sh
  483  docker-compose exec service_01 sh
  484  docker-compose down
  485  cd ../
  486  cd 3
  487  cat ../1/docker-compose.yaml
  488  vim docker-compose.yaml
  489  mkdir app
  490  vim app/index.html
  491  vim docker-compose.yaml
  492  sudo mkdir /opt/dc/
  493  sudo vim /opt/dc/index.html
  494  sudo apt update
  495  sudo vim /etc/exports
  496  sudo exportfs -a
  497  sudo exportfs -v
  498  vim docker-compose.yaml
  499  ip addr
  500  docker-compose up -d
  501  docker ps
  502  vim docker-compose.yaml
  503  curl -S http://127.0.0.1:81
  504  curl -S http://127.0.0.1:8100
  505  docker-compose down
  506  cd ../04
  507  cd ../4
  508  vim docker-compose.yaml
  509  vim .env
  510  vim docker-compose.yaml
  511  docker-compose up -d
  512  links http://127.0.0.1:8000
  513  hiso
  514  history
```

https://github.com/pluhin/build_sa

vim /etc/exports

```
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/opt/dc     *(rw,sync,no_subtree_check)
```