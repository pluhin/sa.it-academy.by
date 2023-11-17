## Install db for Wordpress and Drupal

```
sudo mysql -u root -p

CREATE DATABASE wordpressdb;
CREATE USER 'sasha@%' IDENTIFIED BY 'password';
GRANT ALL ON drupaldb.* TO 'sasha@%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'sasha@%';


CREATE DATABASE drupaldb;
CREATE USER 'sasha' IDENTIFIED BY 'password';
GRANT ALL ON drupaldb.* TO 'sasha' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'sasha';
```

## Add pv

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
  pathPattern: "/amazurov/wordpress"

---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-drupal
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/amazurov/drupal"

```
## Wordpress

Creating values_wp.yaml [https://github.com/bitnami/charts/blob/main/bitnami/wordpress/values.yaml]

```bash

helm install sa-wordpress -f values_wp.yaml my-repo/wordpress 

echo Password: $(kubectl get secret --namespace default sa-wordpress -o jsonpath="{.data.wordpress-password}" | base64 -d)
```
## Drupal

Creating values_d.yaml [https://github.com/bitnami/charts/blob/main/bitnami/drupal/values.yaml]

```bash

helm install sa-drupal -f values_d.yaml my-repo/drupal

echo Password: $(kubectl get secret --namespace default sa-drupal -o jsonpath="{.data.drupal-password}" | base64 -d)
```