## Docker compose


https://jfrog.it-academy.by/
https://github.com/pluhin/docker_build/blob/master/.github/workflows/build.yaml
https://github.com/pluhin/docker_images

```bash
  382  mkdir 08.Docker
  383  cd 08.Docker/
  384  cp ../07.Docker/06.Dockerfile ./
  385  ls
  386  docker build -t jfrog.it-academy.by/public/nmap:7 -f 06.Dockerfile .
  387  docker iamges
  388  docker images
  389  docker login
  390  docker login jfrog.it-academy.by
  391  docker push jfrog.it-academy.by/public/nmap:7
  392  docker tag jfrog.it-academy.by/public/nmap:7 jfrog.it-academy.by/public/nmap:9
  393  docker images
  394  docker push jfrog.it-academy.by/public/nmap:9
  395  mkdir {1..4}
  396  cd 1/
  397  ls
  398  vim docker-compose.yaml
  399*
  400  docker compose up -d
  401  docker compose ps
  402  vim docker-compose.yaml
  403  docker compose up -d
  404  docker compose ps
  405  vim docker-compose.yaml
  406  docker compose logs db
  407  docker compose logs druoal
  408  docker compose logs drupal
  409  docker compose restart drupal
  410  docker compose exec drupal
  411  docker compose exec drupal bash
  412  history
  413  curl http://localhost:8000
  414  docker compose down --volumes
  415  cd ../2
  416  ls
  417  vim docker-compose.yaml
  418  cp ../../07.Docker/index.html ./
  419  cp ../../07.Docker/05.Dockerfile ./Dockerfile
  420  cp ../../07.Docker/nginx.conf ./
  421  vim Dockerfile
  422  vim docker-compose.yaml
  423  docker compose up -d
  424  vim docker-compose.yaml
  425  curl localhost:8001
  426  curl localhost:8002
  427  docker compose down
  428  cd ../03
  429  cd ../3
  430  vim docker-compose.yaml
  431  mkdir app
  432  vim app/index.html
  433  vim docker-compose.yaml
  434  sudo apt install nfs-kernel-server
  435  mkdir /tmp/data
  436  vim /tmp/data/index.html
  437  vim /etc/exports
  438  sudo vim /etc/exports
  439  sudo exportfs -a
  440  ls
  441  docker compose up -d
  442  docke compose status
  443  docker compose status
  444  docker compose ps
  445  curl localhost:81
  446  curl localhost:8100
  447  l
  448  cd ../4
  449  ls
  450  cd ../3
  451  docker compose down
  452  cd ../4
  453  ls
  454  vim docker-compose.yaml
  455  vim .env
  456  vim docker-compose.yaml
  457  docker compose up
  458  docker compose down --volumes
  459  vim docker-compose.yaml
  460  docker compose up -d
  461  docker compose status
  462  docker compose ps
  463  docker compose logs db
  464  cat /proc/cpuinfo
  465  docker compose down --volumes
  466  vim docker-compose.yaml
  467  docker compose up -d
  468  docker compose down --volumes
  469  vim docker-compose.yaml
  470  docker compose up -d
  471  history
```
---
```
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
/tmp/data     *(rw,sync,no_subtree_check)
```
---
```
ssh -L 8000:127.0.0.1:8000 user@192.168.204.85 -f -N
```