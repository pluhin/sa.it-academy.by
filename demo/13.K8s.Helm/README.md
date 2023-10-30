```bash
  822  history
  823  mkdir 13.K8s.Helm
  824  cd 13.K8s.Helm/
  825  ls
  826  mkdir helm-releases
  827  mkdir helm-source
  828  helm
  829  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  830  ls
  831  chmod +x get_helm.sh
  832  ./get_helm.sh
  833  helm
  8XX  helm version
  835  clear
  836  helm create first-app
  837  ls -l first-app/
  838  ls -l first-app/templates/
  839  ls -l first-app/Chart.yaml
  840  vim first-app/Chart.yaml
  841  vim first-app/values.yaml
  842  vim first-app/templates/deployment.yaml
  843  vim first-app/values.yaml
  844  vim first-app/templates/deployment.yaml
  845  vim first-app/values.yaml
  846  vim first-app/templates/deployment.yaml
  847  vim first-app/templates/ingress.yaml
  848  vim first-app/values.yaml
  849  helm package first-app
  850  ls -l
  851  mv first-app-0.1.0.tgz ../helm-releases/
  852  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  853  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  854  helm unistall first-app
  855  helm uninstall first-app
  856  cd ../
  857  ls
  858  git init
  859  git status
  860  git add --all
  861  git commit -m "First release"
  862  git config --global user.email "pluhin@gmail.com"
  863  git config --global user.name "Siarhei Pishchyk"
  864  git commit -m "First release"
  865  git remote add origin git@github.com:pluhin/helm-25-23.git
  866  git push -u origin master
  867  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  868  helm repo index --url https://pluhin.github.io/helm-25-23/
  869  helm repo index --url https://pluhin.github.io/helm-25-23/ .
  870  vim index.yaml
  871  git add --all
  872  git commit -m "Add first version"
  873  git push
  874  vim helm-source/first-app/Chart.yaml
  875  cd helm-source/
  876  ls
  877  vim first-app/templates/deployment.yaml
  878  vim first-app/values.yaml
  879  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  880  vim first-app/values.yaml
  881  vim first-app/templates/deployment.yaml
  882  vim first-app/Chart.yaml
  883  helm package first-app
  884  helm install first-app --dry-run first-app-0.2.0.tgz -n default
  885  vim first-app/templates/pvc.yaml
  886  vim first-app/values.yaml
  887  vim first-app/templates/pvc.yaml
  888  vim first-app/values.yaml
  889  helm package first-app
  890  vim first-app/values.yaml
  891  vim first-app/templates/pvc.yaml
  892  helm package first-app
  893  ls
  894  mv first-app-0.2.0.tgz ../helm-releases/
  895  cd ../
  896  history | grep url
  897  helm repo index --url https://pluhin.github.io/helm-25-23/ --merge index.yaml .
  898  vim index.yaml
  899  git add --all
  900  git commit -m "version 0.2.0"
  901  git push
  902  helm repo add helm-25-23 https://pluhin.github.io/helm-25-23/
  903  helm repo update
  904  helm search repo helm-25-23 -l
  905  helm install --dry-run first-app helm-25-23/first-app --version 0.2.0
  906  helm install first-app helm-25-23/first-app --version 0.2.0 -n default
  907  helm uninstall first-app
  908  cd ../06.Ansible/
  909  ls
  910  vim mariadb.yaml
  911  vim inv.yaml
  912  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb
  913  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  914  helm install joomla oci://registry-1.docker.io/bitnamicharts/joomla
  915  helm install joomla
  916  helm uninstall joomla
  917  helm repo add my-repo https://charts.bitnami.com/bitnami
  918  helm search repo my-repo -l
  919  helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=192.168.202.XX,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.storageClass=nfs,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-15.sa  my-repo/joomla
  920  helm unistall sa-joomla
  921  helm uninstall sa-joomla
  922  helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=192.168.202.XX,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.storageClass=nfs,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-15.sa,ingress.annotations="kubernetes.io/ingress.class: nginx"  my-repo/joomla
  923  vim inv.yaml
  924  sudo apt install mysql-client
  925  mysql -h 192.168.202.XX -u bn_joomla -p
  926  vim mariadb.yaml
  927  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pass -t never
  928  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pass
  929  history
```