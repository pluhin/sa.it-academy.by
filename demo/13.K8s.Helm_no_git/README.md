```bash
helm install my-drupal \
    --set drupalUsername=admin,drupalPassword=XXXXX,mariadb.auth.rootPassword=XXXXXX \
    --set global.defaultStorageClass=nfs-client  \
    --set image.registry=docker.io \
    --set image.repository=bitnamilegacy/drupal \
    --set mariadb.image.registry=docker.io \
    --set mariadb.image.repository=bitnamilegacy/mariadb \
    --set ingress.enabled=true \
    --set ingress.ingressClassName=nginx \
    --set ingress.hostname=drupal.k8s-19.sa \
    oci://registry-1.docker.io/bitnamicharts/drupal -n default
```

```bash
  583  mkdir 13.K8s.Helm/{helm-releases,helm-sources}
  584  mkdir -p 13.K8s.Helm/{helm-releases,helm-sources}
  585  cd 13.K8s.Helm/
  586  cd helm-sources/
  587  helm
  588  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
  589  chmod 700 get_helm.sh
  590  kubectl get nodes
  591  ./get_helm.sh
  592  helm
  593  ls
  594  rm get_helm.sh
  595  helm create first-app
  596  vim first-app/Chart.yaml
  597  vim first-app/values.yaml
  598  vim first-app/templates/ingress.yaml
  599  vim first-app/templates/_helpers.tpl
  600  cat ../../12.K8s.Data/app.yaml
  601  cat ../../12.K8s.Data/app.yaml /image
  602  cat ../../12.K8s.Data/app.yaml | grep image
  603  vim first-app/values.yaml
  604  kubectl get ingressclass
  605  vim first-app/values.yaml
  606  kubectl get ingress -n default
  607  kubectl get ingress ingress-sa -n default -o yaml
  608  wq
  609  vim first-app/values.yaml
  610  vim first-app/templates/ingress.yaml
  611  vim first-app/templates/deployment.yaml
  612  vim first-app/values.yaml
  613  helm install first-app ./first-app/ -n default --dry-run
  614  helm package first-app
  615  mc
  616  mv first-app-0.1.0.tgz ../helm-releases/
  617  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default --dry-run
  618  cd ../
  619  git init
  620  git add --all
  621  git commit -m "init commit"
  622  git remote add origin git@github.com:pluhin/helm-33-25.git
  623  git push --set-upstream origin master
  624  helm repo index --url "https://pluhin.github.io/helm-33-25/" .
  625  cat index.yaml
  626  vim index.html
  627  git add --all
  628  git commit -m "add index"
  629  git push
  630  helm repo add helm-33-25 https://pluhin.github.io/helm-33-25/
  631  helm repo update
  632  helm search repo helm-33-25 -l
  633  helm install first-app helm-33-25/first-app -n default --dry-run
  634  helm install first-app helm-33-25/first-app -n default
  635  kubectl get pods
  636  helm uninstall first-app
  637  kubectl get pods
  638  vim helm-sources/first-app/templates/pvc.yaml
  639  vim helm-sources/first-app/values.yaml
  640  kubectl get storageclass
  641  vim helm-sources/first-app/values.yaml
  642  vim helm-sources/first-app/templates/deployment.yaml
  643  helm install first-app helm-sources/first-app -n default --dry-run
  644  vim helm-sources/first-app/Chart.yaml
  645  helm pachage helm-sources/first-app
  646  helm package helm-sources/first-app
  647  mv first-app-0.2.0.tgz helm-releases/
  648  mc
  649  helm repo index --url "https://pluhin.github.io/helm-33-25/" --merge index.yaml .
  650  cat index.yaml
  651  git add --all
  652  git commit -m "add new version"
  653  git push
  654  helm repo update
  655  helm search repo helm-33-25 -l
  656  helm repo update
  657  helm search repo helm-33-25 -l
  658  helm install first-app helm-33-25/first-app --version 0.2.0
  659  k8s
  660  k9s
  .....
  677  helm install my-drupal     --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword     --set global.defaultStorageClass=nfs-client      --set image.registry=docker.io     --set image.repository=bitnamilegacy/drupal     --set mariadb.image.registry=docker.io     --set mariadb.image.repository=bitnamilegacy/mariadb     --set ingress.enabled=true     --set ingress.ingressClassName=nginx     --set ingress.hostname=drupal.k8s-19.sa     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  678  history
```