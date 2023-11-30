# Homework Assignment 1. ArgoCD deployment and 

## Install and deploy Argo CD

[https://argo-cd.readthedocs.io/en/stable/getting_started/]

```bash
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
```


* Deleting argocd-install.yaml and download from [https://github.com/pluhin/argocd-25-23/blob/master/argocd-install.yaml]
```bash
rm argocd-install.yaml
wget https://raw.githubusercontent.com/pluhin/argocd-25-23/master/argocd-install.yaml
```

```
NOTE:
Changes made:

 - Changes in argocd install:

---
      containers:
      - args:
        - /usr/local/bin/argocd-server
        - --insecure     ### Added this line
        env:
        - name: ARGOCD_SERVER_INSECURE

---


 - Add node port:

---
  name: argocd-server
spec:
  type: NodePort  ## Change service type
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 30007 ## Add port for bastion nginx
  - name: https
    port: 443
---

```

* Creating a namespace named "argocd". If I want to change the namespace to a different one from the default one, I should make the appropriate changes to argocd-install.yaml.

```bash
kubectl create namespace argocd
```

* Deploy argocd

```bash
kubectl apply -f argocd-install.yaml -n argocd
```


## Create separate repository which contains application manifests for ArgoCD

Git [https://github.com/YMazurau/15.-Kubernetes-CI-CD.git]

```bash
kubectl get application first-app -n argocd -o yaml > first-app.yaml
kubectl get application jekajenkins -n argocd -o yaml > jekajenkins.yaml
kubectl get application jenkins -n argocd -o yaml > jenkins.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
#The files are edited according to the example from Demo 15.K8s.ArgoCD
```


## Secret

```bash
cd 15.K8s.ArgoCD
kubectl get secrets repo-603658554 -n argocd -o yaml > repo-603658554.yaml
kubectl get secrets repo-1595817048 -n argocd -o yaml > repo-1595817048.yam
kubectl get secrets repo-2454031145 -n argocd -o yaml > repo-2454031145.yaml
kubectl get secrets repo-3235210532 -n argocd -o yaml > repo-3235210532.yaml
```

* kubeseal

```bash
cat repo-603658554.yaml | kubeseal --format yaml > sealed_secret_repo-603658554.yaml
cat repo-1595817048.yaml | kubeseal --format yaml > sealed_secret_repo-1595817048.yaml
cat repo-2454031145.yaml | kubeseal  --format yaml > sealed_secret_repo-2454031145.yaml
cat repo-3235210532.yaml | kubeseal --format yaml > sealed_secret_repo-3235210532.yaml
```