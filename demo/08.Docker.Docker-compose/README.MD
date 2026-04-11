```bash
377  cd 02.Git/
  378  ls
  379  cp ../07.Docker/05.Dockerfile ./
  380  cp ../07.Docker/index.html ./
  381  cp ../07.Docker/nginx.conf ./
  382  vim 05.Dockerfile
  383  mv 05.Dockerfile Dockerfile
  384  vim .github/workflows/build.yaml
  385  git add -all
  386  git add --all
  387  git commit -m "Add docker build"
  388  git push
  389  cd ../
  390  ls
  391  mkdir 08.Docker.Docker-compose
  392  cd 08.Docker.Docker-compose/
  393  ls
  394  mkdir {1..4}
  395  cd 1
  396  ls
  397  vim docker-compose.yaml
  398  docker compose -d up .
  399  docker compose -d up
  400  docker compose up -d
  401  docker compose ps
  402  cat docker-compose.yaml
  403  docker compose ps
  404  docker compose exec drupal
  405  docker compose exec drupal bash
  406  docker compose logs drupal
  407  docker compose restart drupal
  408  docker compose down --volumes
  409  cd ../
  410  cd 2
  411  ls
  412  cat docker-compose.yaml
  413  vim docker-compose.yaml
  414  cp ../../02.Git/Dockerfile ./
  415  cp ../../02.Git/nginx.conf ./
  416  cp ../../02.Git/index.html ./
  417  vim docker-compose.yaml
  418  docker compose up -d
  419  curl localhost:8001
  420  curl localhost:8002
  421  docker compose ps
  422  docker compose down --volumes
  423  ../
  424  cd ../
  425  cd 3/
  426  ls
  427  vim docker-compose.yaml
  428  mkdir app
  429  vim app/index.html
  430  mkdir /tmp/data
  431  cp app/index.html /tmp/data/
  432  vim /tmp/data/index.html
  433  vim docker-compose.yaml
  434  sudo apt update
  435  sudo apt install nfs-kernel-server
  436  sudo vim /etc/exports
  437  sudo exportfs -a
  438  docker compose up -d
  439  docker ps
  440  docker stop 6be4f1c637a6
  441  docker compose up -d
  442  docker rm 6be4f1c637a66e4276583d913031572608e87791d4bef0be76101cd8abbf5b39
  443  docker compose up -d
  444  docker compose ps
  445  curl localhost:81
  446  curl localhost:8100
  447  vim docker-compose.yaml
  448  docker compose down --volumes
  449  vim /tmp/data/index.html
  450  cd ../4/
  451  ls
  452  vim docker-compose.yaml
  453  vim .env
  454  vim docker-compose.yaml
  455  docker compose up -d
  456  vim docker-compose.yaml
  457  vim .env
  458  history
```


## NFS config

```
user@sa2-demo:~/08.Docker-compose/4$ cat /etc/exports
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

## Tunnel command

```bash
ssh -L 8000:127.0.0.1:8000 user@192.168.204.85 -f -N
```