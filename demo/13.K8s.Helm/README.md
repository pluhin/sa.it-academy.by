## 13.K8s.Helm

```bash
575  mkdir 13.K8s.Helm
  576  cd 13.K8s.Helm/
  577  mkdir {helm-releases,helm-sources}
  578  ls
  579  cd helm-
  580  cd helm-sources/
  581  ls
  582  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  583  chmod +x get_helm.sh
  584  ./get_helm.sh
  585  helm
  586  clear
  587  rm get_helm.sh
  588  ls
  589  helm create first-app
  590  ls -l first-app/
  591  vim first-app/Chart.yaml
  592  ls -l first-app/
  593  ls -l first-app/charts/
  594  ls -l first-app/templates/
  595  ls -l first-app/templates/tests/test-connection.yaml
  596  vim first-app/templates/tests/test-connection.yaml
  597  vim first-app/templates/deployment.yaml
  598  vim first-app/templates/_helpers.tpl
  599  vim first-app/templates/deployment.yaml
  600  vim first-app/templates/hpa.yaml
  601  vim first-app/values.yaml
  602  vim first-app/Chart.yaml
  603  helm package first-app
  604  ls
  605  mc
  606  mv first-app-0.1.0.tgz ../helm-releases/
  607  cd ../
  608  helm install first-app helm-releases/first-app-0.1.0.tgz -n default --dry-run
  609  helm install first-app helm-releases/first-app-0.1.0.tgz -n default
  610  helm uninstall first-app
  611  vim helm-sources/first-app/templates/NOTES.txt
  612  ls
  613  git init
  614  git add --all
  615  git commit -m "Init commit"
  616  git remote add origin git@github.com:pluhin/helm-30-24.git
  617  git push -u origin master
  618  git pull
  619  helm repo index --url "https://pluhin.github.io/helm-30-24/" .
  620  vim index.yaml
  621  git add --all
  622  git commit -m "add version 1.0"
  623  git push
  624  helm repo add helm-30-24 https://pluhin.github.io/helm-30-24/
  625  helm search repo helm-30-24
  626  helm repo update
  627  helm search repo helm-30-24
  628  helm install firs-app helm-30-24/first-app --version 0.1.0 -n default
  629  helm uninstall firs-app
  630  vim helm-sources/first-app/templates/pvc.yaml
  631  vim helm-sources/first-app/values.yaml
  632  vim helm-sources/first-app/templates/deployment.yaml
  633  vim helm-sources/first-app/values.yaml
  634  vim helm-sources/first-app/Chart.yaml
  635  helm pachage helm-sources/first-app
  636  helm package helm-sources/first-app
  637  ls
  638  mc
  639  mv first-app-0.2.0.tgz helm-releases/
  640  history | grep index
  641  helm repo index --url "https://pluhin.github.io/helm-30-24/" --merge index.yaml .
  642  vim index.yaml
  643  git add --all
  644  git commit -m "add v2"
  645  git push
  646  helm repo update
  647  helm search repo helm-30-24
  648  helm repo update
  649  helm search repo helm-30-24
  650  helm search repo helm-30-24 -l
  651  helm install firs-app helm-30-24/first-app --version 0.2.0 -n default
  652  cd ../06.Ansible.WorkShop/
  653  ls
  654  vim mariadb.yaml
  655  vim inv.yaml
  656  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=bn_joomla -e user_db=bn_joomla -e pass_db=bn_joomla -l mariadb -u root --ask-pas
  657  helm install my-joomla --set mariadb.enabled=false,externalDatabase.host=192.168.202.26,externalDatabase.password=bn_joomla,externalDatabase.user=bn_joomla,externalDatabase.database=bn_joomla,global.defaultStorageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-25.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/joomla
  658  helm uninstall my-joomla
  659  helm install my-joomla --set global.defaultStorageClass=nfs-client,joomlaUsername=admin,joomlaPassword=joomla,ingress.enabled=true,ingress.hostname=joomla-sa.k8s-25.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/joomla
  660  history
```