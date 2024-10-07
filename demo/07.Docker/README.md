## Docker

```bash
  308  mkdir 07.Docker
  309  cd 07.Docker/
  310  ls
  311  sudo apt-get update
  312  sudo apt-get install ca-certificates curl
  313  sudo install -m 0755 -d /etc/apt/keyrings
  314  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  315  sudo chmod a+r /etc/apt/keyrings/docker.asc
  316  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  317    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  318  sudo apt-get update
  319  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  320  sudo usermod -aG docker $USER
  321  docker ps
  322  docker version
  323  docker search nginx
  324  git pull nginx
  325  docker pull nginx
  326  docker images
  327  docker inspect nginx:latest
  328  docker run --name webserver nginx:latest
  329  docker rm webserver
  330  docker run -d -p 80:80 --name webserver nginx:latest
  331  curl localhost:80 -S
  332  docker logs webserver
  333  docker ps
  334  docker stop webserver
  335  docker rm webserver
  336  docker ps
  337  docker rmi nginx:latest
  338  cd 07.Docker/
  339  vim Dockerfile
  340  docker build --target base -t first_image:base --target zip -t first_image:zip .
  341  docker images
  342  vim 01.Dockerfile
  343  docker build -t demo:1 -f 01.Dockerfile .
  344  docker imgages
  345  docker img
  346  docker images
  347  vim 02.Dockerfile
  348  docker build -t demo:2 -f 02.Dockerfile .
  349  docker images
  350  docker run -it demo:1 bash
  351  docker ps
  352  docker run -it demo:2 bash
  353  vim 03.Dockerfile
  354  docker build -t demo:3 -f 03.Dockerfile .
  355  docker images
  356  docker inspect demo:3
  357  docker inspect demo:2
  358  vim 03.Dockerfile
  359  vim 04.Dockerfile
  360  docker build -t demo:4 -f 04.Dockerfile .
  361  docker images
  362  vim 05.Dockerfile
  363  vim nginx.conf
  364  vim index.html
  365  docker build -t demo:5 -f 05.Dockerfile .
  366  docker images
  367  vim 03.Dockerfile
  368  vim 04.Dockerfile
  369  nc
  370  nmap
  371  vim 06.Dockerfile
  372  docker build -t demo:nmap -f 06.Dockerfile .
  373  docker run -t demo:nmap -p 22 192.168.202.1
  374  docker run -t demo:nmap
  375  clear
  376  nmpa
  377  nmap
  378  alias nmap="docker run -t demo:nmap"
  379  nmap -p 22 192.168.202.1
  380  history
```