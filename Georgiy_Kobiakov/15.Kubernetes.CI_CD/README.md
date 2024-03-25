# 15.Kubernetes.CI_CD
---

## Deploying ArgoCD
```bash
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
vim argocd-install.yaml
kubectl apply -f argocd-install.yaml -n argocd
```

## Changes in argocd-install.yaml
```yaml
     containers:
      - args:
        - /usr/local/bin/argocd-server
        - --insecure     ### Added this line
        env:
        - name: ARGOCD_SERVER_INSECURE
#################################################
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
```

## Github repo for apps
[argocd-27-24](https://github.com/Goshaker/argocd-27-24)

## Create separate repository which contains application git secrets objects as sealsecret objects for ArgoCD
```bash
kubectl get application jenkins-app -n argocd -o yaml > apps/jenkins-app.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > apps/nfs-subdir-external-provisioner.yaml
kubectl get secret repo-3235210532 -n argocd -o yaml > secret.yaml
cat secret.yaml | kubeseal --format yaml > sealed_secret.yaml
```
## ArgoCD applications
![ArgoCD applications](https://github.com/Goshaker/DevOpsCourse/blob/master/15.Kubernetes.CI_CD/main.png)

## apps
![apps](https://github.com/Goshaker/DevOpsCourse/blob/master/15.Kubernetes.CI_CD/apps.png)

## jenkins-app
![jenkins-app](https://github.com/Goshaker/DevOpsCourse/blob/master/15.Kubernetes.CI_CD/jenkins-app.png)

## nfs-subdir-external-provisioner
![nfs-subdir-external-provisioner](https://github.com/Goshaker/DevOpsCourse/blob/master/15.Kubernetes.CI_CD/nfs.png)