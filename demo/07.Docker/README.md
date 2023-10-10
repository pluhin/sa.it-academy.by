## Docker

```bash
352  clear
  353  sudo apt-get update
  354  sudo apt-get install ca-certificates curl gnupg
  355  sudo install -m 0755 -d /etc/apt/keyrings
  356  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  357  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  358  # Add the repository to Apt sources:
  359  echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  360    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  361  sudo apt-get update
  362  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  363  sudo service docker status
  364  clear
  365  sudo groupadd docker
  366  sudo usermod -aG docker $USER
  367  clear
  368  docker ps
  369  docker search nginx
  370  docker pull nginx
  371  docker describe nginx
  372  docker inspect nginx
  373  clear
  374  docker images
  375  docker run --name webserver nginx
  376  docker run -p 80:80 --name webserver nginx
  377  docker rm 81892c3a68f895ac2f8fad1657d67ad3249c338d168934a138f7d15538b583aa
  378  docker run -p 80:80 --name webserver nginx
  379  docker rm cf90a51eb318370fa95aa6a8749bd3eccc5522ded0e5b20259072ada82de4f76
  380  docker run -p 80:80 --name webserver nginx
  381  docker run -p -d 80:80 --name webserver nginx
  382  docker run -d -p 80:80 --name webserver nginx
  383  docker rm 336b0946562b6ef3b072c4358a654c8b5a924f9885b089f8a6d919935d3bbf94
  384  docker run -d -p 80:80 --name webserver nginx
  385  docker ps
  386  docker logs webserver
  387  docker stop webserver
  388  docker rm webserver
  389  mkdir 07.Docker
  390  cd 07.Docker/
  391  ls
  392  cim Dockerfile
  393  vim Dockerfile
  394  docker build -t firs_image:v1.0 .
  395  docker images
  396  vim Dockerfile
  397  docker build --target zip -t first_image:zip --target base -t firs_image:base .
  398  docker images
  399  vim 01.Dockerfile
  400  docker build -t demo:1 -f 01.Dockerfile .
  401  docker images
  402  docker inspect demo:1
  403  vim 02.Dockerfile
  404  docker build -t demo:2 -f 02.Dockerfile .
  405  docker run -it demo:1 bash
  406  docker run -it demo:2 bash
  407  vim 03.Dockerfile
  408  docker build -t demo:3 -f 03.Dockerfile .
  409  cat 03.Dockerfile
  410  cat 02.Dockerfile
  411  docker images
  412  docker inspect demo:3
  413  docker inspect demo:2
  414  vim 04.Dockerfile
  415  docker build -t demo:4 -f 04.Dockerfile .
  416  docker inspect demo:4
  417  docker images
  418  vim index.html
  419  vim nginx.conf
  420  vim 05.Dockerfile
  421  docker build -t demo:5 -f 05.Dockerfile .
  422  docker run -p 80:80 demo:5
  423  clear
  424  docker images
  425  nc
  426  nmap
  427  clear
  428  vim 06.Dockerfile
  429  docker build -t demo:6 -f 06.Dockerfile .
  430  docker build -t nmap:first -f 06.Dockerfile .
  431  docker run -t nmap:first -p 22 192.168.201.1
  432  nmap
  433  vim ~/.bashrc
  434  source ~/.bashrc
  435  nmap -p 22 192.168.201.1
  436  vim 03.Dockerfile
  437  history
```