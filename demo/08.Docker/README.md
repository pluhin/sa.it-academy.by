# Docker. Docker compose

```bash
  281  mkdir 08.Docker
  282  cd 08.Docker/
  283  ls -l
  284  cp ../07.Docker/06.Dockerfile ./Dockerfile
  285  ls
  286  docker build jfrog.it-academy.by/public/nmap:2 .
  287  docker build -t jfrog.it-academy.by/public/nmap:2 .
  288  docker login jfrog.it-academy.by
  289  docker images
  290  docker push jfrog.it-academy.by/public/nmap:2
  291  docker pull jfrog.it-academy.by/public/nmap:2
  292  mkdir {1..5}
  293  cd 1
  294  ls
  295  vim docker-compose.yaml
  296  wget https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64
  297  sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
  298  ls -l /usr/local/bin/docker-compose
  299  sudo chmod +x /usr/local/bin/docker-compose
  300  docker-compose --version
  301  docker-compose up
  302  docker-compose down --volumes
  303  docker-compose up
  304  docker-compose up -d
  305  docker-compose restart drupal
  306  docker-compose logs drupal
  307  docker-compose down --volumes
  308  cd ../
  309  cd 2/
  310  ls
  311  vim docker-compose.yaml
  312  cp ../../07.Docker/05.Dockerfile Dockerfile
  313  cp ../../07.Docker/nginx.conf ./
  314  cp ../../07.Docker/index.html ./
  315  ls
  316  cat Dockerfile
  317  docker-compose up -d
  318  vim docker-compose.yaml
  319  curl -I http://127.0.0.1:8001
  320  curl -I http://127.0.0.1:8002
  321  docker-compose ps
  322  docker-compose exec service01
  323  docker-compose exec service01 -- bash
  324  docker-compose exec service_01 -- bash
  325  docker-compose exec service_01 bash
  326  docker-compose exec service_01
  327  docker-compose exec -it service_01 -- bash
  328  docker-compose exec service_01  bash
  329  docker-compose exec service_01 bsh
  330  docker-compose exec service_01 sh
  331  docker-compose exec service_02 sh
  332  docker-compose down
  333  cd ../
  334  cd 3
  335  ls
  336  vim docker-compose.yaml
  337  mkdir app
  338  vim app/index.html
  339  vim docker-compose.yaml
  340  ip addr
  341  vim docker-compose.yaml
  342  mkdir /opt/dc
  343  sudo mkdir /opt/dc
  344  sudo vim /opt/dc/index.html
  345  sudo apt update
  346  sudo apt install nfs-kernel-server
  347  sudo apt install nfs-common
  348  sudo vim /etc/exports
  349  sudo exportfs -a
  350  sudo exportfs -v
  351  vim docker-compose.yaml
  352  docker-compose up -d
  353  docker-compose ps
  354  vim docker-compose.yaml
  355  docker-compose up -d
  356  vim docker-compose.yaml
  357  docker-compose up -d
  358  docker-compose ps
  359  curl -S http://127.0.0.1:8100
  360  curl -S http://127.0.0.1:81
  361  curl -S http://10.0.2.15:81
  362  curl -S http://10.0.2.15:8100
  363  docker-compose down --volumes
  364  ls -l /opt/dc/
  365  cd ../4/
  366  ls -l
  367  cp ../1/docker-compose.yaml ./
  368  vim docker-compose.yaml
  369*
  370  docker-compose up -d
  371  vim docker-compose.yaml
  372  docker-compose down --volumes
  373  history
```

vim /etc/exports

```conf
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/opt/dc     *(rw,sync,no_subtree_check)
```