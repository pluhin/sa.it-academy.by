# Homework Assignment 1. Application deployment by Helm

```
NOTE: Database, MariaDB, is deployed on a xxx.20 server.
      Values Bitnami:
      Wordpress [https://github.com/bitnami/charts/blob/main/bitnami/wordpress/values.yaml]
      Drupal [https://github.com/bitnami/charts/blob/main/bitnami/drupal/values.yaml]
      My GitHub [https://github.com/YMazurau/13.K8s.Demo]
```

## DATABASE
* Wordpress  
```bash
ansible-playbook -i inv1.yaml mariadb.yaml -e name_db=bn_wordpress -e user_db=ym_wordpress -e pass_db=ym_wordpress -l mariadb -u root --ask-pas      
```
* Drupal
```bash
ansible-playbook -i inv1.yaml mariadb.yaml -e name_db=bn_drupal -e user_db=ym_drupal -e pass_db=ym_drupal -l mariadb -u root --ask-pas 
```

## NFS

Creating a directory /mnt/IT-Academy/nfs-data/sa2-25-23/YMazurau 

nfs-subdir_hw.yaml
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
    nfs.path: /mnt/IT-Academy/nfs-data/sa2-25-23/
    storageClass.name: nfs
---
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-wordpress
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/YMazurau/wordpress"

---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-drupal
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/YMazurau/drupal"
```

## HELM

* Wordpress
```
NOTE: DB: false, host: wordpress.k8s-8.sa, replicaCount: 2
```
values_wp.yaml
```yaml
wordpressUsername: user

wordpressPassword: ""

wordpressEmail: mazurov1804@gmail.com

wordpressBlogName: YMazurov

wordpressFirstName: Yuheni  
wordpressLastName: Mazurau

replicaCount: 2

ingress:

  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "wordpress.k8s-8.sa"
  hosts:
    - host: wordpress.k8s-8.sa
      paths:
        - path: /
          pathType: ImplementationSpecific


mariadb:
  enabled: false
  replication:
    enabled: false

externalDatabase:
  host: 192.168.202.20
  user: ym_wordpress
  password: "ym_wordpress"
  database: bn_wordpress
  port: 3306 
```

* Drupal
```
NOTE: DB: false, host: drupal.k8s-8.sa, replicaCount: 2
```

values_dl.yaml
```yaml
drupalUsername: user

drupalPassword: ""

replicaCount: 2

ingress:

  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "drupal.k8s-8.sa"
  hosts:
    - host: drupal.k8s-8.sa
      paths:
        - path: /
          pathType: ImplementationSpecific


mariadb:
  enabled: false

externalDatabase:
  host: 192.168.202.20
  user: ym_drupal
  password: "ym_drupal"
  database: bn_drupal
  port: 3306
  existingSecret: "" 
```

* Seckrets

Wordpress
```yaml
echo Password: $(kubectl get secret --namespace default sa-wordpress -o jsonpath="{.data.wordpress-password}" | base64 -d)
```
Drupal
```yaml
echo Password: $(kubectl get secret --namespace default sa-drupal -o jsonpath="{.data.drupal-password}" | base64 -d)
```

* Deploy 

Add Bitnami charts
```bash
helm repo add my-repo https://charts.bitnami.com/bitnami
#check
helm search repo my-repo -l
```
Wordpress
```bash
helm install sa-wordpress -f values_wp.yaml my-repo/wordpress
```

Drupal
```bash
helm install sa-drupal -f values_dl.yaml my-repo/drupal
```
