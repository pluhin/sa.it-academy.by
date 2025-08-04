```bash
 640  cd  /tm
  641  cd  /tmp/
  642  git clone git@github.com:andybar69/sa.it-academy.by.git
  643  cd  sa.it-academy.by/
  644  git checkout md-sa2-32-25
  645  git remote add up git@github.com:pluhin/sa.it-academy.by.git
  646  git fetch up/md-sa2-32-25
  647  git fetch up
  648  ls -l
  649  git rebase up/md-sa2-32-25
  650  vim Andrei_Barabash/06.Ansible.workshop/README.md
  651  git add Andrei_Barabash/06.Ansible.workshop/README.md
  652  git rebase --continue
  653  ls -l
  654  git push origin -f
  655  history
  656  cd ~
  657  mkdir 13.K8s.Helm/{helm-releases,helm-sources}
  658  mkdir -p 13.K8s.Helm/{helm-releases,helm-sources}
  659  cd  13.K8s.Helm/
  660  ls
  661  cd helm-releases/
  662  cd ../helm-sources/
  663  ls
  664  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  665  chmod 700 get_helm.sh
  666  ./get_helm.sh
  667  ls
  668  rm get_helm.sh
  669  git pull
  670  helm
  671  helm create first-app
  672  vim first-app/Chart.yaml
  673  vim first-app/templates/_helpers.tpl
  674  vim first-app/templates/deployment.yaml
  675  vim first-app/templates/ingress.yaml
  676  vim first-app/values.yaml
  677  vim ../../12.K8s.Data.Security/app.yaml
  678  vim first-app/values.yaml
  679  vim first-app/templates/deployment.yaml
  680  vim first-app/values.yaml
  681  helm package first-app
  682  ls -l
  683  ls -l first-app
  684  ls -l first-app -a
  685  mc
  686  mv first-app-0.1.0.tgz ../helm-releases/
  687  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n defualt --dry-run
  688  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n defualt
  689  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  690  helm uninstall first-app
  691  cd ../
  692  ls -l
  693  git init
  694  git add --all
  695  git status
  696  git commit -m "init commit"
  697  git remote add origin git@github.com:pluhin/helm-32-25.git
  698  git push
  699  git push --set-upstream origin master
  700  ls
  701  vim inidex.html
  702  helm repo index --url "https://pluhin.github.io/helm-32-25/" .
  703  mv inidex.html index.html
  704  ls -l
  705  vim index.yaml
  706  git add --all
  707  git commit -m "add index"
  708  git push
  709  helm repo add helm-32-25 https://pluhin.github.io/helm-32-25/
  710  git repo update
  711  helm repo update
  712  helm search repo helm-32-25 -l
  713  helm install first-app helm-32-25/first-app --version 0.1.0 -n default
  714  helm unistall helm-32-25/first-app
  715  helm uninstall helm-32-25/first-app
  716  helm uninstall first-app
  717  cd  helm-sources/
  718  vim helm-sources/first-app/templates/pvc.yaml
  719  cd ../
  720  vim helm-sources/first-app/templates/pvc.yaml
  721  vim helm-sources/first-app/values.yaml
  722  vim helm-sources/first-app/templates/deployment.yaml
  723  helm package helm-sources/first-app
  724  ls
  725  mv first-app-0.1.0.tgz helm-releases/
  726  rm helm-releases/first-app-0.1.0.tgz
  727  wget https://github.com/pluhin/helm-32-25/blob/master/helm-releases/first-app-0.1.0.tgz -O helm-releases/first-app-0.1.0.tgz
  728  ls -l helm-releases/first-app-0.1.0.tgz
  729  mc
  730  wget https://github.com/pluhin/helm-32-25/raw/refs/heads/master/helm-releases/first-app-0.1.0.tgz -O helm-releases/first-app-0.1.0.tgz
  731  mc
  732  git status
  733  vim helm-sources/first-app/Chart.yaml
  734  helm package helm-sources/first-app
  735  mv first-app-0.2.0.tgz helm-releases/
  736  ls -l helm-releases/
  737  helm repo index --url "https://pluhin.github.io/helm-32-25/" --merge index.yaml .
  738  vim index.
  739  vim index.yaml
  740  git add --all
  741  git commit -m "add version 2"
  742  git push
  743  helm repo update
  744  helm search repo helm-32-25 -l
  745  helm install first-app helm-32-25/first-app --version 0.2.0 -n default
  746  helm uninstall first-app
  747  helm install my-drupal   --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword   --set global.defaultStorageClass=nfs-client   --set ingress.enabled=true   --set ingress.ingressClassName=nginx   --set ingress.hostname=drupal.k8s-11.sa     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  748  history
```