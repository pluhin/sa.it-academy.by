```bash
258  mkdir 07.Docker
  259  cd 07.Docker/
  260  ls
  261  sudo apt-get update
  262  sudo apt-get install ca-certificates curl -yqq
  263  sudo install -m 0755 -d /etc/apt/keyrings
  264  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  265  sudo chmod a+r /etc/apt/keyrings/docker.asc
  266  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  267    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  268  sudo apt-get update
  269  sudo usermod -aG docker $USER
  270  cd 07.Docker/
  271  docker ps
  272  clear
  273  docker version
  274  docker search nginx
  275  docker pull
  276  docker pull ngixn
  277  docker pull nginx
  278  docker images
  279  docker inspect nginx
  280  docker history nginx:latest
  281  docker run -d -p 80:80 --name webserver nginx:latest
  282  docker ps
  283  docker logs webserver
  284  curl localhost
  285  docker logs webserver
  286  ps
  287  ps aux | grep nginx
  288  docker exec webserver - bash
  289  docker exec webserver - sh
  290  docker exec webserver -- sh
  291  docker exec -it webserver - bash
  292  docker exec -it webserver -- bash
  293  docker exec -it webserver  bash
  294  docker exec -it webserver ыр
  295  docker exec -it webserver bash
  296  ps aux | grep nginx
  297  cat /etc/passwd
  298  clear
  299  docker stop webserver
  300  docker rm webserver
  301  vim Dockerfile
  302  docker build --target base -t first_image:base --target zip -t first_image:zip .
  303  vim Dockerfile
  304  docker images ps
  305  docker images
  306  vim 01.Dockerfile
  307  docker build -t demo:1 -f 01.Dockerfile .
  308  vim 01.Dockerfile
  309  docker build -t demo:1 -f 01.Dockerfile .
  310  docker images
  311  docker inspect demo:1
  312  vim 01.Dockerfile
  313  vim 02.Dockerfile
  314  vim 01.Dockerfile
  315  vim 02.Dockerfile
  316  docker build -t demo:2 -f 02.Dockerfile .
  317  docker inspect demo:2
  318  docker images
  319  docker run -it demo:1 bash
  320  docker run -it demo:2 bash
  321  vim 03.Dockerfile
  322  vim 02.Dockerfile
  323  vim 03.Dockerfile
  324* docker run -it demo:3 bash
  325  docker build -t demo:3 -f 03.Dockerfile .
  326  docker images
  327  vim 03.Dockerfile
  328  vim 04.Dockerfile
  329  vim 03.Dockerfile
  330  vim 04.Dockerfile
  331  docker build -t demo:4 -f 04.Dockerfile .
  332  docker images
  333  vim 04.Dockerfile
  334  vim 05.Dockerfile
  335  vim nginx.conf
  336  vim index.html
  337  docker build -t demo:5 -f 05.Dockerfile .
  338  docker images
  339  vim 06.Dockerfile
  340  nmap
  341  vim 06.Dockerfile
  342  docker build -t nmap:1 -f 06.Dockerfile .
  343  docker run -t nmap:1 -p 22 192.168.201.1
  344  alias nmap="docker run -t nmap:1"
  345  nmap  -p 22 192.168.201.1
  346  history
```