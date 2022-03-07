### History
#install helm
```bash
mkdir 13.Kubernetes.Helm
cd 13.Kubernetes.Helm
wget https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
tar -xf helm-v3.8.0-linux-amd64.tar.gz
```

#add bitnami repo
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

#install nfc-provisioner
```bash
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.37.105\
    --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-19-22/Vlad_Buharevich/
```

#create igress for wordpress
```bash
vim wp_ingress.yaml
kubectl apply -f wp_ingress.yaml
```

#install wordpress
```bash
helm install ss-wordpress  --set global.storageClass=nfs-client,wordpressUsername=admin,wordpressPassword=password bitnami/wordpress
```

#add to file /etc/hosts next string:178.124.206.53 wordpress.k8s-3.sa wordpress.k8s-4.sa 
vim /etc/hosts/

#create igress for drupal
```bash
vim dr_ingress.yaml
kubectl apply -f dr_ingress.yaml
```

#install drupal
```bash
helm install ss-drupal  --set global.storageClass=nfs-client,drupalUsername=admin,drupalPassword=password bitnami/drupal
```

#add to file /etc/hosts next string:178.124.206.53 drupal.k8s-3.sa drupal.k8s-4.sa 
```bash
vim /etc/hosts/
```