```bash
  308  mkdir 07.Docker
  309  cd 07.Docker/
  310  docker
  311  sudo apt-get update
  312  sudo apt-get install ca-certificates curl
  313  sudo install -m 0755 -d /etc/apt/keyrings
  314  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  315  sudo chmod a+r /etc/apt/keyrings/docker.asc
  316  sudo install -m 0755 -d /etc/apt/keyrings
  317  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  318  sudo chmod a+r /etc/apt/keyrings/docker.asc
  319  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  320    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  321  sudo apt-get update
  322  echo $?
  323  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  324  sudo usermod -aG docker $USER
  325  c
  326  docker ps
  327  docker version
  328  docker search nginx
  329  docker pull nginx
  330  docker inspect nginx:latest
  331  docker images
  332  docker run --name webserver nginx:latest
  333  docker run -d -p 80:80 --name webserver nginx:latest
  334  docker rm webserver
  335  docker run -d -p 80:80 --name webserver nginx:latest
  336  docker logs webserver
  337  docker ps
  338  docker stop webserver
  339  docker rm webserver
  340  docker ps
  341  docker rmi nginx:latest
  342  docker ps
  343  docker images
  344  cd 07.Docker/
  345  ls
  346  vim Dockerfile
  347  docker build -t first_image:v1.0 .
  348  vim Dockerfile
  349  docker build -t first_image:v1.0 .
  350  docker images
  351  vim Dockerfile
  352  docker build --target zip -t first_image:zip --target base -t first_image:base
  353  docker build --target zip -t first_image:zip --target base -t first_image:base .
  354  docker images
  355  ls
  356  vim 01.Dockerfile
  357  docker build -t demo:1 -f 01.Dockerfile .
  358  docker images
  359  vim 03.Dockerfile
  360  docker build -t demo:3 -f 03.Dockerfile .
  361  vim 03.Dockerfile
  362  docker images
  363  docker inspect demo:2
  364  docker inspect demo:3
  365  vim 03.Dockerfile
  366  docker run -it demo:1 bash
  367  docker run -it demo:2 bash
  368  docker images
  369  vim 04.Dockerfile
  370  docker build -t demo:4 -f 04.Dockerfile .
  371  docker images
  372  vim 05.Dockerfile
  373  vim index.html
  374  vim nginx.conf
  375  vim 05.Dockerfile
  376  docker build -t demo:5 -f 05.Dockerfile .
  377  docker images
  378  nc
  379  nmap
  380  vim 06.Dockerfile
  381  docker build -t demo:6 -f 06.Dockerfile .
  382  docker run -t demo:6 -p 22 192.168.201.1
  383  alias nmap="docker run -t demo:6"
  384  nmap  -p 22 192.168.201.1
  385  history
```