```bash
 343  mkdir 08.Docker
  344  cd 08.Docker/
  345  ls
  346  cd ../
  347  cd 02.Git/
  348  ls
  349  git branch
  350  rm -rf actions-runner/
  351  rm init_runner.sh
  352  git status
  353  cp ../07.Docker/05.Dockerfile ./Dockerfile
  354  cp ../07.Docker/index.html ./
  355  cp ../07.Docker/nginx.conf ./
  356  ls
  357  vim Dockerfile
  358  mkdir -p .github/workflows/build.yaml
  359  rm -rf .github/workflows/build.yaml
  360  vim .github/workflows/
  361  vim .github/workflows/build.yaml
  362  git add --all
  363  git commit -m "Add docker file"
  364  git push
  365  vim .github/workflows/build.yaml
  366  cd ../08.Docker/
  367  ls
  368  cp ..//07.Docker/06.Dockerfile ./Dockerfile
  369  ls
  370  cat Dockerfile
  371  docker build -t jfrog.it-academy.by/public/nmap:11 -f 06.Dockerfile .
  372  docker build -t jfrog.it-academy.by/public/nmap:11 -f Dockerfile .
  373  docker login
  374  docker login jfrog.it-academy.by
  375  docker push jfrog.it-academy.by/public/nmap:11
  376  mkdir {1..4}
  377  cd 1/
  378  ls
  379  vim docker-compose.yaml
  380  docker compose up -d
  381  docker ps
  382  docker compose logs db
  383  docker compose logs drupal
  384  clear
  385  curl -S localhost:8000
  386  cat docker-compose.yaml
  387  docker compose restart drupal
  388  docker compose down --volumes
  389  cd ../2/
  390  ls
  391  vim docker-compose.yaml
  392  cp ../../02.Git/Dockerfile ./
  393  cp ../../02.Git/index.html ./
  394  cp ../../02.Git/nginx.conf ./
  395  ls -l
  396  vim docker-compose.yaml
  397  docker compose up -d
  398  curl -S localhost:8001
  399  curl -S localhost:8002
  400  docker ps
  401  docker compose down --volumes
  402  cd ../3/
  403  vim docker-compose.yaml
  404  mkdir app
  405  vim app/index.html
  406  vim docker-compose.yaml
  407  mkdir /tmp/data
  408  vim /tmp/data/index.html
  409  sudo apt install nfs-kernel-server
  410  sudo vim /etc/exports
  411  sudo exportfs -a
  412  docker compose up -d
  413  docker ps
  414  curl -S localhost:81
  415  cat app/index.html
  416  curl -S localhost:8100
  417  docker compose down
  418  cd ..
  419  vim docker-compose.yaml
  420  vim .env
  421  vim docker-compose.yaml
  422  docker compose up -d
  423  docker ps
  424  docker compose down --volumes
  425  history
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