```bash
358  ls
  359  mkdir 07.Docker
  360  cd 07.Docker/
  361  ls
  362  sudo apt update
  363  sudo mkdir -m 0755 -p /etc/apt/keyrings
  364  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  365  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  366    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  367  sudo apt update
  368  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  369  sudo usermod -aG docker $USER
  370  cd /vagrant/07.Docker/
  371  docker ps
  372  docker search nginx
  373  docker pull naginx
  374  docker pull nginix
  375  docker pull nginx
  376  docker describe nginx
  377  docker images
  378  docker inspect nginx
  379  docker run -p 80:80 --name webserver nginx
  380  docker run -d -p 80:80 --name webserver nginx
  381  docker rm webserver
  382  docker run -d -p 80:80 --name webserver nginx
  383  docker ps
  384  docker logs webserver
  385  docker stop webserver
  386  docker rm webserver
  387  vim Dockerfile
  388  docker build -t first_image:v1.0
  389  docker build -t first_image:v1.0 .
  390  docker images
  391  vim Dockerfile
  392  docker build --target zip -t first_image:zip --target base -t first_image:base .
  393  docker images
  394  vim 01.Dockerfile
  395  docker build -t demo:1 -f 01.Dockerfile
  396  docker build -t demo:1 -f 01.Dockerfile .
  397  docker images
  398  docker inspect demo:1
  399  vim 02.Dockerfile
  400  docker build -t demo:2 -f 02.Dockerfile .
  401  docker images
  402  docker run -it demo:1 bash
  403  docker run -it demo:2 bash
  404  vim 03.Dockerfile
  405  docker build -t demo:3 -f 03.Dockerfile .
  406  docker images
  407  docker inspect demo:2
  408  docker inspect demo:3
  409  vim 04.Dockerfile
  410  docker build -t demo:4 -f 04.Dockerfile .
  411  vim 04.Dockerfile
  412  docker inspect demo:3
  413  docker inspect demo:4
  414  docker images
  415  vim 05.Dockerfile
  416  vim nginx.conf
  417  vim index.html
  418  docker build -t demo:5 -f 05.Dockerfile .
  419  docker images
  420  docker run -p 80:80  demo:5
  421  nmap
  422  vim 06.Dockerfile
  423  docker build -t nmap:my -f 06.Dockerfile .
  424  docker run -t nmap:my -p 20-23 192.168.1.100
  425  vim ~/.bashrc
  426  source ~/.bashrc
  427  nmap  -p 20-23 192.168.1.100
  428  history
```