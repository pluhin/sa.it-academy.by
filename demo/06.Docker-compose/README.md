# Docker compose

/etc/exports
```
/opt/dc   *(rw,sync,no_subtree_check)
```

```bash
10757  git pull
10758  cd demo
10759  mkdir 06.Docker-compose
10760  cd  06.Docker-compose
10761  mkdir {1..6}
10762  cd 1
10763  vim docker-compose.yaml
10764  docker-compose up
10765* docker ps
10766* watch docker ps
10767* top
10768  docker-compose up
10769  docker-compose up -d
10770* docker ps
10771  docker-compose exec  bash drupal
10772  docker-compose exec drupal bash
10773  docker-compose down 
10774  docker-compose up -d
10775  ls -l drupal_data
10776  docker-compose up -d
10777  docker-compose down
10778  ls -l drupal_data
10779  ls -l 
10780  sudo ls -l drupal_data
10781  docker-compose down --volume
10782  docker-compose up -d
10783  ls -l drupal_data
10784* docker ps
10785  ls -l drupal_data
10786  docker-compose exec drupal bash
10787  docker-compose down --volume
10788  sudo rm -rf drupal_data 
10789  docker-compose up
10790* cd ~
10791* ls -l drupal_data
10792* docker-compose exec drupal bash
10793  docker-compose down --volume
10794* sudo rm -rf drupal_data 
10795  docker-compose up
10796* docker-compose exec drupal bash
10797* ls drupal_data
10798* sudo ls drupal_data 
10799  docker-compose down --volume
10800* sudo rm -rf drupal_data 
10801  docker-compose up
10802* ls -l drupal_data
10803  cd ../2
10804* ls 
10805* sudo rm -rf drupal_data 
10806* docker-compose down --volume
10807  docker-compose up
10808  docker-compose up --build
10809  docker-compose up
10810  docker-compose up -d
10811  docker-compose down
10812  cd ../3
10813  ls
10814  docker volume create --driver local --opt type=none --opt device=`pwd`/app  --opt o=bind local_data
10815  docker volume list
10816* clear
10817* ifconfig
10818  docker-compose up -d
10819  docker-compose down
10820  cd ../4
10821  docker-compose up
10822* home_connect_remote
10823* mount | grep nfs
10824* mount | grep mount
10825* home_connect_local
10826  docker-compose up
10827  docker-compose down --re
10828  docker-compose down --remove-orphans
10829  dockr ps 
10830  docker ps 
10831* home_connect_local
10832  cd ../5
10833  ls
10834  docker-compose up -d
10835* watch docker ps
10836  docker-compose down --volume
10837* aws s3 ls --profile plu
10838  terraform --version
10839  cd ../6
10840  ls
10841  terraform init
10842  ls
10843  ls -la
10844  vim main.tf
10845  terraform init
10846  terraform 0.14upgrade .
10847  terraform 0.13upgrade .
10848  terraform init
10849  terraform providers
10850* cd /tmp
10851* wget https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip
10852* unzip terraform_0.13.6_linux_amd64.zip
10853* whereis terraform
10854* sudo mv terraform /usr/bin/terraform
10855* terraform --version
10856  terraform init
10857  terraform 0.13upgrade .
10858  history
10859  terraform init
10860  ls -l
10861  ls -la
10862  terraform plan
10863  terraform apply
10864* docker ps
10865  terraform plan
10866  terraform apply
10867  terraform destroy -auto-approve
```