```bash
271  cd 07.Docker
  272  mkdir 07.Docker
  273  cd 07.Docker/
  274  ls
  275  # Add Docker's official GPG key:
  276  sudo apt update
  277  sudo apt install ca-certificates curl
  278  sudo install -m 0755 -d /etc/apt/keyrings
  279  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  280  sudo chmod a+r /etc/apt/keyrings/docker.asc
  281  # Add the repository to Apt sources:
  282  sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
  283  Types: deb
  284  URIs: https://download.docker.com/linux/ubuntu
  285  Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
  286  Components: stable
  287  Signed-By: /etc/apt/keyrings/docker.asc
  288  EOF
  289  sudo apt update
  290  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  291  sudo usermod -aG docker $USER
  292  cd 07.Docker/
  293  ls
  294  docker ps
  295  docker search nginx
  296  docker pull nginx
  297  docker inspect nginx
  298  docker history nginx
  299  docker run -d -p 80:80 --name webserver nginx:latest
  300  curl localhost -I
  301  curl localhost -s
  302  curl localhost -S
  303  docker logs webserver
  304  docker ps
  305  docker exec -it webserver bash
  306  ps aux | grep nginx
  307  docker stop webserver
  308  docker rm webserver
  309  docker ps
  310  ps aux | grep nginx
  311  ls
  312  vim Dockerfile
  313  docker build --target base -t first_image:base --target zip -t first_image:zip
  314  docker build --target base -t first_image:base --target zip -t first_image:zip .
  315  docker images
  316  vim 01.Docker
  317  docker build -t demo:1 -f 01.Docker .
  318  docker images
  319  docker inspect demo:1
  320  docker images
  321  vim 02.Docker
  322  docker build -t demo:2 -f 02.Docker .
  323  docker images
  324  docker inspect demo:1
  325  docker inspect demo:2
  326  docker run -it demo:1 bash
  327  docker run -it demo:2 bash
  328  vim 03.Docker
  329  docker build -t demo:3 -f 03.Docker .
  330  docker images
  331  docker inspect demo:3
  332  vim 04.Docker
  333  docker build -t demo:4 -f 04.Docker .
  334  docker images
  335  docker inspect demo:4
  336  vim 05.Dockerfile
  337  vim index.html
  338  vim nginx.conf
  339  vim 05.Dockerfile
  340  docker build -t demo:5 -f 05.Dockerfile .
  341  docker ps
  342  docker images
  343  vim 04.Dockerfile
  344  vim 04.Docker
  345  vim 06.Dockerfile
  346  docker build -t demo:nmap -f 06.Docker .
  347  docker build -t demo:nmap -f 06.Dockerfile .
  348  docker run -t demo:nmap
  349  docker run -t demo:nmap -p 22 192.168.201.3
  350  nmap
  351  alias nmap="docker run -t demo:nmap"
  352  nmap  -p 22 192.168.201.
  353  docker ps
  354  nmap  -p 22 192.168.201.3
  355  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
  356  curl localhost -S
  357  cat index.html
  358  docker stop webserver
  359  docker rm webserver
  360  docker run -d -p 80:80 -v `pwd`/:/usr/share/nginx/html/:rw --name webserver nginx
  361  docker exec -it webserver bash
  362  ls -la
  363  docker exec -it webserver bash
  364  df -h
  365  docker container
  366  docker container ls
  367  docker container -la
  368  docker ls a
  369* docker
  370  docker container --help
  371  docker container ls
  372  docker ps
  373  docker ps -a
```