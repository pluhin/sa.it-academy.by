# 15.Kubernetes CI CD

## deploy ArgoCD into your cluster

```bash
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd.yaml
vim argocd.yaml
kubectl apply -f argocd.yaml -n argocd
```
## repository which contains application manifests for ArgoCD

[GitHUB](https://github.com/NataliaBelogolovaya/app-argocd.git)

## comands for creating secrets 

```bash
kubectl get secrets repo-686804584 -n argocd -o yaml > secret.yaml
cat secret.yaml | kubeseal --format yaml > sealed_secret.yaml
```
