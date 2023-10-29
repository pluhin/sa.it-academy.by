

# Docker Compose for Application Stacks

```
  545  mkdir 08.Docker
  547  cd 08.Docker
  548  pwd
  552  cat docker-compose.yaml 
  553  sudo curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  554  ls -l /usr/local/bin/docker-compose
  555  sudo chmod a+x /usr/local/bin/docker-compose
  556  docker-compose --version
  558  sudo docker-compose up
  559  sudo docker-compose up -d
  560  docker ps
  561  sudo docker ps
  563  sudo docker-compose restart drupal
  566  sudo docker-compose exec drupal sh
  567  sudo docker-compose exec db sh
  569  nano docker-compose.yaml 
  570  cd ..
  571  mkdir 02
  572  cd 2
  574  nano docker-compose.yaml 
  577  sudo docker-compose up -d
  579  nano Dockerfile 
  580  sudo docker-compose up -d
  582  sudo docker ps
  584  sudo docker-compose up -d
  585  sudo chmod a+x /usr/local/bin/docker-compose
  586  ll /usr/local/bin/docker-compose
  632  cp 05.Dockerfile ~/08.Docker/2/
  633  cd ~/08.Docker/2/
  636  mv 05.Dockerfile Dockerfile 
  638  sudo docker-compose up
  639  sudo docker-compose down --volumes
  641  mkdir 3
  642  cd 3
  644  nano docker-compose.yaml 
  645  ip a
  647  nano docker-compose.yaml 
  648  mkdir /tmp/data
  650  nano /tmp/data/index.html
  651  sudo apt install nfs-kernel-server
  652  sudo nano /etc/exports
  653  sudo exportfs -a
  654  nano docker-compose.yaml 
  655  sudo docker-compose up -d
  656  sudo docker-compose down --volumes
  657  mkdir 4
  658  cd 4
  659  nano docker-compose.yaml
  660  nano .env
  671  sudo docker-compose up -d
```

# Docker build automation (github action)

```
  447  mkdir app
  448  cd app
  449  > hello-world.go
  450  nano hello-world.go
  451  > Dockerfile
  452  nano Dockerfile
  454  sudo docker build . --tag hello-world
  455  docker images
  456  sudo docker images
  459  sudo docker run hello-world
  501  docker images
  502  docker tag hello-world:latest ghcr.io/yurymn/hello-world:latest
  503  docker images
  504  docker push ghcr.io/yurymn/hello-world:latest
```

  Click on the container image published (which looks the same as a normal GitHub package) and then go to Package Settings. 
  In the Danger    Zone, click on change visibility and choose Public:
