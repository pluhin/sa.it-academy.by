## deploy ArgoCD into cluster

```bash
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O ./15.k8s.CICD/argocdInstall.yaml
kubectl apply -f ./15.k8s.CICD/argocdInstall.yaml -n argocd
```

## create separate repository which contains application manifests for ArgoCD and add this repository as project for applications

[https://gitlab.com/av.zhivushko/argo](https://gitlab.com/av.zhivushko/argo)

## Create Drupal app

```yaml
# nfs-drupal.yaml

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-drupal
  namespace: drupal-argo
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
      storage: 1Gi
```

```bash
kubectl get secrets drupal-app-externaldb -n drupal-argo -o yaml | kubeseal --format yaml > ./15.k8s.CICD/apps/secrets/ss-drupal.yaml
```

```yaml
# ss-drupal.yaml

---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: drupal-app-externaldb
  namespace: drupal-argo
spec:
  encryptedData:
    db-password: AgDCFbj+ff+9PgtAGbCCt2JN5B74N/uNDvPfZWH8YoZP4p7uAYMuT1vtzUyrNdZKuuY4q1Nq7aDnCLFLDi7yOm7FH45PWjH/QDMdHvrq6kUH+bhvNOCg1ylPIk/dnoDnCarozAF7KKpnZ7x2LLsAhcy/2lgWsyZtkoZWH2HMO3TpypLzkzw8Jnwv8gI9oTtopMopFvrRslbbozdWLQVNTM1XSTvtFHAzoY02uf/caGHKXZHBBT+o9iUOT3xhAjPxiOZUSAC/mUECGdEPmDgHP839WSjPEEiQMYypKoHCTFmBc5DG45A+9rVr6eym6bSKaSIV+h3tsC7MVEQ7UoU8rSBnpzmrHeLjYItW9uMazkFl6IdcQeNYbvDSzF4iLArr61OrWTW2J+zIPgA9Vs3G+J0eSim+fe2s3r4GfT2GDXsBMC3iMrP/COcTnLz0UnrpbB5puew+hgyheTEdS4DV3zQxOHghkf1oJc6ecUoqLy+qaXDUYv16CQcLpqVsgPHh0x5gRxml+LjUqUFIpaQJdMWFXyAA3HxMeKtWQCWAteuViBLADqjTS6fZ2Hvjwzyac8nBWRgOcp+Y0hBLhK7avDjWilApqcKOVtJUcstjJJ7h9BA124B+0mZWiHuY1QV5CU6tiNAMyVq+blWg1WGb4+BbP3JWENo2NDZyJc6XsLAKj9RTRufX8qO7d+mgrC+AQILdXJqS1J0H8g==
  template:
    metadata:
      creationTimestamp: null
      labels:
        app.kubernetes.io/instance: drupal-app
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/name: drupal
        app.kubernetes.io/version: 10.2.4
        helm.sh/chart: drupal-17.6.2
      name: drupal-app-externaldb
      namespace: drupal-argo
    type: Opaque
```

```yaml
# my-drupal.yaml

---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: drupal-app
  namespace: argocd
spec:
  destination:
    namespace: drupal-argo
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: drupal
    helm:
      parameters:
      - name: allowEmptyPassword
        value: 'false'
      - name: replicaCount
        value: '4'
      - name: volumePermissions.enabled
        value: 'true'
      - name: mariadb.enabled
        value: 'false'
      - name: externalDatabase.host
        value: xxx.xxx.xxx.xxx
      - name: externalDatabase.password
        value: xxxxxxxxxx
      - name: externalDatabase.existingSecret
        value: drupal-app-externaldb
      - name: externalDatabase.user
        value: drupal_user
      - name: externalDatabase.database
        value: drupal
      - name: persistence.existingClaim
        value: nfs-drupal
      - name: drupalUsername
        value: xxxxxxxxx
      - name: drupalPassword
        value: xxxxxxxxxx
      - name: drupalEmail
        value: xxxxxxxx@yandex.com
      - name: ingress.enabled
        value: 'true'
      - name: ingress.hostname
        value: drupal.k8s-5.sa
      - name: ingress.ingressClassName
        value: nginx
    repoURL: 'https://charts.bitnami.com/bitnami'
    targetRevision: 17.6.2
  syncPolicy:
    automated:
      prune: true
    syncOptions:
    - CreateNamespace=true
```

![Pasted image 20240317113929.png](../_attachments/Pasted%20image%2020240317113929.png)

![Pasted image 20240317113944.png](../_attachments/Pasted%20image%2020240317113944.png)

![Pasted image 20240317114008.png](../_attachments/Pasted%20image%2020240317114008.png)
