# 13. Kubernetes. Helm

## Homework Assignment 1. Application deployment by Helm

### helm install

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### add bitnami repos

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm install my-release bitnami/wordpress
```

### helm install commands

```bash
helm install my-wordpress --set volumePermissions.enabled=true,mariadb.enabled=false,externalDatabase.host=192.168.208.13,externalDatabase.password=test,externalDatabase.user=test,externalDatabase.database=test,mariadb.primary.persistence.existingClaim=pv-claim,persistence.existingClaim=pv-claim,wordpressUsername=nmyslivets,wordpressPassword=nmyslivets,wordpressEmail=belogolovayanv@gmail.com,wordpressFirstName=Natalia,wordpressLastName=Myslivets,wordpressBlogName=Myslivets,ingress.enabled=true,ingress.hostname=wordpress.k8s-13.sa,ingress.annotations="kubernetes.io/ingress.class: nginx" bitnami/wordpress

helm install drupal  --set allowEmptyPassword=false,volumePermissions.enabled=true,mariadb.enabled=false,externalDatabase.host=192.168.208.13,externalDatabase.password=test,externalDatabase.user=test,externalDatabase.database=test,persistence.existingClaim=pvc-drupal,drupalUsername=nmyslivets,drupalPassword=nmyslivets,ingress.enabled=true,ingress.hostname=drupal.k8s-13.sa,ingress.annotations="kubernetes.io/ingress.class: nginx" bitnami/drupal
````

### pv and pvc


```yaml

kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: mystorage
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer

---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: drupal-pv-volume
  labels:
    type: local
spec:
  storageClassName: mystorage
  capacity:
    storage: 500Mi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/opt/mount"
  
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-claim-drupal
spec:
  accessModes:
    - ReadWriteMany
  volumeMode: Filesystem
  resources:
    requests:
      storage: 100Mi
  storageClassName: mystorage
  selector:
    matchLabels:
      type: local      

```

![wordpress](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/13.Kubernetes.Helm/wordpress_adminpage.png)

![drupal](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/13.Kubernetes.Helm/drupal.png)

![k9s](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/13.Kubernetes.Helm/k9s.png)

