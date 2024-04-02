# Application deployment by Helm

Deploy in your K8s cluster the following applications using helm charts from public repositories:

- Wordpress
- Drupal

Please disable DBs deployment for these deployment and use ansible DBs provisioning from ansible workshop

All these applications should have addresses like `http://<APP_NAME>.k8s-<LAST_OCTET_YOUR_K8S_MEMBER>.sa`

After deployment you have to login to both application and create dummy article with your name as title

---

## History of your helm run commands and printscreens of your articles put into report and create PR

```bash
ssh root@192.168.201.3
mysql
```

```sql
CREATE DATABASE wordpress;
CREATE USER wordpress_user IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress_user@'%';
FLUSH PRIVILEGES;

CREATE DATABASE drupal;
CREATE USER drupal_user IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON drupal.* TO drupal_user@'%';
FLUSH PRIVILEGES;
```

```bash
zypper se helm
sudo zypper in helm
```
	
	User       = zhivushko
	Password   = zhivushko-admin

```bash
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --create-namespace --namespace nfs-provisioner --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-27-24/azhivushko
```

```yaml
# pvc.yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-drupal
  namespace: default
  labels:
    app: nfs-drupal
    storage.k8s.io/name: nfs
    storage.k8s.io/part-of: kubernetes-complete-reference
spec:
  storageClassName: nfs-client
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 2Gi
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-wordpress
  namespace: default
  labels:
    app: nfs-wordpress
    storage.k8s.io/name: nfs
    storage.k8s.io/part-of: kubernetes-complete-reference
spec:
  storageClassName: nfs-client
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 2Gi
```

```bash
helm install zhiv-drupal --set allowEmptyPassword=false,replicaCount=4,volumePermissions.enabled=true,mariadb.enabled=false,externalDatabase.host=192.168.201.3,externalDatabase.password=password,externalDatabase.user=drupal_user,externalDatabase.database=drupal,persistence.existingClaim=nfs-drupal,drupalUsername=zhivushko,drupalPassword=zhivushko-admin,ingress.enabled=true,ingress.hostname=drupal.k8s-5.sa,ingress.ingressClassName=nginx bitnami/drupal
```

![](../_attachments/Pasted%20image%2020240312120437.png)

![](../_attachments/Pasted%20image%2020240312120456.png)

```yaml
helm install zhiv-wordpress --set allowEmptyPassword=false,replicaCount=2,mariadb.enabled=false,externalDatabase.host=192.168.201.3,externalDatabase.user=wordpress_user,externalDatabase.password=password,externalDatabase.database=wordpress,volumePermissions.enabled=true,persistence.existingClaim=nfs-wordpress,wordpressUsername=zhivushko,wordpressPassword=zhivushko-admin,wordpressBlogName=ZhivBlog,ingress.enabled=true,ingress.hostname=wordpress.k8s-5.sa,ingress.ingressClassName=nginx bitnami/wordpress
```

![](../_attachments/Pasted%20image%2020240312132637.png)

![Pasted image 20240312133718.png](../_attachments/Pasted%20image%2020240312133718.png)
