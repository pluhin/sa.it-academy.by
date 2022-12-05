# Docker

```bash
 190  cd ../
  191  mkdir 07.Docker
  192  cd 07.Docker/
  193  ls
  194  sudo apt-get remove docker docker-engine docker.io containerd runc
  195  sudo apt-get update
  196  sudo apt-get install     ca-certificates     curl     gnupg     lsb-release
  197  sudo mkdir -p /etc/apt/keyrings
  198  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  199  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  200    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  201  sudo apt-get update
  202  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  203  sudo usermod -aG docker $USER
  204  cd 07
  205  cd /vagrant/07.Docker/
  206  l
  207  ls -l
  208  docker ps
  209  docker version
  210  docker images
  211  docker search ngninx
  212  docker search nginx
  213  docker pull nginx
  214  docker run -p 80:80 --name webserver nginx
  215  docker rm webserver
  216  docker run -d -p 80:80 --name webserver nginx
  217  docker ps
  218  docker logs webserver
  219  watch docker logs webserver
  220  docker stop  webserver
  221  docker rm webserver
  222  vim index.htlm
  223  vim index.html
  224  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:rw  --name webserver nginx
  225  curl -S http://127.0.0.1
  226  docker stop  webserver
  227  docker rm webserver
  228  clear
  229  ls
  230  vim Dockerfile
  231  docker build -t first_image:v1.0 .
  232  docker images
  233  docker inspect first_image:v1.0
  234  vim Dockerfile
  235  docker build --target zip -t first_image:zip --target base -t first_image:base .
  236  docker images
  237  clear
  238  vim 01.Dockerfile
  239  docker build -t demo:1 -f 01.Dockerfile .
  240  vim 01.Dockerfile
  241  docker build -t demo:1 -f 01.Dockerfile .
  242  vim 01.Dockerfile
  243  docker build -t demo:1 -f 01.Dockerfile .
  244  vim 01.Dockerfile
  245  docker build -t demo:1 -f 01.Dockerfile .
  246  docker images
  247  docker inspect demo:1
  248  vim 02.Dockerfile
  249  docker build -t demo:2 -f 02.Dockerfile .
  250  docker inspect demo:2
  251  docker inspect demo:3
  252  docker inspect demo:1
  253  docker images
  254  docker run -it demo:1 bash
  255  docker run -it demo:2 bash
  256  vim 03.Dockerfile
  257  docker build -t demo:3 -f 03.Dockerfile .
  258  docker images
  259  docker inspect demo:3
  260  vim 03.Dockerfile
  261  vim 04.Dockerfile
  262  docker build -t demo:4 -f 04.Dockerfile .
  263  docker inspect demo:4
  264  docker images
  265  vim 05.Dockerfile
  266  vim nginx.conf
  267  docker build -t demo:5 -f 05.Dockerfile .
  268  docker images
  269  nmap
  270  vim 05.Dockerfile
  271  vim 06.Dockerfile
  272  docker build -t my_nmap:latest -f 06.Dockerfile .
  273  docker run -t my_nmap:latest
  274  docker run -t my_nmap:latest -p 20-23 192.168.1.100
  275  vim ~/.bashrc
  276  source ~/.bashrc
  277  nmap -p 20-23 192.168.1.100
  278  docker images
  279  history
```