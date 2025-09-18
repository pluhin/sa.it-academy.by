## Install helm
```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm -f get_helm.sh
```

## Wordpress
```
helm install my-wordpress \
--set wordpressUsername=admin \
--set wordpressPassword=admin \
--set service.type=ClusterIP \
--set ingress.enabled=true \
--set ingress.ingressClassName=nginx \
--set ingress.hostname=wp.k8s-1.sa \
--set persistence.accessMode=ReadWriteMany \
--set persistence.size=1Gi \
--set persistence.storageClass=nfs-client \
--set mariadb.primary.persistence.size=1Gi \
--set mariadb.primary.persistence.storageClass=nfs-client \
 oci://registry-1.docker.io/bitnamicharts/wordpress
```

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/13.Kubernetes.Helm/screenshots/wordpress.png "Wordpress")


 
## Drupal
```
helm install my-drupal \
--set drupalUsername=admin \
--set drupalPassword=admin \
--set persistence.storageClass=nfs-client \
--set persistence.accessModes={ReadWriteMany} \
--set persistence.size=1Gi \
--set service.type=ClusterIP \
--set ingress.enabled=true \
--set ingress.ingressClassName=nginx \
--set ingress.hostname=drupal.k8s-1.sa \
--set mariadb.primary.persistence.storageClass=nfs-client \
--set mariadb.primary.persistence.accessModes={ReadWriteMany} \
--set mariadb.primary.persistence.size=1Gi \
oci://registry-1.docker.io/bitnamicharts/drupal
```

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/13.Kubernetes.Helm/screenshots/drupal.png "drupal")


## Kubernetes cluster
![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/13.Kubernetes.Helm/screenshots/k8s-cluster.png "k8s-cluster")

