# Kubernetes Helm
## Screensots
### Wordpress
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mnwUrWQdAUOPHa0JEBq1hc_jdhYbavPZlkRC-JnT_R-FokSsz6udltNqc-oHDeaYQ1Jt0FB1iaZ-x56fTZXX-DmhWr5WfmclxIQSSltW3okDprf_ndjpHtl2uHy6Sw92R3_4mcWheOx819IKphJJ4Mz9sK0l_11zgRtMRV95CtpEIx1eQRtXwB9bRTOeppvm_?width=2188&height=1566&cropmode=none" width="auto" height="auto" />
</dv>

### Drupal
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mZOtlq1SLX8MquhBHLRNm4jzEBFpV5nrMNojTxxNYD4dG1t7-yzxyr_PpsxmUIpUHKpkmM64HDaE8IDm9oTqjtF36ITC9H-ctRw_SXnldyI2m_uQPXZkmB4Mg2lR23mzafU61m3OAf8yvPyYj84Ighmuax3JSQqdaq0LIskr8LdTGYXjOpscAVXWWqstfFoO5?width=2176&height=1768&cropmode=none" width="auto" height="auto" />
</dv>

## History
```bash
  751  helm create first-app
  752  helm package first-app
  753  git init
  754  git config --global init.defaultBranch main
  755  git init
  756  git add .
  757  git commit -m "Init"
  758  git remote add origin https://github.com/Tony-BY/helm-demo.git
  759  git push orign main
  760  git push origin main
  761  cd .git/
  762  ls -ll
  763  code config
  764  git remote add origin git@github.com:Tony-BY/helm-demo.git
  765  git push orign main
  766  cd ..
  767  git remote add origin git@github.com:Tony-BY/helm-demo.git
  768  git push origin main
  769  helm repo index --url https://tony-by.github.io/helm-demo/ .
  770  git add .
  771  git commit -m "First version"
  772  git push
  773  git push --set-upstream origin main
  774  helm repo add helm_demo https://tony-by.github.io/helm-demo/
  775  helm repo update
  776  helm search repo app -l
  777  helm repo index --url https://tony-by.github.io/helm-demo/ --merge index.yaml .
  778  helm package first-app
  779  helm repo index --url https://tony-by.github.io/helm-demo/ --merge index.yaml .
  780  git add .
  781  git commit -m "Add PV & PVC"
  782  git push
  783  helm repo update
  784  helm search repo app -l
  785  helm repo update
  786  helm search repo app -l
  787  helm install first-app helm_demo/first-app --version v0.2.0
  788  git add .
  789  git commit -m "Fix alias in ingress"
  790  helm repo update
  791  helm package first-app
  792  helm repo index --url https://tony-by.github.io/helm-demo/ --merge index.yaml .
  793  git add .
  794  git commit -m "Fix alias in ingress"
  795  git push
  796  helm repo update
  797  helm search repo app -l
  798  helm repo update
  799  helm search repo app -l
  800  helm repo update
  801  helm search repo app -l
  802  helm uninstall first-app
  803  helm repo add bitnami https://charts.bitnami.com/bitnami
  804  helm repo update
  805  helm search repo app -l
  806  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
  807  helm repo update
  808  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner     --set nfs.server=192.168.37.105     --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-21-22/a_skuratovich
  809  helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=192.168.202.26,externalDatabase.password=joomla,global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  810  kubectl apply -f joomla_ingress.yaml
  811  kubectl get secret --namespace default sa-joomla -o jsonpath="{.data.joomla-password}" | base64 -d
  812  ansible-playbook -i inventory.yaml db.yaml
  813  helm install sa-drupal  --set mariadb.enabled=false,externalDatabase.host=192.168.202.26,externalDatabase.password=drupal,global.storageClass=nfs-client,drupalUsername=admin,drupalPassword=password bitnami/drupal
  814  kubectl apply -f drupal_ingress.yaml
  815  kubectl apply -f joomla_ingress.yaml
  816  kubectl apply -f drupal_ingress.yaml
  817  ansible-playbook -i inventory.yaml db.yaml
  818  helm install sa-wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.26,externalDatabase.password=wordpress,global.storageClass=nfs-client,wordpressUsername=admin,wordpressPassword=password bitnami/wordpress
  819  kubectl apply -f wordpress_ingress.yaml
  820  history
```