
```bash
 614  mkdir 13.K8s.Helm
  615  cd 13.K8s.Helm/
  616  ls
  617  cd helm-releases/
  618  cd ../helm-sources/
  619  ls
  620  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  621  chmod 700 get_helm.sh
  622  ./get_helm.sh
  623  ls
  624  rm get_helm.sh
  625  helm
  626  helm create first-app
  627  ls
  628  ls first-app/
  629  vim first-app/Chart.yaml
  630  ls -l first-app/templates/
  631  vim first-app/templates/_helpers.tpl
  632  vim first-app/templates/deployment.yaml
  633  vim first-app/values.yaml
  634  vim first-app/templates/ingress.yaml
  635  vim first-app/values.yaml
  636  helm package first-app
  637  ls
  638  mc
  639  mv first-app-0.1.0.tgz ../helm-releases/
  640  helm install first-app helm-releases/first-app-0.1.0.tgz -n default --dry-run
  641  cd ../
  642  helm install first-app helm-releases/first-app-0.1.0.tgz -n default --dry-run
  643  helm install first-app helm-releases/first-app-0.1.0.tgz -n default
  644  helm uninstall first-app
  645  ls helm-releases/
  646  ls -l helm-releases/
  647  git init
  648  git add --all
  649  git commit -m "Init commit"
  650  git remote add origin git@github.com:pluhin/helm-31-25.git
  651  git push -u origin master
  652  git pull
  653  vim index.html
  654  helm repo index --url "https://pluhin.github.io/helm-31-25/" .
  655  vim index.yaml
  656  git add --all
  657  git commit -m "add version 1.0"
  658  git push
  659  helm search repo helm-31-25
  660  helm install first-app helm-31-25/first-app --version 0.1.0 -n default
  661  helm uninstall first-app
  662  vim helm-sources/first-app/templates/pvc.yaml
  663  vim helm-sources/first-app/values.yaml
  664  vim helm-sources/first-app/templates/deployment.yaml
  665  vim helm-sources/first-app/values.yaml
  666  vim helm-sources/first-app/Chart.yaml
  667  helm package helm-sources/first-app
  668  ls
  669  mv first-app-0.2.0.tgz helm-releases/
  670  ls
  671  ls helm-sources/
  672  helm repo index --url "https://pluhin.github.io/helm-31-25/" --merge index.yaml .
  673  vim index.yaml
  674  git add --all
  675  git commit -m "version 2.0"
  676  git push
  677  helm search repo helm-31-25
  678  helm search repo helm-31-25 -l
  679  helm repo update
  680  helm search repo helm-31-25 -l
  681  helm install first-app helm-31-25/first-app --version 0.2.0 -n default
  682  helm uninstall first-app
  683  helm install my-drupal   --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword   --set global.defaultStorageClass=nfs-client   --set ingress.enabled=true   --set ingress.ingressClassName=nginx   --stet ingress.hostname=drupal.k8s-25.sa     oci://registry-1.docker.io/bitnamicharts/drupal
  684  helm install my-drupal   --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword   --set global.defaultStorageClass=nfs-client   --set ingress.enabled=true   --set ingress.ingressClassName=nginx   --set ingress.hostname=drupal.k8s-25.sa     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  685  history


helm install my-drupal \
  --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword \
  --set global.defaultStorageClass=nfs-client \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=nginx \
  --set ingress.hostname=drupal.k8s-25.sa \
    oci://registry-1.docker.io/bitnamicharts/drupal -n default
```
