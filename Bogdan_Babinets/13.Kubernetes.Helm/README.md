# 13. Kubernetes. Helm

## History of helm run commands

```bash
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-20-22/bb8312/
  helm install bb-wordpress --set global.storageClass=nfs-client,wordpressUsername=admin,wordpressPassword=admin1234 bitnami/wordpress
  kubectl apply -f wp_ingress.yaml
  helm install bb-drupal --set global.storageClass=nfs-client,drupalUsername=admin,drupalPassword=admin1234 bitnami/drupal
  kubectl apply -f dp_ingress.yaml
```

## Printscreens of articles

Printscreens "dp_scr.png" and "wp_scr.png" for Drupal and Wordpress respectively are published in directory "13.Kubernetes.Helm"
