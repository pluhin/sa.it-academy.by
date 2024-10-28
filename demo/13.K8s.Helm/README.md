## 13.Helm

```bash
  640  mkdir 13.K8s.Helm
  641  cd 13.K8s.Helm/
  642  ls
  643  mkdir {helm-releases,helm-sources}
  644  ls -ls
  645  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  646  chmod +x get_helm.sh
  647  ./get_helm.sh
  648  helm
  649  rm get_helm.sh
  650  helm version
  651  cd helm-sources/
  652  helm create first-app
  653  ls -l first-app/
  654  vim first-app/Chart.yaml
  655  vim first-app/values.yaml
  656  vi ../../12.K8s.Data/app.yaml
  657  vim first-app/values.yaml
  658  vi ../../12.K8s.Data/app.yaml
  659  vim first-app/values.yaml
  660  vim first-app/templates/deployment.yaml
  661  vim first-app/templates/_helpers.tpl
  662  vim first-app/templates/deployment.yaml
  663  vim first-app/values.yaml
  664  vim first-app/templates/deployment.yaml
  665  vim first-app/templates/ingress.yaml
  666  helm package first-app
  667  ls -l
  668  vim first-app/Chart.yaml
  669  mc
  670  mv first-app-0.1.0.tgz ../helm-releases/
  671  helm install first-app --dry-run ../helm-releases/first-app-0.1.0.tgz -n default
  672  vim first-app/templates/NOTES.txt
  673  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  674  helm uninstall first-app
  675  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  676  helm uninstall first-app
  677  cd ../
  678  git init
  679  git add --all
  680  git commit -m "first commit"
  681  git remote add origin git@github.com:pluhin/heml-29-24.git
  682  git push -u origin master
  683  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  684  git remote rename origin origin-wrong
  685  git remote add origin git@github.com:pluhin/helm-29-24.git
  686  git push -u origin master
  687  git pull
  688  helm repo index --url "https://pluhin.github.io/helm-29-24/" .
  689  vim index.yaml
  690  git staus
  691  git status
  692  git add --all
  693  git commit -m "Add first version"
  694  git push
  695  helm repo add helm-29-24 https://pluhin.github.io/helm-29-24/
  696  helm install first-app helm-29-24/first-app --version 0.1.0 -n default
  697  helm uninstall first-app
  698  cd helm-sources/
  699  ls
  700  vim first-app/Chart.yaml
  701  vim first-app/templates/deployment.yaml
  702  vim first-app/templates/pvc.yaml
  703  vim first-app/values.yaml
  704  vim first-app/templates/deployment.yaml
  705  vim first-app/values.yaml
  706  vim first-app/templates/pvc.yaml
  707  helm package first-app
  708  ls -l
  709  mv first-app-0.2.0.tgz ../helm-releases/
  710  ls -l ../helm-releases/
  711  cd ../
  712  history | grep repo
  713  helm repo index --url "https://pluhin.github.io/helm-29-24/" --merge index.yaml .
  714  vim index.yaml
  715  git add --all
  716  git commit -m "Version 0.2.0"
  717  git push
  718  helm repo update
  719  helm search repo helm-29-24 -l
  720  helm repo update
  721  helm search repo helm-29-24 -l
  722  helm install first-app helm-29-24/first-app --version 0.2.0 -n default
  723  helm uninstall first-app
  724  cd ../06.Ansible.workshop/
  725  vim inv.yaml
  726  vim mariadb.yaml
  727  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  728  vim mariadb.yaml
  729  vim inv.yaml
  730  vim mariadb.yaml
  731  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  732  vim /home/user/.ssh/known_hosts
  733  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  734  vim /home/user/.ssh/known_hosts
  735  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  736  helm install my-joomla --set mariadb.enabled=false,externalDatabase.host=192.168.202.26,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.defaultStorageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-25.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/joomla
  737  history
  738  echo "Ym5fam9vbWxh" | base64 -d
  739  helm uninstall my-joomla
  740  helm install my-joomla --set global.defaultStorageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-25.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/joomla
  741  history
```

