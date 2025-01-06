## Docker compose

```bash
 382  mkdir 08.Docker
  383  cd 08.Docker/
  384  cp ../07.Docker/06.Dockerfile ./
  385  ls
  386  docker build -t jfrog.it-academy.by/public/nmap:10 -f 06.Dockerfile .
  388  docker images
  389  docker login
  390  docker login jfrog.it-academy.by

  394  docker push jfrog.it-academy.by/public/nmap:9


326  mkdir 08.Docker
  327  cd 08.Docker/
  328  mkdir {1..4}
  329  cd 1/
  330  ls
  331  vim docker-compose.yaml
  332  docker comose up -d
  333  docker compose up -d
  334  docker ps
  335  docker compose logs db
  336  docker compose logs drupal
  337  vim docker-compose.yaml
  338  docker compose restart drupal
  339  docker compose exec drupal bash
  340  curl http://localhost:8000
  341  vim docker-compose.yaml
  342  docker compose restart db
  343  docker compose down -volumes
  344  docker compose down --volumes
  345  docker compose up -d
  346  docker ps
  347  docker compose logs db
  348  cd 07.Docker/
  349  cd 1
  350  ls
  351  cd ../08.Docker/1/
  352  vim docker-compose.yaml
  353  docker compose down --volumes
  354  docker compose up -d
  355  docker ps
  356  top
  357  vim docker-compose.yaml
  358  docker compose down --volumes
  359  cd ../
  360  cp ../07.Docker/index.html ./
  361  cp ../07.Docker/nginx.conf ./
  362  cp ../07.Docker/05.Dockerfile ./Dockerfile
  363  ls
  364  cd 2
  365  mv ../Dockerfile ./
  366  mv ../index.html ./
  367  mv ../nginx.conf ./
  368  ls
  369  vim docker-compose.yaml
  370  docker compose up -d
  371  docker ps
  372  curl localhost:8001
  373  curl localhost:8002
  374  docker compose down --volumes
  375  vim docker-compose.yaml
  376  cat Dockerfile
  377  ls -l
  378  docker ps
  379  cd ./
  380  cd ../
  381  cd 3/
  382  ls
  383  mkdir app
  384  vim app/index.html
  385  vim docker-compose.yaml
  386  mkdir /tmp/data
  387  vim /tmp/data/index.html
  388  sudo apt install nfs-kernel-server
  389  vim /etc/exports
  390  sudo vim /etc/exports
  391  sudo export -a
  392  sudo exportfs -a
  393  docker compose up -d
  394  docker ps
  395  curl localhost:81
  396  curl localhost:8100
  397  docker compose down --volumes
  398  cd ../
  399  docker compose up -d -f 3/docker-compose.yaml
  400  docker compose up -d 3/docker-compose.yaml
  401  docker compose -f 3/docker-compose.yaml up -d
  402  curl localhost:81
  403  docker compose down --volumes
  404  cd ../
  405  cd 08.Docker/3/
  406  vim docker-compose.yaml
  407  cd ../
  408  cd 4/
  409  vim .env
  410  vim docker-compose.yaml
  411  docker compose up -d
  412  cat .ev
  413  ls
  414  ls -la
  415  vim .env
  416  vim docker-compose.yaml
  417  history
```
---
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
/tmp/data     *(rw,sync,no_subtree_check)
```
---
```bash
ssh -L 8000:127.0.0.1:8000 user@192.168.204.85 -f -N
```