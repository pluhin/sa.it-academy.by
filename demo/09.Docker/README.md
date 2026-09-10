## History

```bash
416  mkdir 09.Docker
  417  cd 09.Docker/
  418  ls
  419  docker --version
  420  sudo usermod -aG docker $USER
  421  clear
  422  cd 09.Docker/
  423  docker ps
  424  docker search nginx
  425  docker pull nginx
  426  docker inspect nginx
  427  docker history nginx
  428  docker run -d -p 80:80 --name webserver nginx:latest
  429  docker ps
  430  curl localhost
  431  docker logs webserver
  432  docker exec -it webserver bash
  433  docker ps
  434  docker stop webserver
  435  docker rm webserver
  436  docker ps
  437  ls
  438  vim Dockerfile
  439  docker build --target base -t first_image:base --target zip -t first_iamge:zip
  440  docker build --target base -t first_image:base --target zip -t first_iamge:zip .
  441  docker images
  442  vim 01.Docker
  443  docker build -t demo:1 -f 01.Docker .
  444  docker images
  445  docker inspect demo:1
  446  vim 02.Docker
  447  docker build -t demo:2 -f 02.Docker .
  448  docker images
  449  docker run -it demo:1 bash
  450  docker run -it demo:2 bash
  451  vim 03.Docker
  452  docker build -t demo:3 -f 03.Docker .
  453  docker images
  454  docker inspect demo:3
  455  docker inspect demo:2
  456  vim 04.Docker
  457  docker build -t demo:4 -f 04.Docker .
  458  docker images
  459  vim 05.Docker
  460  vim nginx.conf
  461  vim index.html
  462  docker build -t demo:5 -f 05.Docker .
  463  docker images
  464  vim 06.Docker
  465  nmap
  466  docker build -t demo:nmap -f 06.Docker .
  467  docker run -t demo:nmap -p 22 192.168.201.1
  468  alias nmap="docker run -t demo:nmap"
  469  nmap -p 22 192.168.201.1
  470  ls
  471  cd ../
  472  cd 02.Git/
  473  ls
  474  git branch
  475  git checkout master
  476  vim .github/workflows/build.yaml
  477  git add --all
  478  git commit -m "Add build image"
  479  git push
  480  git remote rename origin origin_gitlab
  481  git remote rename origin-github origin
  482  git push -u origin --all
  483  cp ../09.Docker/06.Docker ./Dockerfile
  484  cp ../09.Docker/index.html ./
  485  cp ../09.Docker/nginx.conf ./
  486  ls -l
  487  git add --all
  488  git commit -m "Add missing files"
  489  git push
  490  history
```