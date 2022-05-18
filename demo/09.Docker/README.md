# Docker

```bash 
  272  mkdir docker
  273  cd docker/
  274  ls
  275  sudo apt update
  276  sudo apt-get install     ca-certificates     curl     gnupg     lsb-release
  277  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  278  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  279    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  280  sudo apt update
  281  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  282  sudo usermod -aG docker $USER
  283  docker images
  284  docker version
  285  clear
  286  docker search nginx
  287  docker pull nginx
  288  docker run -p 80:80 --name webserver nginx:latest
  289  docker run -d -p 80:80 --name webserver nginx:latest
  290  docker rm webserver
  291  docker run -d -p 80:80 --name webserver nginx:latest
  292  docker ps
  293  watch date
  294  docker log webserver
  295  docker logs webserver
  296  docker logs webserver --follow
  297  docker exec -it webserver bash
  298  docker ps
  299  docker stop webserver
  300  docker rm $(docker ps -qa)
  301  vim index.html
  302  docker run -d -p 80:80 -v ./index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx:latest
  303  docker run -d -p 80:80 -v .index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx:latest
  304  docker run -d -p 80:80 -v index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx:latest
  305  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx:latest
  306  vim index.html
  307  docker stop webserver
  308  docker rm $(docker ps -qa)
  309  clear
  310  vim Dockerfile
  311  docker build -t first_image:v1.0 .
  312  docker images
  313  vim Dockerfile
  314  docker build --target zip -t first_image:zip --target base -t first_image:base .
  315  docker images
  316  docker inspect first_image:zip
  317  vim 01.Dockerfile
  318  docker build -t demo:1 -f 01.Dockerfile .
  319  docker images
  320  docker inspect demo:1
  321  vim 02.Dockerfile
  322  docker build -t demo:2 -f 02.Dockerfile .
  323  docker run -it demo:1 bash
  324  docker run -it demo:2 bash
  325  docker images
  326  vim 03.Dockerfile
  327  docker build -t demo:3 -f 03.Dockerfile .
  328  docker images
  329  docker inspect demo:3
  330  docker inspect demo:2
  331  vim 03.Dockerfile
  332  vim 04.Dockerfile
  333  docker build -t demo:4 -f 04.Dockerfile .
  334  docker images
  335  docker inspect demo:4
  336  vim 05.Dockerfile
  337  vim nginx.conf
  338  vim 05.Dockerfile
  339  docker build -t demo:5 -f 05.Dockerfile .
  340  docker images
  341  nmap
  342  nc
  343  vim 06.Dockerfile
  344  docker build -t my_nmap:1 -f 06.Dockerfile .
  345  docker images
  346  nmap
  347  docker run -t my_nmap:1 -p 20-23 192.168.100.100
  348  ls
  349  vim .bashrc
  350  source .bashrc
  351  nmap  -p 20-23 192.168.100.100
  352  vim 06.Dockerfile
  353  mc
  354  history
```

## Docker github action

https://github.com/pluhin/docker_build