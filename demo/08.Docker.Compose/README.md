```bash
  339  cp ../07.Docker/05.Docker ./
  340  cp ../07.Docker/index.html ./
  341  cp ../07.Docker/nginx.conf ./
  342  vim 05.Docker Dockerfile
  343  mv 05.Docker Dockerfile
  344  ls
  345  vim .github/workflows/build.yaml
  346  git add --all
  347  git commit -m "Add build image"
  348  git push 
  349  mkdir {1..4}
  350  cd 1
  351  ls
  352  vim docker-compose.yaml
  353  docker compose up -d
  354  docker ps
  355  docker compose exec durpal bash
  356  docker compose exec drupal bash
  357  docker compose exec db bash
  358  docker compose restart drupal
  359  cat docker-compose.yaml 
  360  docker compose down --volumes
  361  cd ../
  362  cd 2
  363  vim docker-compose.yaml
  364  cp ../Dockerfile ./
  365  cp ../index.html ./
  366  cp ../nginx.conf ./
  367  docker compose up -d
  368  docker compose ps
  369  crul -I localhost:8001
  370  curl -I localhost:8001
  371  curl -I localhost:8002
  372  docker compose down 
  373  cd ../
  374  cd 3
  375  ls
  376  mkdir app
  377  vim app/index.html
  378  vim docker-compose.yaml
  379  mkdir /tmp/data
  380  vim /tmp/data/index.html
  381  sudo apt update
  382  sudo apt install nfs-kernel-server 
  383  sudo vim /etc/exports 
  384  sudo exportfs 
  385  docker compose up -d
  386  ls -l /tmp/
  387  chmod +w /tmp/data/
  388  docker compose up -d
  389  ls -l /tmp/
  390  chmod a+a /tmp/data/
  391  chmod +a /tmp/data/
  392  chmod +a /tmp/data
  393  chmod 777 /tmp/data/
  394  chmod 777 /tmp/data
  395  ls -l /tmp/
  396  docker compose up -d
  397  sudo service nfs-kernel-server restart
  398  docker compose up -d
  399  scat docker-compose.yaml 
  400  cat docker-compose.yaml 
  401  curl -S localhost:81
  402  curl -S localhost:8100
  403  docker comose down --volumes 
  404  docker comose down --volume
  405  docker comose down --volumes
  406  docker compose down --volumes
  407  cd ../4
  408  ls
  409  vim  docker-compose.yaml 
  410  vim .env
  411  docker compose up -d
  412  ls -l
  413  ls -la
  414  history 
  415  cd ../
  416  history > README.md
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