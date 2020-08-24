```bash
 8162  docker --version
 8163  docker ps
 8164  docker --version
 8165  docker search httpd
 8166  id
 8167  clear
 8168  docker pull httpd
 8169  docker images
 8170  docker ps
 8171  docker run httpd
 8172  docker ps
 8173* docker run httpd -d
 8174* clear
 8175* docker run -d -p 80:80 httpd
 8176  docker ps
 8177* docker stop 10735289c03a
 8178  docker ps
 8179* docker stop $(docker ps -aq)
 8180* docker rm $(docker ps -aq)
 8181* docker rmi $(docker images -q)
 8182* cd ../sa.it-academy.by/demo/13.Docker
 8183* pwd
 8184* cd /home/spishchyk/Documents/git_repos/sa.it-academy.by/demo/13.Docker
 8185* clear
 8186* docker build .
 8187* docker build -f Dockerfile .
 8188  docker images
 8189* docker build -f Dockerfile -t testing:v1.0 .
 8190  docker images
 8191* mkdir html
 8192* pwd
 8193* pwd > html/index.html
 8194* docker run -d -p 80:80 -v /home/spishchyk/Documents/git_repos/sa.it-academy.by/demo/13.Docker/html:/var/www/html:ro httpd
 8195  docker ps
 8196* docker exec -it bd1929091273 bash
 8197  docker stop bd1929091273
 8198* docker run -d -p 80:80 -v /home/spishchyk/Documents/git_repos/sa.it-academy.by/demo/13.Docker/html:/usr/local/apache2/htdocs:ro httpd
 8199  docker ps
 8200  docker stop e4c1b178203f
 8201* docker build --target base -t multi:base --target zip -t multi:zip .
 8202  docker images
 8203* docker build -t demo:v1 -f 01.Dockerfile .
 8204  docker images
 8205  docker inspect demo:v1
 8206  docker image history demo:v1
 8207  docker image history demo:v1 --format "{{.CreatedBy}}" --no-trunc
 8208* docker build -t demo:v2 -f 02.Dockerfile .
 8209  docker images
 8210  docker inspect demo:v2
 8211  docker images
 8212  docker run -it demo:v2 bash
 8213* docker build -t demo:v3 -f 03.Dockerfile .
 8214  docker images
 8215  docker inspect demo:v3
 8216* docker build -t demo:v4 -f 04.Dockerfile .
 8217  docker images
 8218  docker inspect demo:v4
 8219  docker images
 8220  docker inspect demo:v5
 8221  docker run -d -p 80:80 -it demo:v5
 8222  docker ps
 8223  docker stop 31d97f33cc40
 8224  docker images
 8225* docker build -t demo:v5 -f 05.Dockerfile .
 8226* docker build -t pluhin31/test_sa:first -f 05.Dockerfile .
 8227  docker images
 8228* docker push pluhin31/test_sa:first
 8229* docker login
 8230* ls -l ~/.docker/config.json
 8231* vim ~/.docker/config.json
 8232* mv  ~/.docker/config.json /tmp
 8233* docker login
 8234* docker push pluhin31/test_sa:first
 8235  cd /tmp
 8236  git clone git@github.com:pluhin/build_sa.git
 8237  cd build_sa
 8238  ls
 8239  vim Dockerfile
 8240  git add --all
 8241  git commit -m "Demo"
 8242  git push
```