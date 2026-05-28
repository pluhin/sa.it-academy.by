https://pluhin.github.io/helm-35-26/

https://github.com/pluhin/helm-35-26

```bash
  605  mkdir 13.K8s.Helm
  606  cd 13.K8s.Helm/
  607  ls
  608  mkdir -p {helm-releases,helm-sources}
  609  cd helm-sources/
  610  ls
  611  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
  612  chmod 700 get_helm.sh
  613  ./get_helm.sh
  614  helm
  615  helm -help
  616  helm --help
  617  helm version
  618  rm get_helm.sh
  619  ls
  620  helm create first-app
  621  ls
  622  vim first-app/templates/ingress.yaml
  623  vim first-app/templates/_helpers.tpl
  624  kubectl  delete -f ../../12.K8s.Data.Secrets/app.yaml
  625  vim  ../../12.K8s.Data.Secrets/app.yaml
  626  vim first-app/values.yaml
  627  vim first-app/Chart.yaml
  628  vim first-app/values.yaml
  629  vim first-app/templates/gateway.yaml
  630  vim first-app/templates/virtualservice.yaml
  631  vim first-app/values.yaml
  632  helm install first-app ./first-app/ -n default --dry-run
  633  helm install first-app ./first-app/ -n default
  634  helm uninstall first-app
  635  helm package first-app
  636  ls
  637  mc
  638  mv first-app-0.1.0.tgz ../helm-releases/
  639  cd ../
  640  git init
  641  git add --all
  642  git commit -m "Init commit"
  643  git remote add origin git@github.com:pluhin/helm-35-26.git
  644  git push --set-upstream origin master
  645  helm repo index --url "https://pluhin.github.io/helm-35-26/" .
  646  vim index.yaml
  647  git add index.yaml
  648  git commit -m "Add index file"
  649  git push
  650  helm repo add helm-35-26 https://pluhin.github.io/helm-35-26/
  651  helm search repo helm-35-26 -l
  652  helm install first-app helm-35-26/first-app -n default
  653  helm uninstall first-app
  654  cd helm-sources/
  655  vim first-app/templates/pvc.yaml
  656  vim first-app/values.yaml
  657  vim first-app/templates/deployment.yaml
  658  vim first-app/Chart.yaml
  659  helm package first-app/
  660  ls
  661  mv first-app-0.2.0.tgz ../helm-releases/
  662  cd../
  663  cd ../
  664  ls -l helm-releases/
  665  helm repo index --url "https://pluhin.github.io/helm-35-26/" --merge index.yaml .
  666  vim index.yaml
  667  git add --all
  668  git commit -m "Add v0.2.0"
  669  git push
  670  helm repo update
  671  helm search repo helm-35-26 -l
  672  helm repo update
  673  helm search repo helm-35-26 -l
  674  helm repo update
  675  helm search repo helm-35-26 -l
  676  helm repo update
  677  helm search repo helm-35-26 -l
  678  helm install first-app helm-35-26/first-app -n default  --version 0.2.0
  679  helm uninstall first-app
  680  helm install my-drupal     --set drupalUsername=admin,drupalPassword=XXXXX,mariadb.auth.rootPassword=XXXXXX     --set global.defaultStorageClass=nfs-client      --set image.registry=docker.io     --set image.repository=bitnamilegacy/drupal     --set mariadb.image.registry=docker.io     --set mariadb.image.repository=bitnamilegacy/mariadb     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  681  vim istio-drupal.yaml
  682  kubectl apply -f istio-drupal.yaml
  683  curl -H "Host: drupal-helm.k8s-15.sa" http://192.168.208.15:31989
  684  vim istio-drupal.yaml
  685  kubectl apply -f istio-drupal.yaml
  686  history
```