# Helm and Secrets 

```bash
 588  mkdir secrets_helm
  589  cp first_deploy/app.yaml secrets_helm/
  590  cd secrets_helm/
  591  ls -l
  592  vim app.yaml
  593  echo -n "iampassword" | base64
  594  echo "XXXXXXXX" | base64 -d
  595  vim app.yaml
  596  ps aux | grep 127
  597  history | 127
  598  history |  grep 127
  599  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.57 -f -N
  600  kubectl get ns
  601  kubectl apply -f app.yaml
  602  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.17.5/kubeseal-0.17.5-linux-amd64.tar.gz
  603  history | grep tar
  604  tar -zxvf kubeseal-0.17.5-linux-amd64.tar.gz
  605  ls
  606  sudo mv kubeseal /usr/local/bin
  607  mc
  608  ls
  609  kubeseal version
  610  kubeseal --version
  611  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.17.5/controller.yaml
  612  vim app.yaml
  613  kubectl deleter secret secret-from-manifest
  614  kubectl delete secret secret-from-manifest
  615  vim app.yaml
  616  vim inital_secret.yaml
  617  cat inital_secret.yaml | kubeseal --format yaml > seald-secret.yaml
  618  vim seald-secret.yaml
  619  kubectl apply -f seald-secret.yaml
  620  vim seald-secret.yaml
  621  mv seald-secret.yaml sealed-secret.yaml
  622  kubectl exec -it webserver-9bd599dfb-q8fn5 -- bash
  623  kubectl get secret secret-from-manifest > new_secret.yaml
  624  vim new_secret.yaml
  625  kubectl get secret secret-from-manifest -o yaml > new_secret.yaml
  626  vim new_secret.yaml
  627  history | grep base
  628  echo -n "iampassword" | base64
  629  echo -n "iNEWpassword" | base64
  630  vim new_secret.yaml
  631  kubectl --format=yaml < new_secret.yaml > new_sealed_secret.yaml
  632  kubeseal --format=yaml < new_secret.yaml > new_sealed_secret.yaml
  633  vim new_sealed_secret.yaml
  634  kubectl apply -f new_sealed_secret.yaml
  635  kubectl exec -it webserver-9bd599dfb-zvdd8 -- bash
  636  clear
  637  cd /tmp/
  638  cd -
  639  pwd
  640  ls
  641  git clone git@github.com:pluhin/helm-test.git
  642  cd helm-test/
  643  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  644  mkdir demo_app
  645  cd demo_app/
  646  helm
  647  wget https://get.helm.sh/helm-v3.9.0-linux-amd64.tar.gz
  648  history | grep tar
  649  tar -zxvf helm-v3.9.0-linux-amd64.tar.gz
  650  mv linux-amd64/helm /usr/local/bin/helm
  651  sudo mv linux-amd64/helm /usr/local/bin/helm
  652  ls -l /usr/local/bin/helm
  653  helm
  654  helm --version
  655  helm -version
  656  helm -v
  657  helm version
  658  helm create first-app
  659  ls -l first-app/
  660  vim first-app/Chart.yaml
  661  helm package first-app
  662  ls -l
  663  rm helm-v3.9.0-linux-amd64.tar.gz
  664  rm -rf linux-amd64
  665  ls -l
  666  helm repo index --url https://pluhin.github.io/helm-test/ .
  667  ls
  668  mv index.yaml ../
  669  vim ../index.yaml
  670  git add --all
  671  git commit -m "First version"
  672  git push
  673  vim ../index.yaml
  674  cd /tmp/
  675  helm repo add https://pluhin.github.io/helm-test/
  676  helm repo add helm_test https://pluhin.github.io/helm-test/
  677  helm repo upgrade
  678  helm repo update
  679  helm repo remove plu_test
  680  helm repo update
  681  helm search repo app
  682  helm search repo app -l
  683  cd -
  684  vim first-app/values.yaml
  685  vim first-app/Chart.yaml
  686  helm package first-app
  687  ls -l
  688  git add --all
  689  git commit -m "Version 2"
  690  helm repo index --url https://pluhin.github.io/helm-test/ --merge index.yaml .
  691  git commit --amend -a
  692  git push
  693  helm repo update
  694  helm search repo app -l
  695  helm repo update
  696  helm search repo app -l
  697  ls
  698  rm index.yaml
  699  cd ../
  700  helm repo index --url https://pluhin.github.io/helm-test/ --merge index.yaml .
  701  vim index.yaml
  702  git commit --amend -a
  703  git push origin -f
  704  helm repo update
  705  helm search repo app -l
  706  helm search repo app
  707  helm repo update
  708  helm search repo app -l
  709  helm install app-demo helm_test/first-app
  710  vim demo_app/first-app/values.yaml
  711  vim demo_app/first-app/templates/pv.yaml
  712  vim demo_app/first-app/templates/pvc.yaml
  713  vim demo_app/first-app/templates/pv.yaml
  714  vim demo_app/first-app/templates/deployment.yaml
  715  vim demo_app/first-app/Chart.yaml
  716  helm repo index --url https://pluhin.github.io/helm-test/ --merge index.yaml .
  717  vim index.yaml
  718  cd demo_app/
  719  helm package first-app
  720  ls
  721  cd ../
  722  helm repo index --url https://pluhin.github.io/helm-test/ --merge index.yaml .
  723  git add --all
  724  git commit -m "Add PV and PVC"
  725  git push
  726  helm repo update
  727  helm search repo app -l
  728  helm repo update
  729  helm search repo app -l
  730  helm update app-demo helm_test/first-app
  731  helm upgrade app-demo helm_test/first-app
  732  helm uninstall app-demo
  733  cd ../
  734  ls
  735  helm repo add bitnami https://charts.bitnami.com/bitnami
  736  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  737  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner     --set nfs.server=x.x.x.x helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner     --set nfs.server=192.168.37.105
  738  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner     --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-20-22/
  739  helm install sa-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  740  vim joomla_ingress.yaml
  741  kubectl apply -f joomla_ingress.yaml
  742  vim joomla_ingress.yaml
  743  kubectl apply -f joomla_ingress.yaml
  744  helm unistall sa-joomla
  745  helm uninstall sa-joomla
  746  helm install sa-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  747  history
```

