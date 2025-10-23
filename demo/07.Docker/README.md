## Install Docker

```bash
sudo apt-get update && \
sudo apt-get install -yqq ca-certificates curl && \
sudo install -m 0755 -d /etc/apt/keyrings && \
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
sudo chmod a+r /etc/apt/keyrings/docker.asc && \

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  && \
sudo apt-get update
```

## History

```bash
 250  mkdir 07.Docker
  251  cd 07.Docker/
  252  ls
  253  sudo apt-get update && sudo apt-get install -yqq ca-certificates curl && sudo install -m 0755 -d /etc/apt/keyrings && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && sudo chmod a+r /etc/apt/keyrings/docker.asc && echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  254    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  && sudo apt-get update
  255  sudo usermod -aG docker $USER
  256  cd 07.Docker/
  257  ls
  258  docker ps
  259  docker search nginx
  260  docker pull nginx
  261  docker images
  262  docker inspect nginx
  263  docker history nginx
  264  docker run -d -p 80:80 --name  webserver nginx:latest
  265  docker ps
  266  docker logs webserver
  267  curl localhost
  268  docker logs webserver
  269  docker exec -it webserver bash
  270  docker ps
  271  curl localhost
  272  ps au | grep  nginx
  273  ps aux | grep  nginx
  274  docker stop webserver
  275  docker rm webserver
  276  docker ps
  277  ls
  278  vim Dockerfile
  279  docker build --target base -t first_image:base --target zip -t first_image:zip .
  280  docker images
  281  vim 01.Dockerfile
  282  docker build -t demo:1 -d 01.Dockerfile .
  283  docker build -t demo:1 -f 01.Dockerfile .
  284  docker images
  285  docker inspect demo:1
  286  vim 02.Dockerfile
  287  docker build -t demo:2 -f 02.Dockerfile .
  288  docker images
  289  docker inspect demo:2
  290  docker run -it demo:1 bash
  291  docker run -it demo:2 bash
  292  vim 03.Dockerfile
  293  docker build -t demo:3 -f 03.Dockerfile .
  294  docker ps
  295  docker images
  296  docker inspect demo:3
  297  vim 04.Dockerfile
  298  docker build -t demo:4 -f 04.Dockerfile .
  299  docker images
  300  vim 05.Dockerfile
  301  vim index.html
  302  vim nginx.conf
  303  docker build -t demo:5 -f 05.Dockerfile .
  304  docker images
  305  clean
  306  clear
  307  nmap
  308  vim 06.Dockerfile
  309  docker build -t demo:6 -f 06.Dockerfile .
  310  docker build -t demo:nmap -f 06.Dockerfile .
  311  docker run -t demo:nmap -p 22 192.168.201.2
  312  namp
  313  alias nmap="docker run -t demo:nmap"
  314  nmap -p 22 192.168.201.2
  315  history
```