```bash
  347  cd 02.Git/
  348  ls
  349  git add --all
  350  git commit -m "add docker build"
  351  git push
  352  git pull
  353  git config pull.rebase true
  354  git pull
  355  git push
  356  cd 02.Git/
  357  ls
  358  cp  ../07.Docker/index.html index.html
  359  cp ../07.Docker/nginx.conf nginx.conf
  360  git add --all
  361  git commit -m "add missing files"
  362  git push
  363  cd ../
  364  mkdir -p 08.Docker/{1..4}
  365  cd 08.Docker/
  366  cd 1
  367  ls
  368  vim docker-compose.yaml
  369  docker compose up -d
  370  docker ps
  371  vim docker-compose.yaml
  372  docker compose logs db
  373  docker compose logs drupal
  374  curl localhost:8000
  375  vim docker-compose.yaml
  376  docker compose exec db
  377  docker compose exec db bash
  378  vim docker-compose.yaml
  379  docker compose down --volumes
  380  cd ../
  381  cd
  382  cd 08.Docker/2/
  383  ls
  384  vim docke-compose.yaml
  385  cp ../../02.Git/Dockerfile ./
  386  cp ../../02.Git/index.html ./
  387  cp ../../02.Git/nginx.conf ./
  388  ls
  389  docker compose up -d
  390  mv docke-compose.yaml docker-compose.yaml
  391  docker compose up -d
  392  curl localhost:8001
  393  curl localhost:8002
  394  docker ps
  395  cd ../3/
  396  mkdir app
  397  vim app/index.html
  398  vim docker-compose.yaml
  399  mkdir /tmp/data/
  400  vim /tmp/data/index.html
  401  sudp apt update
  402  sudo apt update
  403  sudo apt install nfs-kernel-server
  404  sudo vim /etc/exports
  405  sudo exportfs -a
  406  docker compose up -d
  407  vim docker-compose.yaml
  408  curl -S localhost:81
  409  curl -S localhost:8100
  410  docker compose down --volumes
  411  cd ../4/
  412  vim docker-compose.yaml
  413  vim .env
  414  docker compose up -d
  415  vim docker-compose.yaml
  416  docker compose down --volumes
  417  history
```
---
```bash
$ cat /etc/exports
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