# 13. Kubernetes. Helm

## Install Helm:
```bash
 1145  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
 1146  chmod 700 get_helm.sh
 1147  ./get_helm.sh
 1148  helm version
version.BuildInfo{Version:"v3.13.1", GitCommit:"3547a4b5bf5edb5478ce352e18858d8a552a4110", GitTreeState:"clean", GoVersion:"go1.20.8"}
```

## Create DB fo apps:
I used Ansible for creating Mariadb Data Bases (maslo maslyanoe) for wordpress and drupal: 

```bash
 1180  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=drupal -e user_db=drupal -e pass_db=drupal -l mysql -u root --ask-pass
 1211  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mysql -u root --ask-pass
```

[ansible-playbook](mariadb.yaml)

[ansible-inventory](inv.yaml)

## Create pv_provisioner for apps: 
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
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-app-drupal
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/Pavel_Ivanchuk/drupal"
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-app-wordpress
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/Pavel_Ivanchuk/wordpress"
```

```bash
 1401  kubectl apply -f pv_provisioner.yaml
```

![k9s_pvc](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/fde8e7f1-e17f-4a9f-afae-4fc2223f0902)
---
![k9s_pv](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/197a6363-7a7f-4a54-8fb7-d13558f8394a)
---
![k9s_storageclasses](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/21321d39-d78c-4205-be26-fd7d1eda6714)

## Create ingress for apps: 

```yaml 
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-drupal
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
  - host: drupal.k8s-3.sa
    http:
      paths:
      - path: /drupal
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
  - host: wordpress.k8s-3.sa
    http:
      paths:
      - path: /wordpress
        pathType: Prefix
        backend:
          service:
            name: sa-wordpress
            port:
              number: 80
```

```bash
1400  kubectl apply -f ingress.yaml
```

![k9s_ingress](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/a06e24a3-a6dd-4be0-8656-1d9b1f6d0232)

## Install Drupal:
```bash
 1365  helm install sa-drupal  --set mariadb.enabled=false,externalDatabase.host=192.168.202.5,externalDatabase.password=drupal,externalDatabase.user=drupal,externalDatabase.database=drupal,global.storageClass=nfs-app-drupal,drupalUsername=IPaul32,drupalPassword=drupal,ingress.enabled=true,ingress.hostname=drupal.k8s-3.sa,ingress.annotations="kubernetes.io/ingress.class: nginx"  my-repo/drupal
```
---
![Drupal_ready](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/72442d6f-c75f-471f-92e9-2c46add78b30)

## Install Wordpress:
```bash
 1425  helm install sa-wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.5,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,global.storageClass=nfs-app-wordpress,wordpressUsername=IPaul32,wordpressPassword=wordpress,wordpressEmail=marchik32@gmail.com,wordpressFirstName=Pavel,wordpressLastName=Ivanchuk,wordpressBlogName=IvanchukPavel,ingress.enabled=true,ingress.hostname=wordpress.k8s-3.sa,ingress.annotations="kubernetes.io/ingress.class: nginx" bitnami/wordpress\n
```
---
![Wordpress_work](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/b18207f3-1c17-4e9d-b49b-9056a23df971)

---

![k9s_pods](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/93dda2c8-f52e-4906-969c-1c19ff90548c)

## Install Wordpress:
