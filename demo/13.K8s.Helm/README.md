# 13.K8s.Helm

```bash
622  mkdir 13.K8s.Helm
  623  cd 13.K8s.Helm/
  624  helm
  625  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  626  ls
  627  sh get_helm.sh
  628  bash get_helm.sh
  629  helm version
  630  ls -l /home/vagrant/.kube/config
  631  chmod 600 /home/vagrant/.kube/config
  632  helm version
  633  mkdir {helm-source,helm-releases}
  634  cd helm-source/
  635  ;ls
  636  helm create first-app
  637  ls -l
  638  ls -l first-app/
  639  vim first-app/Chart.yaml
  640  vim first-app/values.yaml
  641  vim first-app/templates/deployment.yaml
  642  vim first-app/templates/ingress.yaml
  643  vim first-app/templates/deployment.yaml
  644  vim first-app/values.yaml
  645  helm package first-app
  646  vim first-app/values.yaml
  647  vim first-app/templates/deployment.yaml
  648  helm package first-app
  649  ls -l
  650  mv first-app-0.1.0.tgz ../helm-releases/
  651  helm install ../helm-releases/first-app-0.1.0.tgz
  652  helm install first-app ../helm-releases/first-app-0.1.0.tgz
  653  vim first-app/values.yaml
  654  helm uninstall first-app
  655  cd ../
  656  ls
  657  rm get_helm.sh
  658  ls -l
  659  git init
  660  ls -l
  661  ls -la
  662  git add --all
  663  git commit -m "first commit"
  664  git config user.email "pluhin@gmail.com"
  665  git config user.name "Siarhei Pishchyk"
  666  git commit --amend -a
  667  sudo update-alternatives --config editor
  668  git commit --amend -a
  669  git branch -M master
  670  git branch
  671  git remote add origin git@github.com:pluhin/helm-md-sa2-22-22.git
  672  git push origin master
  673  echo -e "User-Agent: *\nDisallow: /" > robots.txt
  674  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/helm-releases/ .
  675  vim index.yaml
  676  rm index.yaml
  677  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ .
  678  rm index.yaml
  679  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ .
  680  vim index.yaml
  681  git add --all
  682  git commit -m "First version"
  683  git push
  684  git push --set-upstream origin master
  685  git push
  686  vim helm-source/first-app/Chart.yaml
  687  vim helm-source/first-app/templates/pvc.yaml
  688  vim helm-source/first-app/values.yaml
  689  vim helm-source/first-app/templates/deployment.yaml
  690  helm package helm-source/first-app
  691  ls -l
  692  mv first-app-0.2.0.tgz helm-releases/
  693  ls -l helm-releases/
  694  history | grep index
  695  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ --merge index.yaml .
  696  vim index.yaml
  697  git add --all
  698  git commit -m "Version with PVC"
  699  git push
  700  vim helm-source/first-app/templates/pvc.yaml
  701  helm package helm-source/first-app
  702  ls -l
  703  mv first-app-0.2.0.tgz helm-releases/
  704  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ --merge index.yaml .
  705  vim index.yaml
  706  vim helm-source/first-app/values.yaml
  707  helm package helm-source/first-app
  708  mv first-app-0.2.0.tgz helm-releases/
  709  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ --merge index.yaml .
  710  git add --all
  711  git commit -m "Fix var names"
  712  git push
  713  mc
  714  vim helm-source/first-app/templates/deployment.yaml
  715  helm package helm-source/first-app
  716  helm install first-app first-app-0.2.0.tgz
  717  vim helm-source/first-app/templates/deployment.yaml
  718  helm package helm-source/first-app
  719  helm install first-app first-app-0.2.0.tgz
  720  helm uninstall first-app
  721  helm install first-app first-app-0.2.0.tgz
  722  helm uninstall first-app
  723  helm install first-app first-app-0.2.0.tgz
  724  mv first-app-0.2.0.tgz helm-releases/
  725  helm repo index --url https://pluhin.github.io/helm-md-sa2-22-22/ --merge index.yaml .
  726  git add --all
  727  git commit -m "Fix var names 2"
  728  git push
  729  helm uninstall fisrt-app
  730  helm uninstall first-app
  731  helm repo add my-repo https://charts.bitnami.com/bitnami
  732  cd ../06.Ansible.WS/
  733  ls -l
  734  vim mariadb.yaml
  735  history | grep mariadb.yaml
  737  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=joomla user_db=joomla pass_db=joomla"
  738  cd -
  742  helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=192.168.201.XX,externalDatabase.password=joomla,externalDatabase.user=joomla,externalDatabase.database=joomla,global.storageClass=nfs,joomlaUsername=admin,joomlaPassword=joomla my-repo/joomla
  743  kubectl get secret --namespace default sa-joomla -o jsonpath="{.data.joomla-password}" | base64 -d
  744  vim joomla_ingress.yaml
  745  kubectl apply joomla_ingress.yaml
  746  kubectl apply -f joomla_ingress.yaml
  747  kuectl log sa-joomla-766cdbffff-5sqzn
  748  kubectl log sa-joomla-766cdbffff-5sqzn
  749  kubectl logs sa-joomla-766cdbffff-5sqzn
  750  helm search repo my-repo -l
  751  history
```
