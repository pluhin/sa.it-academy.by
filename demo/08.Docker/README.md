```bash
 392  mkdir 08.Docker
  393  cd 08.Docker/
  394  ls
  395  cp ../07.Docker/06.Dockerfile .
  396  ls
  397  vim 06.Dockerfile
  398  docker build -t jfrog.it-academy.by/public/nmap:6 .
  399  docker build -t jfrog.it-academy.by/public/nmap:6 -f 06.Dockerfile .
  400  docker login jfrog.it-academy.by
  401  docker push jfrog.it-academy.by/public/nmap:6
  402  mkdir {1..4}
  403  ls
  404  cd 1
  405  vim docker-compose.yaml
  406  sudo curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  407  ls -l /usr/local/bin/docker-compose
  408  sudo chmod a+x /usr/local/bin/docker-compose
  409  docker-compose --version
  410  docker-compose up
  411  docker-compose up -d
  412  docker ps
  413  docker-compose logs db
  414  docker ps
  415  docker-compose logs drupal
  416  docker-compose logs drupal --follow
  417  docker-compose restart drupal
  418  docker-compose exec drupal bash
  419  docker-compose down --volumes
  420  clear
  421  cd  ../2
  422  ls
  423  vim docker-compose.yaml
  424  mc
  425  mv 05.Dockerfile Dockerfile
  426  ls
  427  cat Dockerfile
  428  vim docker-compose.yaml
  429  docker-compose up -d
  430  curl -I http://localhost:8001
  431  curl -I http://localhost:8002
  432  cd ../3
  433  vim docker-compose.yaml
  434  mkdir app
  435  vim app/index.html
  436  vim docker-compose.yaml
  437  mkdir /tmp/data/
  438  vim /tmp/data/index.html
  439  sudo vim /etc/exports
  440  sudo exportfs -a
  441  sudo exportfs -l
  442  sudo exportfs -i localhost:/tmp/data
  443  sudo exportfs -iv localhost:/tmp/data
  444  ls
  445  docker ps
  446  cd ../02
  447  cd ../2
  448  docker-compose down --volumes
  449  cd ../3
  450  docker-compose up -d
  451  vim docker-compose.yaml
  452  docker-compose down --volumes
  453  cd ../4/
  454  vim docker-compose.yaml
  455  vim .env
  456  vim docker-compose.yaml
  457  docker-compose up -d
  458  docker-compose down --volumes
  459  sudo update-alternatives --config editor
  460  history
```

## NFS config
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
/tmp/data    *(rw,sync,no_subtree_check)
```

## Tunnel

```
ssh -L 8000:127.0.0.1:8000 user@192.168.204.85 -f -N
```