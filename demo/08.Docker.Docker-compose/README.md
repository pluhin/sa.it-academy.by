## History commands 

```bash
  317  cd 02.Git/
  318  ls
  319  git branch
  320  git pull

  321  cp ../07.Docker/index.html
  322  cp ../07.Docker/index.html ./
  323  cp ../07.Docker/nginx.conf ./
  324  cp ../07.Docker/05.Dockerfile ./
  325  cat 05.Dockerfile
  326  mv 05.Dockerfile Dockerfile
  327  ls -l
  328  vim .github/workflows/build.yaml
  329  git add -all
  330  git add --all
  331  git commit -m "Add build image action"
  332  git push
  333  cd ../
  334  mkdir 08.Docker-compose
  335  cd 08.Docker-compose/
  336  ls
  337  mkdir {1..4}
  338  cd 1
  339  vim docker-compose.yaml
  340  docker compose up -d
  341  docker compose ps
  342  docker compose logs db
  343  docker compose logs drupal
  344  docker compose exec  db
  345  docker compose exec  db bash
  346  curl localhost:8000
  347  cat docker-compose.yaml
  348  docker compose restart drupal
  349  docker compose down --volumes
  350  cd ../
  351  cd 2/
  352  vim docker-compose.yaml
  353  cp ../../02.Git/Dockerfile ./
  354  cp ../../02.Git/index.html ./
  355  cp ../../02.Git/nginx.conf ./
  356  ls
  357  vim docker-compose.yaml
  358  docker compose up -d
  359  curl localhost:8001
  360  curl localhost:8002
  361  docker compose down --volumes
  362  cd ../
  363  cd 3/
  364  ls
  365  vim docker-compose.yaml
  366  mkdir app
  367  vim app/index.html
  368  ls -l
  369  vim docker-compose.yaml
  370  sudo apt update
  371  sudo apt install nfs-kernel-server
  372  mkdir /tmp/data/
  373  vim /tmp/data/index.html
  374  sudo vim /etc/exports
  375  sudo exportfs -a
  376  docker comose up -d
  377  docker compose up -d
  378  curl -S localhost:81
  379  curl -S localhost:8100
  380  vim docker-compose.yaml
  381  docker compose down --volumes
  382  ls -l /tmp/data/
  383  cd ../4/
  384  ls
  385  vim docker-compose.yaml
  386  vim .env
  387  docker compose up -d
  388  vim docker-compose.yaml
  389  history
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
