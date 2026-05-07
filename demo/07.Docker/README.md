```bash
 263  mkdir 07.Docker
  264  cd 07.Docker/
  265  # Add Docker's official GPG key:
  266  sudo apt update
  267  sudo apt install ca-certificates curl
  268  sudo install -m 0755 -d /etc/apt/keyrings
  269  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  270  sudo chmod a+r /etc/apt/keyrings/docker.asc
  271  # Add the repository to Apt sources:
  272  sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
  273  Types: deb
  274  URIs: https://download.docker.com/linux/ubuntu
  275  Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
  276  Components: stable
  277  Architectures: $(dpkg --print-architecture)
  278  Signed-By: /etc/apt/keyrings/docker.asc
  279  EOF
  280  sudo apt update
  281  docker ps
  282  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  283  sudo usermod -aG docker $USER
  284  cd 07.Docker/
  285  docker ps
  286  clear
  287  docker search nginx
  288  docker pull nginx
  289  docker inspect nginx
  290  docker history nginx
  291  docker run -d -p 80:80 --name webserver nginx:latest

  292  docker ps
  293  curl localhost
  294  docker logs webserver
  295  docker exec -it webserver bash
  296  docker stop  webserve
  297  docker stop  webserver
  298  docker rm webserver
  299  docker ps
  300  vim Dockerfile
  301  docker build --target base -t first_image:base --target zip -t first_image:zip .
  302  docker images
  303  vim 01.Docker
  304  docker build -t demo:1 -f 01.Docker .
  305  docker images
  306  docker inspect demo:1
  307  vim 02.Docker
  308  docker build -t demo:2 -f 02.Docker .
  309  docker images
  310  docker run -it demo:1 bash
  311  docker run -it demo:2 bash
  312  vim 03.Docker
  313  docker build -t demo:3 -f 03.Docker .
  314  docker images
  315  docker inspect demo:2
  316  docker inspect demo:3
  317  vim 04.Docker
  318  docker build -t demo:4 -f 04.Docker .
  319  docker images
  320  vim 05.Docker
  321  vim nginx.conf
  322  vim index.html
  323  vim nginx.conf
  324  vim 05.Docker
  325  docker build -t demo:5 -f 05.Docker .
  326  docker images
  327  nmpa
  328  nmap
  329  vim 06.Docker
  330  docker build -t demo:nmap -f 06.Docker .
  331  docker run -t demo:nmap -p 22 192.168..201.3
  332  docker run -t demo:nmap -p 22 192.168.201.3
  333  alias nmap "docker run -t demo:nmap"
  334  alias nmap="docker run -t demo:nmap"
  335  nmap  -p 22 192.168.201.3
  336  history
```
