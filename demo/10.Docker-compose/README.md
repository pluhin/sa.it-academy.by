
**/etc/exports**
```
/opt/dc   *(rw,sync,no_subtree_check)
```
---

```bash
11755  cd ../
11756  git pull
11757  mkdir -p 10.Docker-compose/{1..6}
11758  cd 10.Docker-compose/1
11759  ls
11760  vim docker-compose.yaml
11761  docker-compose up
11762  ls -l ./
11763  ls -l drupal_data
11764  sudo ls -l drupal_data
11765  docker-compose up -d
11766  docker-compose down
11767  docker-compose up -d
11768  docker-compose logs drupal
11769  ls -l drupal_data
11770  sudo ls -l drupal_data
11771* top
11772  docker-compose down --volume
11773  vim docker-compose.yaml
11774  docker-compose up -d
11775  vim docker-compose.yaml
11776  docker-compose up -d
11777  ls -l dd
11778  ls -l dd/sites
11779  vim docker-compose.yaml
11780  docker-compose up -d
11781  docker-compose down --volume
11782  docker-compose up -d
11783  sudo mc
11784  docker-compose down --volume
11785  docker-compose up -d
11786  docker ps
11787  docker-compose logs drupal
11788  docker-compose down --volume
11789  sudo mc
11790  vim docker-compose.yaml
11791  docker-compose up -d
11792  docker-compose stop drupal
11793  docker ps
11794  docker-compose start drupal
11795  docker-compose down
11796  docker-compose up -d
11797  vim docker-compose.yaml
11798  docker-compose down --volume
11799  cd  ../2
11800  ls
11801  vim docker-compose.yaml
11802  mc
11803  ls -l
11804  mv 05.Dockerfile Dockerfile
11805  vim docker-compose.yaml
11806  docker-compose up -d
11807  docker-compose down --volume
11808  docker ps
11809  cd ../
11810  cd 3
11811  mkdir app
11812  vim app/index.html
11813  vim docker-compose.yaml
11814  docker volume create --driver local --opt type=none --opt device=`pwd`/app  --opt o=bind local_data
11815  docker volume list
11816  docker-compose up -d
11817  docker volume list
11818  vim docker-compose.yaml
11819  docker-compose up -d
11820  pwd
11821  ls -l /home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose/3/app
11822  ls -l /home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/10.Docker-compose/3/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Docker-compose/3/app
11823  ls -l /home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/10.Docker-compose/3/app
11824  docker volume rm local_data
11825  docker volume create --driver local --opt type=none --opt device=`pwd`/app  --opt o=bind local_data
11826  docker volume inspect local_data
11827  docker-compose up -d
11828  docker-compose down --volume
11829  docker volume inspect local_data
11830  docker volume rm local_data
11831  docker volume inspect local_data
11832  cd ../4
11833  mc
11834  ls -l
11835  vim docker-compose.yaml
11836  vim app/index.html
11837  docker-compose up -d
11838  curl -s localhost:81 
11839  curl -s 127.0.0.1:81 
11840  ifconfig| grep  "inet "
11841  curl -s 192.168.1.25:81 
11842  vim docker-compose.yaml
11843  docker volume rm 4_data_nfs
11844* home_connect_local
11845  id
11846  docker-compose up -d
11847  vim docker-compose.yaml
11848  history | grep mount
11849  docker-compose down --volume
11850  docker-compose down --remove-orphans
11851  vim docker-compose.yaml
11852  cd ../5
11853  vim docker-compose.yaml
11854  mkdir app
11855  vim app/index.php
11856  vim docker-compose.yaml
11857  vim .env
11858  vim docker-compose.yaml
11859  vim .env
11860  vim docker-compose.yaml
11861  vim ../../../.gitignore
11862  vim docker-compose.yaml
11863  vim app/index.php
11864  docker-compose up -d
11865  vim .env
11866  docker-compose up -d
11867  vim docker-compose.yaml
11868  docker ps
11869  top
11870  htop
11871  docker ps
11872  vim app/index.php
11873  vim .env
11874  docker-compose exec web_app bash
11875  vim docker-compose.yaml
11876  docker-compose exec web bash
11877  vim docker-compose.yaml
11878  docker-compose exec db bash
11879  vim .env
11880  docker-compose restart db
11881  top
11882  ps aux | grep mysql
11883  docker-compose exec db bash
11884  docker-compose down --volume
11885  docker-compose up
11886  vim .env
11887  vim docker-compose.yaml
11888  cd ../6
11889  ls
11890  terraform --version
11891  vim main.tf
11892  vim ../1/docker-compose.yaml
11893  vim main.tf
11894  terraform init
11895  vim main.tf
11896  terraform init
11897  ls -l
11898  ls -la
11899  terraform plan
11900  vim main.tf
11901  terraform plan
11902  ls -l
11903  ls -la
11904  terraform apply
11905  vim main.tf
11906  terraform plan
11907  terraform apply
11908  terraform destroy -auto-approve

```
