[https://github.com/pluhin/build_sa](https://github.com/pluhin/build_sa)


```bash
8429  cd 14.Docker
 8430  ls
 8431  mkdir 01
 8432  cd 01
 8433  clear
 8434  docker-compose -v
 8435  vim docker-compose.yaml
 8436  docker-compose up
 8437  docker-compose up -d
 8438  docker ps
 8439  docker-compose exec db bash
 8440  vim docker-compose.yaml
 8441  docker-compose up -d --no-deps --build drupal
 8442  docker-compose down
 8443  cd ../
 8444  mkdir {02,03,04,05}
 8445  cd 02
 8446  ls
 8447  vim docker-compose.yaml
 8448  mkdir app
 8449  vim app/index.html
 8450  date > app/index.html
 8451  vim app/index.html
 8452  ls -l
 8453  vim docker-compose.yaml
 8454  pwd
 8455  docker volume create --driver local --opt type=none --opt device=/home/spishchyk/Documents/git_repos/sa.it-academy.by/demo/14.Docker/02/app --opt o=bind local_data
 8456  docker volume ls
 8457  docker-compose up -s
 8458  docker-compose up -d
 8459  vim docker-compose.yaml
 8460  docker-compose down
 8461  docker volume rm local_data
 8462* home_connect_local
 8463  cd ../03
 8464  ls
 8465  vim docker-compose.yaml
 8466  docker-compose up -d
 8467  vim docker-compose.yaml
 8468  docker-compose down
 8469  cd ../04
 8470  ls
 8471  vim docker-compose.yaml
 8472  vim .env
 8473  mkdir app
 8474  vim app/db.php
 8475  vim .env
 8476  ls
 8477  ls -a
 8478  vim .env
 8479  vim docker-compose.yaml
 8480  docker-compose up -d
 8481  vim docker-compose.yaml
 8482  vim app/db.php
 8483  vim docker-compose.yaml
 8484  cd ../05
 8485  ls -l ../
 8486  vim docker-compose.yaml
 8487  mkdir jenkins/{casc_configs,init.groovy.d}
 8488  mkdir jenkins/{casc_configs,init.groovy.d} -p
 8489  vim jenkins/casc_configs/jenkins.yaml
 8490  vim jenkins/init.groovy.d/basic-security.groovy
 8491  cp jenkins bk
 8492  cp -r jenkins bk
 8493  ls -l bk
 8494  vim Dockerfile
 8495  id docker
 8496  id 
 8497  vim Dockerfile
 8498  vim docker-compose.yaml
 8499  docker-compose up -d
 8500* mkdir ../06
 8501* cd ..
 8502* cd 06
 8503* top
 8504* clear
 8505  top
 8506  docker-compose down
 8507  cd ../06
 8508  vim main.tf
 8509  terraform -v
 8510  terraform init
 8511  terraform 0.13upgrade .
 8512  terraform init
 8513  ls -l
 8514  ls -la
 8515  terraform plan
 8516  terraform apply
 8517  vim main.tf
 8518  terraform plan
 8519  terraform apply 
 8520  vim main.tf
 8521  terraform destroy
 8522  ls -l
 8523  mc

```
