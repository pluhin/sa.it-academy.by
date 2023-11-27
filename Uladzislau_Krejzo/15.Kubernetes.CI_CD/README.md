# 15. Kubernetes CI CD

## Deploy ArgoCD into my cluster

### History commands
```bash
mkdir 15.K8s.ArgoCD
cd 15.K8s.ArgoCD 
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
vim argocd-install.yaml      
kubectl create namespace argocd
kubectl apply -f argocd-install.yaml -n argocd
```
>Note: After ArgoCD pod successful started in few minutes. Admin secret got by first easy searched command. Be careful with index.yaml and files of Helm repos and create/check you nfs storage for deployment in advance. 

### Changes in ArgoCD installer file argocd-install.yaml

?insecure
```yaml
containers:
      - args:
        - /usr/local/bin/argocd-server
        - --insecure     ### Added this line
        env:
        - name: ARGOCD_SERVER_INSECURE
```

? kind: Serv
```yaml

name: argocd-server
spec:
  type: NodePort  ## Changed service type
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 30007 ## Added port for bastion nginx
  - name: https
    port: 443
```

## Repo with Helm

[Helm Jenkins repo](https://github.com/jankalep/helm-25-23.git "GitHub Helm Chart")

## Apps repository

[Argo repo with apps](https://github.com/jankalep/argocd-25-23.git "GitHub Argo apps")

### Make separate repos in one
```bash
mkdir apps
cd apps
kubectl get application helm-25-23 -n argocd -o yaml >helm-25-23.yaml
vim helm-25-23.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
vim nfs-subdir-external-provisioner.yaml
```

### Make yaml for sealed secret
```bash
kubectl get secret repo-3843140805 -n argocd -o yaml > secret.yaml
cat secret.yaml | kubeseal --format yaml > sealed_secret.yaml
rm secret.yaml
```

### Actions in ArgoCD
Adding repos, Applications, etc.

## Screenshots

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/15.Kubernetes.CI_CD/argocd.png)

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/15.Kubernetes.CI_CD/helm-25-23.png)

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/15.Kubernetes.CI_CD/init_app.png)
