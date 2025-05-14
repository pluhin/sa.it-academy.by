# 13. Kubernetes. Helm
# Installation WordPress
```bash
helm install my-wordpress \                  
  --set wordpressUsername=admin \
  --set wordpressPassword=password \
  --set mariadb.mariadbRootPassword=secretpassword \
  --set global.storageClass=nfs-client \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=nginx \
  --set ingress.hostname=wordpress.k8s-17.sa \
    oci://registry-1.docker.io/bitnamicharts/wordpress -n default

Pulled: registry-1.docker.io/bitnamicharts/wordpress:24.2.6
Digest: sha256:5e7692ba6337cd31b7398d0789361dfc8ac807b73158efb5395bc2707fd7f74a
NAME: my-release
LAST DEPLOYED: Tue May 13 14:42:00 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: wordpress
```
check:
```bash
helm list
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS   CHART                   APP VERSION
my-release       default         1               2025-05-13 14:42:00.075826444 +0000 UTC deployed wordpress-24.2.6        6.8.1   # forgot change the name on ex "my-wordpress"
```  
Added wordpress.k8s-17.sa to hosts
Went to http://wordpress.k8s-17.sa/wp-admin for editing. Screenshot is attached

# Drupal installation via values.yaml
```bash
vim drupal-values.yaml

helm install drupal -f drupal-values.yaml oci://registry-1.docker.io/bitnamicharts/drupal
Pulled: registry-1.docker.io/bitnamicharts/drupal:21.2.8
Digest: sha256:9fbd05140b083586e439d7b7a4700b90e91ffdbde44af39f43c285a1dbe77e91
NAME: drupal
LAST DEPLOYED: Tue May 13 16:40:22 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: drupal
CHART VERSION: 21.2.8
APP VERSION: 11.1.
```

Added drupal.k8s-17.sa to hosts
Went to http://drupal.k8s-17.sa/ Screenshot is attached