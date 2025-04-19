```bash
  277  mkdir 07.Docker
  278  cd 07.Docker/
  279  ls
  280  sudo apt-get update
  281  sudo apt-get install ca-certificates curl
  282  sudo install -m 0755 -d /etc/apt/keyrings
  283  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  284  sudo chmod a+r /etc/apt/keyrings/docker.asc
  285  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  286    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  287  sudo apt-get update
  288  sudo usermod -aG docker $USER
  289  cd 07.Docker/
  290  docker ps
  291  docker version
  292  docker search nginx
  293  docker pull nginx
  294  docker images
  295  docker inspect nginx
  296  docker run -d -p 80:80 --name webserver nginx:latest
  297  docker ps
  298  curl localhost:80 -S
  299  docker logs webserver
  300  docker stop webserver
  301  docker ps
  302  docker rm webserver
  303  docker rmi nginx:latest
  304  vim Dockerfile
  305  docker build --target base -t first_image:base --target zip -t first_image:zip
  306  docker build --target base -t first_image:base --target zip -t first_image:zip .
  307  vim Dockerfile
  308  docker build --target base -t first_image:base --target zip -t first_image:zip .
  309  docker images
  310  vim 01.Dockerfile
  311  docker images
  312  docker inspect demo:1
  313  docker history demo:1
  314  docker build -t demo:1 -f 01.Dockerfile
  315  docker build -t demo:1 -f 01.Dockerfile .
  316  docker build -t demo:2 -f 02.Dockerfile .
  317  clear
  318  docker run -it demo:1 bash
  319  docker run -it demo:2 bash
  320  vim 03.Dockerfile
  321  docker build -t demo:3 -f 03.Dockerfile .
  322  docker images
  323  docker inspect demo:2
  324  docker inspect demo:3
  325  vim 04.Dockerfile
  326  docker build -t demo:4 -f 04.Dockerfile .
  327  docker images
  328  vim 04.Dockerfile
  329  vim 05.Dockerfile
  330  vim index.html
  331  vim nginx.conf
  332  vim 05.Dockerfile
  333  docker build -t demo:5 -f 05.Dockerfile .
  334  docker images
  335  vim 06.Dockerfile
  336  nmap
  337  docker build -t nmap:1 -f 06.Dockerfile .
  338  docker run -t nmap:1
  339  docker run -t nmap:1 -p 22 192.168.201.1
  340  alias nmap="docker run -t nmap:1"
  341  nmap  -p 22 192.168.201.1
  342  history
```