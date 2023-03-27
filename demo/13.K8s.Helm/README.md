
```bash
  748  mkdir 13.K8s.Helm/
  749  cd 13.K8s.Helm/
  750  ls
  751  mkdir helm-releases
  752  mkdir helm-source
  753  cd helm-source/
  754  helm
  755  ls
  756  chmod 700 get_helm.sh
  757  helm
  758  helm create first-app
  759  ls -l
  760  rm get_helm.sh
  761  ls -l first-app/
  762  ls -l first-app/templates/
  763  vim first-app/Chart.yaml
  764  vim first-app/values.yaml
  765  vim first-app/templates/deployment.yaml
  766  vim first-app/values.yaml
  767  vim first-app/templates/deployment.yaml
  768  vim first-app/Chart.yaml
  769  vim first-app/templates/deployment.yaml
  770  vim first-app/templates/service
  771  vim first-app/templates/service.yaml
  772  vim first-app/values.yaml
  773  vim first-app/templates/ingress.yaml
  774  helm package first-app
  775  ls -la
  776  mv first-app-0.1.0.tgz ../helm-releases/
  777  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  778  vim first-app/values.yaml
  779  helm package first-app
  780  mv first-app-0.1.0.tgz ../helm-releases/
  781  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  782  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  783  ls
  784  cd ../
  785  ls
  786  git init
  787  ls -l
  788  git commit -m "first commit"
  789  git add --all
  790  git commit -m "first commit"
  791  git commit --amend --reset-author
  792  git config --global user.name "Siarhei Pishchyk"
  793  git config --global user.email "pluhin@gmail.com"
  794  git status
  795  git branch
  796  git remote add origin git@github.com:pluhin/helm-23-23.git
  797  git push -u origin master
  798  helm uninstall first-app
  799  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  800  helm repo index --url https://pluhin.github.io/helm-23-23/ .
  801  vim index.yaml
  802  git add --all
  803  git commit -m "Add first version"
  804  git push
  805  cd helm-source/
  806  vim first-app/Chart.yaml
  807  vim first-app/values.yaml
  808  vim first-app/templates/pvc.yaml
  809  vim first-app/templates/service.yaml
  810  vim first-app/templates/pvc.yaml
  811  vim first-app/templates/deployment.yaml
  812  helm package first-app
  813  ls
  814  mv first-app-0.2.0.tgz ../helm-releases/
  815  history
  816  cd ../
  817  helm repo index --url https://pluhin.github.io/helm-23-23/ --merge index.yaml .
  818  vim index.yaml
  819  git add --all
  820  git commit -m "add version 2"
  821  git push
  822  history | grep install
  823  helm repo add m23-23 https://pluhin.github.io/helm-23-23/
  824  helm repo update
  825  helm install first-app m23-23/first-app --version 0.2.0
  826  vim first-app/templates/deployment.yaml
  827  cd helm-source/
  828  vim first-app/templates/deployment.yaml
  829  history install --dry-run first-app first-app
  830  helm install --dry-run first-app first-app
  831  history
  832  helm package first-app
  833  mv first-app-0.2.0.tgz ../helm-releases/
  834  helm repo index --url https://pluhin.github.io/helm-23-23/ --merge index.yaml .
  835  git add --all
  836  git commit -m "add version 2 fix"
  837  git push
  838  helm repo update
  839  helm install --dry-run first-app m23-23/first-app
  840  helm repo update
  841  helm install --dry-run first-app m23-23/first-app
  842  helm repo update
  843  helm install --dry-run first-app m23-23/first-app
  844  helm install first-app m23-23/first-app --version 0.2.0
  845  helm uninstall first-app
  846  cd  ../
  847  cd ../06.Ansible/
  848  ls
  849  rm \\
  850  ls
  851  history | grep mari
  852  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bitnami_joomla -e user_db=bn_joomla -e pass_db=bn_joomla
  853  cd ../13.K8s.Helm/
  854  ls
  855  helm repo add my-repo https://charts.bitnami.com/bitnami
  856  helm repo update
  857  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bitnami_joomla -e user_db=bn_joomla -e pass_db=bn_joomla
  858  helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=192.168.201.XX,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bitnami_joomla,global.storageClass=nfs,joomlaUsername=admin,joomlaPassword=joomla my-repo/joomla
  859  vim joomla_ingress.yaml
  860  kubectl apply -f joomla_ingress.yaml
  861  vim joomla_ingress.yaml
  862  history
```
