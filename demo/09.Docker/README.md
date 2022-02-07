# Docker

```bash
    1  clear
    2  sudo apt update
    3  sudo apt-get install     ca-certificates     curl     gnupg     lsb-release
    4  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    5  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    6    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    7  sudo apt update
    8  sudo usermod -aG docker $USER
    9  docker ps
   10  docker version
   11  clear
   12  docker search nginx
   13  docker pull nginx
   14  docker run -p 80:80 --name webserver nginx:latest
   15  docker run -d -p 80:80 --name webserver nginx:latest
   16  docker rm webserver
   17  docker run -d -p 80:80 --name webserver nginx:latest
   18  docker ps
   19  docker logs webserver --follow
   20  docker ps
   21  docker exec -it webserver bash
   22  docker stop webserver
   23  docker rm $(docker ps -aq)
   24  vim index.html
   25  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
   26  curl -S http://localhost
   27  docker stop webserver
   28  docker rm $(docker ps -aq)
   29  clear
   30  vim Dockerfile
   31  docker build -t first_image:v1.0 .
   32  docker images
   33  vim Dockerfile
   34  docker build --target zip first_image:zip --target base -t first_image:base .
   35  docker build --target zip -t first_image:zip --target base -t first_image:base .
   36  docker inspect first_image:zip
   37  vim 01.Dockerfile
   38  docker build -t demo:1 -f 01.Dockerfile .
   39  docker inspect demo:1
   40  docker images
   41  vim 02.Dockerfile
   42  docker build -t demo:2 -f 02.Dockerfile .
   43  doccker inspect demo:1 bash
   44  docker inspect demo:1 bash
   45  docker run -it demo:1 bash
   46  docker run -it demo:2 bash
   47  docker ps
   48  docker images
   49  vim 03.Dockerfile
   50  docker build -t demo:3 -f 03.Dockerfile .
   51  docker images
   52  docker run -it demo:3 bash
   53  docker inspect demo:3
   54  vim 03.Dockerfile
   55  vim 04.Dockerfile
   56  docker build -t demo:4 -f 04.Dockerfile .
   57  docker inspect demo:4
   58  docker images
   59  vim 05.Dockerfile
   60  vim nginx.conf
   61  vim index.html
   62  docker build -t demo:5 -f 05.Dockerfile .
   63  docker images
   64  vim 06.Dockerfile
   65  docker build -t my_nmap:latest -f 06.Dockerfile .
   66  nmpa
   67  nmap
   68  docker run -t my_nmap:latest -p 20-200 192.168.100.100
   69  vim .bashrc
   70  source .bashrc
   71  nmap -p 20-200 192.168.100.100
   72  docker pull ghcr.io/pluhin/docker_build:latestv
   73  docker pull ghcr.io/pluhin/docker_build:latest
   74  history
```

## Docker github action

https://github.com/pluhin/docker_build


