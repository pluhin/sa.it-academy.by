# 13.Kubernetes.Helm

## Preparing to deploy Wordpress using Helm

## Service

#### Create special namespace, deploy nfs on cluster, Create new StorageClass

```yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: nfs-wordpress
  labels:
    name: nfs-wordpress
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: nfs
  namespace: nfs-wordpress
spec:
  chart: nfs-subdir-external-provisioner
  repo: https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  targetNamespace: nfs-wordpress
  set:
    nfs.server: 192.168.37.105
    nfs.path: /mnt/IT-Academy/nfs-data/sa2-22-22/e_solovey/
    storageClass.name: nfs
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-wordpress
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/wordpress/"
```

#### Create insgress for wordpress

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  namespace: wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: wordpress.k8s-16.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: wordpress
                port:
                  number: 80
~
```

## Deploy Wordpress using Helm

#### Create namespace, Deploy

```bash
kubectl create namespace wordpress
```

```bash
helm install wordpress --namespace wordpress --set \
mariadb.enabled=false,\
externalDatabase.host=192.168.201.16,\
externalDatabase.user=db_user,\
externalDatabase.password=<db_pass>,\
externalDatabase.database=db_wordpress,\
global.storageClass=nfs-wordpress,\
wordpressUsername=admin,\
wordpressPassword=<local_pass>,\
wordpressEmail=evgeniy.colovey@gmail.com\
my-repo/wordpress
```

## Report

#### Service

```bash
e_solovey@nss:~/test-repository/13.Kubernetes.Helm$ kubectl get service -A
NAMESPACE       NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
default         kubernetes                           ClusterIP      10.43.0.1       <none>        443/TCP                      2d11h
kube-system     kube-dns                             ClusterIP      10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP       2d11h
kube-system     metrics-server                       ClusterIP      10.43.144.214   <none>        443/TCP                      2d11h
ingress-nginx   ingress-nginx-controller             NodePort       10.43.14.43     <none>        80:30001/TCP,443:31961/TCP   30h
ingress-nginx   ingress-nginx-controller-admission   ClusterIP      10.43.110.59    <none>        443/TCP                      30h
default         simple-web-service                   ClusterIP      10.43.202.252   <none>        80/TCP                       15h
kube-system     sealed-secrets-controller            ClusterIP      10.43.179.169   <none>        8080/TCP                     12h
webserver       nginx-service                        ClusterIP      10.43.206.168   <none>        80/TCP                       7h49m
wordpress       wordpress                            LoadBalancer   10.43.220.64    <pending>     80:30708/TCP,443:32511/TCP   31m
```

#### Ingress

```bash
e_solovey@nss:~/homework/sa.it-academy.by/Eugene_Solovey/13.Kubernetes.Helm$ kubectl get ing -A
NAMESPACE   NAME                CLASS    HOSTS                  ADDRESS          PORTS   AGE
webserver   ingress-sa          <none>   nginx-test.k8s-16.sa   192.168.203.16   80      7h57m
wordpress   ingress-wordpress   <none>   wordpress.k8s-16.sa    192.168.203.16   80      38m
```
