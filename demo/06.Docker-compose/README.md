```bash

10984  cd ../
10985  ls
10986  mkdir 06.Docker-compose
10987  cd  06.Docker-compose
10988  mkdir {1..6}
10989  ls
10990  cd 1
10991  vim docker-compose.yaml
10992  docker-compose up 
10993* iwconfig wlp2s0| grep "Bit "
10994  vim docker-compose.yaml
10995  docker-compose up 
10996  vim docker-compose.yaml
10997  docker-compose up -d
10998  docker-compose down
10999  docker-compose down --volume
11000  docker-compose up -d
11001  docker-compose down --volume
11002  docker-compose up -d
11003  docker volume list
11004  docker volume rm *
11005  docker volume rm $(docker volume ls -q)
11006  docker volume list
11007  docker-compose down
11008  docker-compose up -d
11009  vim docker-compose.yaml
11010  docker-compose exec db bash
11011  docker-compose exec drupal bash
11012  docker-compose down
11013  docker-compose down --volume
11014  cd ../
11015  cd 2
11016  vim docker-compose.yaml
11017  mc 
11018  mv 05.Dockerfile Dockerfile
11019  vim Dockerfile
11020  vim docker-compose.yaml
11021  docker-compose up -d --build
11022  docker ps
11023  vim docker-compose.yaml
11024  docker-compose up -d 
11025  vim docker-compose.yaml
11026  docker-compose up -d 
11027  docker-compose down
11028  cd ../3
11029  mkdir app
11030  vim app/index.html
11031  owd
11032  pwd
11033  docker volume create --driver local --opt type=none --opt device=/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose/3/app  --opt o=bind local_data
11034  docker volume list
11035  docker volume rm local_data
11036  docker volume create --driver local --opt type=none --opt device=/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose/3/app  --opt o=bind local_data
11037  ls
11038  vim docker-compose.yaml
11039  docker-compose up -d 
11040* top
11041* docker pull mcr.microsoft.com/windows/servercore
11042  cat app/index.html
11043  vim app/index.html
11044  vim docker-compose.yaml
11045  docker-compose down --volume
11046  docker volume rm local_data
11047  cd ../4
11048* clear
11049* home_connect_local
11050  id
11051  vim docker-compose.yaml
11052  docker-compose up -d 
11053  mount | grep nfs
11054  ls -l /mnt/
11055  mount
11056  mount | grep nfs
11057  sudo mount -t nfs -o rw 192.168.1.100:/opt/dc /mnt/nfs
11058  sudo mount -t nfs -o rw -o vers=4 192.168.1.100:/opt/dc /mnt/nfs
11059  sudo mount -t nfs -o rw -o vers=3 192.168.1.100:/opt/dc /mnt/nfs
11060  sudo mount -t nfs -o rw -o vers=2 192.168.1.100:/opt/dc /mnt/nfs
11061  sudo mount -t nfs -o rw 192.168.1.100:/opt/dc /mnt/nfs
11062  ls -l /mnt/nfs
11063  sudo umount /mnt/nfs
11064  mount | grep nfs
11065  docker-compose up -d 
11066  vim docker-compose.yaml
11067  docker-compose down --volume
11068  cd ../5
11069  ls
11070  mkdir app
11071  vim index.php
11072  mv index.php app
11073  ls -l app
11074  vim docker-compose.yaml
11075  vim .env
11076  ls -l
11077  ls -la
11078  vim ../../../.gitignore
11079  vim .env
11080  vim docker-compose.yaml
11081* home_connect_local
11082  docker-compose up -d
11083  vim docker-compose.yaml
11084  vi app/index.php
11085  vim docker-compose.yaml
11086  docker-compose down --volume
11087  cd ../6
11088  ls
11089  terraform --version
11090  terraform init
11091  ls
11092  ls -la
11093  vim main.tf
11094  terraform init
11095  terraform 0.13upgrade .
11096  terraform init
11097  vim main.tf
11098* cd ~/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose
11099* vim 1/docker-compose.yaml
11100  vim main.tf
11101  terraform plan
11102  vim main.tf
11103  terraform plan
11104  vim main.tf
11105  terraform plan
11106  terraform apply
11107  vim main.tf
11108  terraform destroy -auto-approve
```
