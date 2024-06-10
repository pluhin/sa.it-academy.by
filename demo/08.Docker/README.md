
- https://jfrog.it-academy.by/
- https://github.com/pluhin/docker_build/blob/master/.github/workflows/build.yaml
- https://github.com/pluhin/docker_images


```bash
  412  cd 08.Docker/
  413  cp ../07.Docker/06.Dockerfile .
  414  ls
  415  docker build -t jfrog.it-academy.by/public/nmap:7 -f 06.Dockerfile .
  416  docker images
  417  docker login jfrog.it-academy.by
  418  docker push jfrog.it-academy.by/public/nmap:7
  419  claer
  420  c
  421  mkdir {1..4}
  422  cd 1/
  423  vim docker-compose.yaml
  424  docker-compose
  425  docker compose
  426  docker compose --version
  427  docker compose version
  428  docker-compose
  429  docker compose up -d
  430  docker ps
  431  top
  432  c
  433  docker compose logs db
  434  docker compose logs drupal
  435  curl http://localhost:8000
  436  docker compose logs drupal
  437  vim docker-compose.yaml
  438  docker compose exec db
  439  docker compose exec db bash
  440  vim docker-compose.yaml
  441  docker compose exec db bash
  442  docker compose restart drupal
  443  docker compose down --volumes
  444  cd ../2/
  445  vim docker-compose.yaml
  446  vim Dockerfile
  447  cp ../../07.Docker/index.html .
  448  cp ../../07.Docker/nginx.conf .
  449  ls -l
  450  vim docker-compose.yaml
  451  docker compose up -d
  452  docker ps
  453  curl -I http://localhost:8001
  454  curl -I http://localhost:8002
  455  curl -S http://localhost:8002
  456  curl -S http://localhost:8001
  457  cd ../3/
  458  cd ../2
  459  docker compose down --volumes
  460  cd ../3
  461  vim docker-compose.yaml
  462  mkdir app
  463  vim index.html
  464  ls -l
  465  mv index.html app/
  466  ls -la
  467  vim docker-compose.yaml
  468  mkdir /tmp/data
  469  vim /tmp/data/index.html
  470  sudo apt install nfs
  471  sudo apt install nfs-kernel-server
  472  sudo vim /etc/exports
  473  sudo exportfs -a
  474  sudo exportfs -iv localhost:/tmp/data
  475  docker compose up -d
  476  docker ps
  477  curl -S localhost:81
  478  curl -S localhost:8100
  479  vim docker-compose.yaml
  480  docker compose down --volumes
  481  cd ../4
  482  ls
  483  vim docker-compose.yaml
  484  vim .env
  485  docker compose up -d
  486  vim docker-compose.yaml
  487  docker compose down --volumes
  488  history
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


## Tunnel

```bash
ssh -L 8000:127.0.0.1:8000 user@192.168.204.85 -f -N
```