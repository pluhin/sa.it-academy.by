## 15.Kubernetes.ArgoCD

---

### Deploy ArgoCD into your cluster:

---

```bash
mkdir 15.K8s.ArgoCD
cd 15.K8s.ArgoCD/
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd.yaml
nano argocd.yaml
kubectl apply -f argocd.yaml -n argocd
```
![argocd_K9S](argocd_K9S.jpg)

### Add your repositories with helm packages as source for deployment:

![argocd_repositories](argocd_repositories.jpg)


### Apply Sealed secrets:

---

![argocd_sealed-secret](argocd_sealed-secret.jpg)


![argocd_sealed-secret_object](argocd_sealed-secret_object.jpg)

![sealed-secret_K9S](sealed-secret_K9S.jpg)
