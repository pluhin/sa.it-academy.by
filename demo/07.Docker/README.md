```bash
  318  sudo apt-get update
  319  sudo apt-get install ca-certificates curl
  320  sudo install -m 0755 -d /etc/apt/keyrings
  321  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  322  sudo chmod a+r /etc/apt/keyrings/docker.asc
  323  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  324    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  325  sudo apt-get update
  326  sudo service docker status
  327  clear
  328  sudo usermod -aG docker $USER
  329  docker ps
  330  mkdir 07.Docker
  331  cd 07.Docker/
  332  ls
  333  docker search nginx
  334  docker pull nginx
  335  docker inspect nginx:latest
  336  docker images
  337  docker run --name webserver nginx
  338  docker run -d -p 80:80 --name webserver nginx
  339  docker rm webserver
  340  docker run -d -p 80:80 --name webserver nginx
  341  docker ps
  342  curl -I http://localhost
  343  curl -S http://localhost
  344  docker stop webserver
  345  docker rm webserver
  346  docker run -d -p 80:80 --name webserver nginx
  347  docker logs webserver
  348*
  349  docker stop webserver
  350  docker rm webserver
  351  vim Dockerfile
  352  docker build -t fisrst_image:v1.0 .
  353  docker images
  354  vim Dockerfile
  355  docker build --target zip -t first_image:zip --target base -t firs_image:base .
  356  docker images
  357  ls
  358  vim 01.Dockerfile
  359  docker build -t demo:1 -f 01.Dockerfile .
  360  docker images
  361  docker inspect demo:1
  362  vim 02.Dockerfile
  363  docker build -t demo:2 -f 02.Dockerfile .
  364  vim 02.Dockerfile
  365  docker images
  366  docker run -it demo:1 bash
  367  docker run -it demo:2 bash
  368  vim 03.Dockerfile
  369  docker build -t demo:3 -f 03.Dockerfile .
  370  docker images
  371  docker inspect demo:3
  372  docker inspect demo:2
  373  vim 04.Dockerfile
  374  docker build -t demo:4 -f 04.Dockerfile .
  375  docker inspect demo:4
  376  docker images
  377  vim index.html
  378  vim nginx.conf
  379  vim 05.Dockerfile
  380  docker build -t demo:5 -f 05.Dockerfile .
  381  docker images
  382  nc
  383  nmap
  384  vim 06.Dockerfile
  385  docker build -t nmap:demo -f 06.Dockerfile .
  386  docker run -t nmap:demo -p 22 192.168.202.5
  387  alias nmap="docker run -t nmap:demo"
  388  nmap -p 22 192.168.202.5
  389  history
```