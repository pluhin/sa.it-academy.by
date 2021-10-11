```bash
    1  docker ps
    2  history
    3  history
    4  top
    5  clear
    6  sudo apt-get update
    7  sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
    8  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    9  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   10    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   11  sudo apt-get update
   12  sudo apt-get install docker-ce docker-ce-cli containerd.io
   13  sudo usermod -aG docker $USER
   14  docker ps
   15  sudo docker ps
   16  newgrp docker
   17  history
   18  docker ps
   19  ps
   20  docker version
   21  clear
   22  docker search nginx
   23  docker pull nginx
   24  docker images
   25  docker run -p 80:80 --name webserver nginx:latest
   26  docker run -d -p 80:80 --name webserver nginx:latest
   27  docker rm websever
   28  docker ps
   29  docker rm webserver
   30  docker run -d -p 80:80 --name webserver nginx:latest
   31  docker ps
   32  ps
   33  top
   34  ps aux | grep nginx
   35  docker container logs webserver
   36  docker exec -it webserver bash
   37  docker rm $(docker ps -aq)
   38  docker stop webserver
   39  docker rm $(docker ps -aq)
   40  vim index.html
   41  <p>If you see this page, the nginx web server is successfully installed and
   42  working. Further configuration is required.</p>
   43  <p>For online documentation and support please refer to
   44  <a href="http://nginx.org/">nginx.org</a>.<br/>
   45  Commercial support is available at
   46  <a href="http://nginx.com/">nginx.com</a>.</p>
   47  clear
   48  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
   49  vim index.html
   50  docker stop webserver
   51  docker rm $(docker ps -aq)
   52  docker run -d -p 80:80 -v `pwd`/index.html:/usr/share/nginx/html/index.html:ro --name webserver nginx
   53  clear
   54  ls
   55  vim Dockerfile
   56  docker build -t first_image:v1.0 .
   57  docker inspect first_image:v1.0
   58  vim Dockerfile
   59  docker build --target zip -t first_image:zip  --target base -t first_image:base .
   60  docker inspect first_image:zip
   61  docker inspect first_image:base
   62  docker inspect first_image:zip
   63  vim 01.Dockerfile
   64  docker build -t demo:1 -f 01.Dockerfile .
   65  docker ps
   66  docker kill webserver
   67  docker ps
   68  docker images
   69  vim 02.Dockerfile
   70  docker build -t demo:2 -f 02.Dockerfile .
   71  docker ps
   72  docker images
   73  docker run -it demo:2 bash
   74  docker run -it demo:1 bash
   75  docker images
   76  vim 03.Dockerfile
   77  docker build -t demo:3 -f 03.Dockerfile .
   78  docker images
   79  docker inspect demo:2
   80  docker inspect demo:3
   81  cat 03.Dockerfile
   82  ls -l
   83  vim 04.Dockerfile
   84  docker build -t demo:4 -f 04.Dockerfile .
   85  docker images
   86  docker inspect demo:4
   87  vim 04.Dockerfile
   88  vim 05>dockerfile
   89  vim 05.Dockerfile
   90  vim nginx.conf
   91  ls -l
   92  docker build -t demo:5 -f 05.Dockerfile .
   93  docker images
   94  vim 05.Dockerfile
   95  vim 06.Dockerfile
   96  docker build -t nmap:my -f 06.Dockerfile .
   97  nmpa
   98  nmap
   99  docker run -t nmap:my -p 20-200 192.168.100.100
  100  mkdir docker_build
  101  cp 05.Dockerfile docker_build/
  102  cp index.html docker_build/
  103  cp nginx.conf docker_build/
  104  cd docker_build/
  105  ls
  106  mv 05.Dockerfile Dockerfile
  107  ls
  108  git init
  109  git status
  110  git add --al
  111  git add --all
  112  git commit -m "first"
  113  cd ../
  114  cp -r docker_build/ /vagrant/
  115  docker pull ghcr.io/pluhin/docker_build:latest
  116  docker login https://ghcr.io
  117  docker pull ghcr.io/pluhin/docker_build:latest
  118  docker images
  119  history
```

```bash
   17  curl -S http://localhost
   18  curl -I http://localhost
```

## Github action

.github/workflows/build.yaml

```yaml
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "master"
jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2

      - name: Log in to the Container registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/pluhin/docker_build:latest
```
