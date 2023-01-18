# 13.K8s.Helm
## For deploy Wordpress we need ingress, db, nfs

## Create wordpress-pod with the use HELM
```sh
helm install wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.201.15,externalDatabase.password=wp_admin,externalDatabase.user=wp_admin,externalDatabase.database=wordpress,global.storageClass=nfs,wordpressUsername=admin,wordpressPassword=admin bitnami/wordpress
```

## wordpress-ingress
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
    - host: wordpress-sa.k8s-15.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: wordpress
                port:
                  number: 80
```

## PV
```yaml
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
    nfs.path: /mnt/IT-Academy/nfs-data/sa2-22-22/
    storageClass.name: nfs
```

## Screenshots
![ deployed WORDPRESS](wordpress.PNG)


