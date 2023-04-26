# 13. Kubernetes. Helm

## Helm installation

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm list
helm repo update
```

## nfs.yaml

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
  name: nfs-app
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/Anton_Negovora/"
```

## DBs creating

```bash
ansible-playbook -i inv.yaml maria_db.yaml -e name_db=bitnami_wordpress -e user_db=bn_wordpress -e pass_db=bn_wordpress
ansible-playbook -i inv.yaml maria_db.yaml -e name_db=bitnami_drupal -e user_db=bn_drupal -e pass_db=bn_drupal
```

## Helm commands

```bash
helm install sa-wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.201.14,externalDatabase.password=bn_wordpress,externalDatabase.user=bn_wordpress,externalDatabase.database=bitnami_wordpress,global.storageClass=nfs,wordpressUsername=admin,wordpressPassword=wordpress my-repo/wordpress

helm install sa-drupal  --set mariadb.enabled=false,externalDatabase.host=192.168.201.14,externalDatabase.password=bn_drupal,externalDatabase.user=bn_drupal,externalDatabase.database=bitnami_drupal,global.storageClass=nfs,drupalUsername=admin,drupalPassword=drupal my-repo/drupal
```

## ingress.yaml

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
    - host: drupal-sa.k8s-14.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: sa-drupal
                port:
                  number: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: wordpress-sa.k8s-14.sa
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

## Pods

![pods](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/13.Kubernetes.Helm/Pods.png)

## Drupal

![drupal](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/13.Kubernetes.Helm/drupal.png)

## Wordpress

![wordpress](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/13.Kubernetes.Helm/wordpress.png)

