## 13.Kubernetes_Helm_Alex_Muzhichenko

---

### History helm run commands

```bash
 419  wget https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
  420  tar -xf helm-v3.8.0-linux-amd64.tar.gz
  421  ls
  422  cd linux-amd64/
  423  ls
  424  helm
  425  sudo mv helm /bin/
  426  helm
  427  helm version
  428  helm repo add bitnami https://charts.bitnami.com/bitnami
  431  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-20-22/Alex_Muzhichenko/
  434  helm repo list
  435  vim wp_ingress.yaml
  436  kubectl apply -f wp_ingress.yaml
  437  helm install ss-wordpress  --set global.storageClass=nfs-client,wordpressUsername=admin,wordpressPassword=password bitnami/wordpress
  448  vim dr_ingress.yaml
  449  kubectl apply -f dr_ingress.yaml
  450  helm install ss-drupal  --set global.storageClass=nfs-client,drupalUsername=admin,drupalPassword=password bitnami/drupal


```

### Screenshots 

![wordpress](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/13.Kubernetes.Helm/wp.JPG)
![drupal](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/13.Kubernetes.Helm/dr.JPG)
