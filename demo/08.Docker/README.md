## Docker

https://github.com/pluhin/docker_build

https://github.com/pluhin/docker_images


```
  440  mkdir 08.Docker
  441  cd 08.Docker/
  442  cd ../
  443  cd 07.Docker/
  444  ls
  445  cd ../
  446  cd 08.Docker/
  447  cd
  448  cd 08.Docker/
  449  cp ../07.Docker/06.Dockerfile Dockerfile
  450  vim Dockerfile
  451  docker build -t jfrog.it-academy.by/public/nmap:4
  452  docker build -t jfrog.it-academy.by/public/nmap:4 .
  453  docker push jfrog.it-academy.by/public/nmap:4
  454  docker login
  455  docker login jfrog.it-academy.by
  456  docker push jfrog.it-academy.by/public/nmap:4
  457  docker build -t jfrog.it-academy.by/public/nmap:5
  458  docker build -t jfrog.it-academy.by/public/nmap:5 .
  459  docker push jfrog.it-academy.by/public/nmap:5
  460  mkdir {1..4}
  461  ls
  462  cd 1
  463  ls
  464  vim docker-compose.yaml
  465  curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  466  sudo curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  467  ls -l /usr/local/bin/docker-compose
  468  chmod a+x /usr/local/bin/docker-compose
  469  sudo chmod a+x /usr/local/bin/docker-compose
  470  docker-compose
  471  docker-compose --version
  472  docker-compose up
  473  docker-compose up -d
  474  docker ps
  475  docker-compose drupal restart
  476  docker-compose restart drupal
  477  docker-compose exec drupal
  478  docker-compose exec drupal sh
  479  docker-compose exec db sh
  480  docker-compose down --volumes
  481  clear
  482  cd ../2
  483  ls
  484  vim docer-compose.yaml
  485  mc
  486  mv docer-compose.yaml docker-compose.yaml
  487  mv 05.Dockerfile Dockerfile
  488  ls
  489  vim docker-compose.yaml
  490  docker-compose up -d
  491  docker ps
  492  vim docker-compose.yaml
  493  docker-compose down --volumes
  494  cd ../3
  495  ls
  496  vim docker-compose.yaml
  497  mkdir app
  498  cp ../2/index.html app/
  499  ls -la app/
  500  ls -la
  501  vim docker-compose.yaml
  502  vim app/index.html
  503  vim docker-compose.yaml
  504  ifco
  505  ip addr
  506  vim docker-compose.yaml
  507  mkdir /tmp/data
  508  vim /tmp/data/index.html
  509  sudo apt install nfs-kernel-server
  510  sudo vim /etc/exports
  511  sudo exportfs -a
  512  vim docker-compose.yaml
  513  docker-compose up -d
  514  docker-compose down --volumes
  515  cd ../4/
  516  vim docker-compose.yaml
  517  vim .env
  518  vim docker-compose.yaml
  519  docker-compose up -d
  520  vim docker-compose.yaml
  521  docker-compose down --volumes
  522  history
```

## NFS config

```bash
user@sa2-demo:~/08.Docker/4$ cat /etc/exports
# /etc/exports: the access control list for filesystems which may be exported
#		to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/tmp/data    *(rw,sync,no_subtree_check)
```