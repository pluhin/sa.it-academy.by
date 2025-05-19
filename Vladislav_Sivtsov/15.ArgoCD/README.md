### Homework 15. Kubernetes CI CD
# github page of helm repository https://vladislavsivtsov.github.io/helm-21-35/
# seperate repository https://github.com/VladislavSivtsov/argo-flax
```bash
cd 15.FluxCD.ArgoCD 
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
vim argocd-install.yaml
kubectl apply -f argocd-install.yaml -n argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
# create base-secret
```bash
mkdir argo-apps 
echo -n "secret123" | base64     c2VjcmV0MTIz
echo -n "abc123" | base64
``` 
#create sealed-secret and put it in my 'argo-apps' repository
 ```bash
 kubeseal --format yaml < temporary-secret.yaml > sealed-secret.yaml       
tree                                                                                                                                                                                                           
.
├── argo-app-manifest
│   └── app.yaml
├── argo-apps
│   ├── app-web.yaml
│   ├── helm.yaml
│   └── sealed-secret.yaml
├── argocd-install.yaml
├── ci-cd
│   └── jenkins.yaml
├── flux
│   └── flux-system
│       ├── gotk-components.yaml
│       ├── gotk-sync.yaml
│       └── kustomization.yaml
└── README.md
```
# I havent'done my homework 14. Can't deploy jenkins via helm. That's why I use first-app

 