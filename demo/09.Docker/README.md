## Docker

```bash
  321  mkdir 09.Docker
  322  cd 09.Docker/
  323  ls -l
  324  sudo apt-get remove docker docker-engine docker.io containerd runc
  325  sudo apt-get update
  326  sudo apt-get install     ca-certificates     curl     gnupg     lsb-release
  327  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  328    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  329  sudo apt-get update
  330  sudo mkdir -p /etc/apt/keyrings
  331  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  332  sudo apt-get update
  333  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  334  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  335  sudo usermod -aG docker $USER
  336  docker ps
  337  docker version
  338  cd 09.Docker/
  339  ls
  340  docker images
  341  docker search nginx
  342  docker search pluhin31
  343  docker pull nginx
  344  docker run -p 80:80 --name webserver nginx
  345  ip addr
  346  docker run -d -p 80:80 --name webserver nginx
  347  docker rm webserver
  348  docker run -d -p 80:80 --name webserver nginx
  349  docker ps
  350  docker logs webserver
  351  curl -S http://127.0.0.1
  352  docker logs webserver
  353  docker ps
  354  docker stop webserver
  355  docker rm webserver
  356  vim index.html
  357  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
  358  curl -S http://127.0.0.1
  359  docker stop webserver
  360  docker rm webserver
  361  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:rw --name webserver nginx
  362  docker exec -it webserver -- bash
  363  docker exec -it webserver bash
  364  vim index.html
  365  docker stop webserver
  366  docker rm webserver
  367  vim Dockerfile
  368  docker build -t first_image:v1.0 .
  369  docker images\
  370*
  371  docker build -t first_image:v1.0 .
  372  vim Dockerfile
  373  docker build --target zip -t first_image:zip --target base -t first_image:base .
  374  docker images
  375  vim 01.Dockerfile
  376  docker build -t demo:1 -f 01.Dockerfile .
  377  docker images
  378  docker inspect demo:1
  379  vim 02.Dockerfile
  380  docker build -t demo:2 -f 02.Dockerfile .
  381  docker images
  382  docker inspect demo:2
  383  docker run -it demo:1 bash
  384  docker run -it demo:2 bash
  385  docker ps
  386  vim 03.Dockerfile
  387  docker run -it demo:3 bash
  388  docker build -t demo:3 -f 03.Dockerfile .
  389  docker images
  390  docker inspect demo:3
  391  vim 04.Dockerfile
  392  docker build -t demo:4 -f 04.Dockerfile .
  393  docker inspect demo:4
  394  docker images
  395  vim 06.Dockerfile
  396  vim 05.Dockerfile
  397  vim nginx.conf
  398  docker build -t demo:5 -f 05.Dockerfile .
  399  docker images
  400  docker run -d -p 80:80 --name nginx-test demo:5
  401  docker ps
  402  curl -S http://127.0.0.1
  403  docker stop nginx-test
  404  docker remove nginx-test
  405  docker rm nginx-test
  406  nmap
  407  vim 06.Dockerfile
  408  docker build -t my_nmap:1 -f 06.Dockerfile .
  409  docker imags
  410  docker image
  411  docker images
  412  docker run -t my_nmap:1
  413  docker run -t my_nmap:1 -p 20-23 192.168.1.100
  414  vim ~/.bashrc
  415  source ~/.bashrc
  416  nmap -p 20-23 192.168.1.100
  417  docker build -t jfrog.it-academy.by/public/nmap:1 -f 06.Dockerfile .
  418  docker images
  419  docker login jfrog.it-academy.by
  420  docker push jfrog.it-academy.by/public/nmap:1
  421  history \
```

`alias nmap='docker run -t my_nmap:1'`

## Docker github action

https://github.com/pluhin/docker_build