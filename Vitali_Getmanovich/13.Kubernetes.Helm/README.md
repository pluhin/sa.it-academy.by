# 13. Kubernetes. Helm

## Install Helm
```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
---
## Installing the Chart with name my-repo
```bash
helm repo add my-repo https://charts.bitnami.com/bitnami
helm repo update
```
---

## Create databases for drupal and wordpress using Ansible
```bash
ansible-playbook -i inventary.yaml maria_db.yaml -e "db_name=bitnami_wordpress db_user=bn_wordpress db_pass=bn_wordpress"
ansible-playbook -i inventary.yaml maria_db.yaml -e "db_name=bitnami_drupal db_user=bn_drupal db_pass=bn_drupal"
```
---

## Create storageclass nfs-wordpress and nfs-drupal in file storageclasses.yaml
```yaml
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: nfs
  namespace: default
spec:
  chart: nfs-subdir-external-provisioner
  repo: https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  targetNamespace: default
  set:
    nfs.server: 192.168.37.105
    nfs.path: /mnt/IT-Academy/nfs-data/sa2-23-23/
    storageClass.name: nfs

---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-drupal
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/vgetmanovich/drupal/"

---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-wordpress
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/vgetmanovich/wordpress/"
```
---
## Create ingress 
### for wordpress in file wordpress-ingress.yaml
```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: wordpress-sa.k8s-4.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: sa-wordpress
                port:
                  number: 80
```
### for drupal in file drupal-ingress.yaml
```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-drupal
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: drupal-sa.k8s-4.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: sa-drupal
                port:
                  number: 80
```
---
## Deploy wordpress and drupal
```bash
helm install sa-wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.201.4,externalDatabase.user=bn_wordpress,externalDatabase.password=bn_wordpress,externalDatabase.database=bitnami_wordpress,global.storageClass=nfs-wordpress,wordpressUsername=admin,wordpressPassword=admin  my-repo/wordpress
helm install sa-drupal --set mariadb.enabled=false,externalDatabase.host=192.168.201.4,externalDatabase.password=bn_drupal,externalDatabase.user=bn_drupal,externalDatabase.database=bitnami_drupal,global.storageClass=nfs-drupal,drupalUsername=admin,drupalPassword=drupal my-repo/drupal
```
---

## Add to file hosts 
```
178.124.206.53 wordpress-sa.k8s-4.sa
178.124.206.53 drupal-sa.k8s-4.sa
```
---

## Open browser with name wordpress-sa.k8s-4.sa and 178.124.206.53 drupal-sa.k8s-4.sa, make changes


![browser-wordpress](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/13.Kubernetes.Helm/wordpress.png)

![browser-drupal](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/13.Kubernetes.Helm/drupal.png)
