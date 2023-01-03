### 13.K8s


## Commands
```bash
  738  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  740  ls -la
  741  bash get_helm.sh
  742  helm version
  743  ls -l /home/admloc/.kube/config
  744  chmod 600 /home/admloc/.kube/config
  762  mkdir 13.K8s
  763  cd 13.K8s/
  764  helm repo add wp-repo https://charts.bitnami.com/bitnami
  765  cd ..
  766  cd 06.AnsibleWS/
  768  vim inv.yaml
  769  ls -la
  770  vim maria_db.yaml
  771  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=wordpress user_db=wp_user pass_db=wordpress"
  772  ansible-playbook -i inv.yaml maria_db.yaml -e "name_db=wordpress user_db=wp_user pass_db=wordpress"
  773  cd -
  774  cd 13.K8s/
  788  vim ingress_wp.yaml
  789  kubectl apply -f ingress_wp.yaml 
  792  helm install wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.27,externalDatabase.password=wordpress,externalDatabase.user=wp_user,externalDatabase.database=wordpress,global.storageClass=nfs,wordpressUsername=admin,wordpressPassword=wordpress wp-repo/wordpress
  793  k9s
  794  helm delete wordpress
  795  helm install wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.202.27,externalDatabase.password=wordpress,externalDatabase.user=wp_user,externalDatabase.database=wordpress,global.storageClass=nfs,wordpressUsername=admin,wordpressPassword=admin wp-repo/wordpress
  800 k9s
```
## Screen from browser
---
![wordpress](wordpress.png)
---


