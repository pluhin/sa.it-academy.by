```bash
  700  mkdir 14.K8s
  701  cd 14.K8s/
  702  ls
  703  mkdir -p {helm-releases,helm-sources}
  704  cd helm-sources/
  705  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
  706  chmod 700 get_helm.sh
  707  ./get_helm.sh
  708  helm
  709  helm version
  710  rm get_helm.sh
  711  helm create first-app
  712  ls
  713  ls -l first-app/
  714  vim first-app/Chart.yaml
  715  vim first-app/values.yaml
  716  vim first-app/templates/
  717  vim first-app/templates/serviceaccount.yaml
  718  vim first-app/templates/_helpers.tpl
  719  kubectl delete ../../13.K8s.Data/app.yaml
  720  kubectl delete -f ../../13.K8s.Data/app.yaml
  721  vim  ../../13.K8s.Data/app.yaml
  722  vim first-app/values.yaml
  723  vim first-app/templates/virtualservice.yaml
  724  vim first-app/values.yaml
  725  vim first-app/templates/gateway.yaml
  726  helm install first-app ./first-app/ -n default --dry-run
  727  helm install first-app ./first-app/ -n default
  728  vim first-app/templates/gateway.yaml
  729  vim first-app/values.yaml
  730  helm uninstall first-app
  731  helm package first-app
  732  ls -l
  733  mv first-app-0.1.0.tgz ../helm-releases/
  734  ls
  735  cd ../
  736  git init
  737  git add --alll
  738  git add --all
  739  git commit -m "Init commit"
  740  git remote add origin git@github.com:pluhin/helm-36-26.git
  741  git push --set-upstream origin master
  742  helm repo index --url "https://pluhin.github.io/helm-36-26/" .
  743  vim index.yaml
  744  git add index.yaml
  745  git commit -m "Add index file"
  746  gt push
  747  git push
  748  helm repo add helm-36-26 https://pluhin.github.io/helm-36-26/
  749  helm search repo helm-36-26 -l
  750  helm install helm-36-26/first-app -n default
  751  helm install first-app helm-36-26/first-app -n default
  752  cd helm-releases/
  753  cd ../helm-sources/
  754  vim first-app/templates/pvc.yaml
  755  vim first-app/values.yaml
  756  vim first-app/templates/deployment.yaml
  757  vim first-app/values.yaml
  758  vim first-app/Chart.yaml
  759  helm pchage first-app
  760  helm package first-app
  761  mv first-app-0.2.0.tgz ../helm-releases/
  762  cd ../
  763  helm repo index --url "https://pluhin.github.io/helm-36-26/" --merge index.yaml .
  764  vim index.yaml
  765  git add --all
  766  git commit -m "Add 0.2.0"
  767  git push
  768  helm repo update
  769  helm search repo helm-36-26
  770  helm repo update
  771  helm search repo helm-36-26
  772  helm search repo helm-36-26 -l
  773  helm install first-app helm-36-26/first-app -n default --version 0.2.0
  774  helm update first-app helm-36-26/first-app -n default --version 0.2.0
  775  helm upgrade first-app helm-36-26/first-app -n default --version 0.2.0
  776  helm install my-drupal   --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword
  777  helm install my-drupal   --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword --set global.defaultStorageClass=nfs-client      --set image.registry=docker.io     --set image.repository=bitnamilegacy/drupal     --set mariadb.image.registry=docker.io     --set mariadb.image.repository=bitnamilegacy/mariadb     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  778  vim istio-drupal.yaml
  779  kubectl apply -f istio-drupal.yaml
  780  history
```