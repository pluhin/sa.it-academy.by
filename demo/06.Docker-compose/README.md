
```bash
10333  mkdir 06.Docker-compose
10334  cd 06.Docker-compose
10335  mkdir {01,02,03,04}
10336  cd 01
10337  vim docker-compose.yaml
10338  docker-compose up
10339  docker volume list
10340  docker volume rm 01_db_data
10341  docker stop $(docker ps -aq)
10342  docker volume rm 01_db_data
10343  docker ps
10344  docker rm $(docker ps -aq)
10345  docker volume rm 01_db_data
10346  docker volume rm 03_data_nfs
10347  docker-compose up
10348  docker volume rm 01_db_data
10349  docker stop $(docker ps -aq)
10350  docker rm $(docker ps -aq)
10351  docker volume rm 01_db_data
10352  docker-compose up -d
10353  docker ps
10354  docker-compose exec db bash
10355  docker ps
10356  docker-compose down
10357* ansible-playbook -i inventory i2_deploy_force.yml -l 'MT_PRE_microservdb_05' --ask-pass
10358* home_connect_local
10359  cd ../02
10360  docker-compose up -d
10361  docker p
10362  docker ps
10363  docker-compose build
10364  docker-compose up -d
10365  docker ps
10366  docker-compose down
10367  docker-compose up -d
10368  docker ps
10369  docker-compose down
10370  docker ps
10371  docker-compose up
10372  docker-compose up -d
10373  docker ps
10374  docker-compose up -d --build
10375  docker ps
10376  docker-compose up
10377  docker-compose down
10378  docker-compose up -d
10379  docker ps
10380  docker-compose up -d
10381  docker ps
10382  docker-compose down
10383  cd ../03
10384  pwd
10385  docker volume create --driver local --opt type=none --opt device=/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose/03/app  --opt o=bind local_data
10386  docker-compose up -d
10387  cd ../
10388* home_connect_local
10389  mkdir /mnt/nfs
10390  sudo mkdir /mnt/nfs
10391  sudo mount -t nfs -rw 192.168.1.100:/opt/dc  /mnt/nfs
10392* top
10393* df -h
10394  sudo mount -t nfs -rw 192.168.1.100:/opt/dc  /mnt/nfs
10395  sudo mount -t nfs -o rw 192.168.1.100:/opt/dc  /mnt/nfs
10396* df -h
10397  mount
10398  mount | nfs
10399  mount | grep nfs
10400  sudo mount -t nfs -o rw 192.168.1.100:/opt/dc  /mnt/nfs
10401  cd 04
10402  docker-compose up -d
10403  docker ps
10404  cd ../
10405  cd 03
10406  docker-compose down 
10407  cd ../04
10408  docker-compose down 
10409  docker-compose up -d
10410  ping 192.168.1.100
10411  sudo mount -t nfs -o rw 192.168.1.100:/opt/dc  /mnt/nfs
10412  df -h
10413  cat /mnt/nfs/index.html
10414  umount /mnt/nfs
10415  sudo umount /mnt/nfs
10416  df -h
10417  docker-compose up -d
10418* home_connect_local
10419  cd ../05
10420  docker-compose up -d
10421  docker-compose down
10422  docker-compose up -d
10423  docker-compose down
10424  docker-compose up -d
10425  docker ps
10426  docker-compose down
10427  cd ../04
10428  docker-compose down
10429  cd ../
10430  mkdir {06,07}
10431  cd 06
10432  ls -l
10433  cd ../
10434  ls -l 07
10435  mc
10436  l
10437  cd 07
10438  docker-compose up -d
10439  docker ps
10440  docker-compose down
10441  sudo chown -R spishchyk:spishchyk ./jenkins
10442  sudo rm -rf ./jenkins
10443  cd ../06
10444  ls -l
10445  ls
10446  terraform --version
10447  terraform init
10448  terraform 0.13upgrade .
10449  terraform init
10450  terraform plan
10451  terraform apply
10452  terraform plan
10453  terraform apply
10454  terraform destroy

```