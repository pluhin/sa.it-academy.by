```bash
257  mkdir 07.Docker
  258  cd 07.Docker/
  259  ls
  260  sudo apt-get update
  261  sudo apt-get install ca-certificates curl
  262  sudo install -m 0755 -d /etc/apt/keyrings
  263  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  264  sudo chmod a+r /etc/apt/keyrings/docker.asc
  265  cat /etc/apt/keyrings/docker.asc
  266  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  267    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  268  sudo apt-get update
  269  sudo usermod -aG docker $USER
  270  cd 07.Docker/
  271  docker ps
  272  docker search nginx
  273  docker pull nginx
  274  docker images
  275  docker inspect nginx:latest
  276  docker run -d -p 80:80 --name webserver nginx:latest
  277  docker rm webserver
  278  docker run -d -p 80:80 --name webserver nginx:latest
  279  docker ps
  280  curl localhost:80 -S
  281  docker logs webserver
  282  docker stop webserver
  283  docker rm webserver
  284  docker rmi nginx:latest
  285  history
  286  cd 07.Docker/
  287  htop
  288  vim Dockerfile
  289  docker build --target base -t first_image:base --target zip -t first_image:zip .
  290  vim Dockerfile
  291  docker build --target base -t first_image:base --target zip -t first_image:zip .
  292  docker images
  293  vim 01.Dockerfile
  294  docker build -t demo:1 -f 01.Dockerfile .
  295  vim 01.Dockerfile
  296  docker images
  297  vim 02.Dockerfile
  298  docker build -t demo:2 -f 02.Dockerfile .
  299  docker images
  300  docker run -it demo:1 bash
  301  docker run -it demo:2 bash
  302  vim 03.Dockerfile
  303  docker build -t demo:3 -f 03.Dockerfile .
  304  docker images
  305  docker inspect demo:2
  306  docker inspect demo:3
  307  vim 03.Dockerfile
  308  vim 04.Dockerfile
  309  docker build -t demo:4 -f 04.Dockerfile .
  310  docker images
  311  docker inspect demo:4
  312  vim 05.Dockerfile
  313  vim index.html
  314  vim nginx.conf
  315  vim index.html
  316  vim 05.Dockerfile
  317  docker build -t demo:5 -f 05.Dockerfile .
  318  docker images
  319  nc
  320  nmap
  321  vim 06.Dockerfile
  322  docker run -t demo:nmap -p 22 192.168.202.1
  323  alias nmap="docker run -t demo:nmap"
  324  nmap -p 22 192.168.202.1
  325  history

```