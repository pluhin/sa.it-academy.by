
Sorry, looks like history was not saved. I added history from my notes

https://github.com/pluhin/helm-28-24


```bash
  708  mkdir helm-releases
  709  mkdir helm-sources
  710  helm
  711  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  712  ls
  713  chmod +x get_helm.sh
  714  ./get_helm.sh
  715  rm get_helm.sh
  716  helm
  717  helm version
  718  cd  helm-sources/
  720  helm create first-app

  722  ls first-app/
  723  vim first-app/Chart.yaml
  724  vim first-app/values.yaml
  725  vim first-app/templates/deployment.yaml
  726  vim first-app/templates/hpa.yaml
  727  vim first-app/templates/_helpers.tpl
  728  vim first-app/templates/deployment.yaml
  729  vim first-app/values.yaml
  730  vim ../../12.K8s.Data.Secrets/app.yaml
  731  vim first-app/values.yaml
  732  vim first-app/templates/service
  733  vim first-app/templates/service.yaml
  734  vim first-app/values.yaml
  735  vim first-app/templates/ingress.yaml
  736  helm package first-app
  737  ls -l
  738  mv first-app-0.1.0.tgz ../helm-releases/
  739  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  740  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  741  helm uninstall first-app

  744  git init
  748  git add --all
  749  git commit -m "First release"
  750  git config --global user.email "pluhin@gmail.com"
  751  git config --global user.name "Siarhei Pishchyk"
  752  git commit -m "First release"
  753  git remote add origin git@github.com:pluhin/helm-28-24.git
  754  git push -u origin master
  755  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  756  helm repo index --url "https://pluhin.github.io/helm-28-24/" .
  757  vim index.yaml
  758  git add --all
  759  git commit -m "Add first version"
  760  git push
  761  cd ../tmp
  762  cd /tmp/
  763  ls
  764  helm repo add helm-28-24 https://pluhin.github.io/helm-28-24/
  765  helm repo update
  766  helm search repo helm-28-24 -l
  767  helm install fist-app helm-28-24/first-app -n default
  768  helm uninstall first-app
  769  helm uninstall first-app
  770  helm uninstall fist-app

  773  cd helm-sources/

  791  helm package first-app

  794  helm install first-app --dry-run ./first-app-0.2.0.tgz -n default
  795  vim first-app/Chart.yaml
  796  vim first-app/values.yaml
  797  helm package first-app
  798  helm install first-app --dry-run ./first-app-0.2.0.tgz -n default
  799  mv first-app-0.2.0.tgz ../helm-releases/
  800  ls ../helm-releases/
  801  cd ../
helm repo index --url https://pluhin.github.io/helm-28-24/ --merge index.yaml .
  803  vim index.yaml
  804  git add --all
  805  git commit -m "Second version"
  806  git push
  807  cd ../
  808  helm repo update
  809  helm search helm-28-24 -l
  810  helm search repo helm-28-24 -l
  811  history | grep install
  812  helm install fist-app helm-28-24/first-app --version 0.2.0 -n default
  813  cd 06.Ansible/
  814  ls
  815  vim mysql.yaml
  816  vim mariadb.yaml
  817  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  818  vim inv.yaml
  819  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  820  helm install my-joomla --set mariadb.enabled=false,externalDatabase.host=192.168.202.17,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-17.sa oci://registry-1.docker.io/bitnamicharts/joomla
  821  helm install my-joomla --set mariadb.enabled=false,externalDatabase.host=192.168.202.17,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-17.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/joomla
  822  history
```