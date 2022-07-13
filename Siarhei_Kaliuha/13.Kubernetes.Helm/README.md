# Homework report for 13.Kubernetes.Helm by Siarhei Kaliuha

---
Using k8s cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment.  

## Installing [NFS subdir external provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner) for Dynamic Volume Provisioning:

```bash
$ helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
$ helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.37.105 \
    --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-20-22/Siarhei_Kaliuha/ \
    --set storageClass.accessModes=ReadWriteMany
```

## Adding Bitnami public repository:

```bash
$ helm repo add bitnami https://charts.bitnami.com/bitnami

$ helm repo list
NAME                            URL
bitnami                         https://charts.bitnami.com/bitnami
nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
```

## Deploying Wordpress using helm charts from public repository:

* [WordPress](https://bitnami.com/stack/wordpress/helm) packaged by Bitnami used

```bash
$ helm install wordpress-sk --set global.storageClass=nfs-client,\
wordpressUsername=admin,\
wordpressPassword=admin,\
mariadb.auth.rootPassword=password,\
ingress.enabled=true \
bitnami/wordpress
```
* applying ingress for Wordpress:

```bash
$ kubectl apply -f wordpress_sk_ingress.yaml
```

* wordpress_sk_ingress.yaml

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress-sk
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "wordpress-sk.k8s-22.sa"
spec:
  rules:
    - host: wordpress-sk.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: wordpress-sk
                port:
                  number: 80

```

* Wordpress application with test article available from remote host at address `wordpress-sk.k8s-21.sa`:

![wordpress-sk.k8s-21.sa](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/13.Kubernetes.Helm/wordpress.jpg)


## Deploying Drupal using helm charts from public repository:

* [Drupal](https://bitnami.com/stack/drupal/helm) packaged by Bitnami used

```bash
$ helm install drupal --set global.storageClass=nfs-client,\
drupalUsername=admin,\
drupalPassword=password,\
mariadb.auth.rootPassword=secretpassword,\
ingress.enabled=true \
bitnami/drupal
```

* applying ingress for Drupal:

```bash
$ kubectl apply -f drupal_sk_ingress.yaml
```

* drupal_sk_ingress.yaml

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-drupal
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "drupal-sk.k8s-22.sa"
spec:
  rules:
    - host: drupal-sk.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: drupal
                port:
                  number: 80

```

* Drupal application with test article available from remote host at address `drupal-sk.k8s-21.sa`:

![drupal-sk.k8s-21.sa](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/13.Kubernetes.Helm/drupal.jpg)