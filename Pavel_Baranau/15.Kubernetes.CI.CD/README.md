# HW 15.Kubernetes.CI.CD
## install argocd
``` bash
wget https://raw.githubusercontent.com/pluhin/argocd-25-23/master/argocd-install.yaml
kubectl create namespace argocd
kubectl apply -f argocd-install.yaml -n argocd

``` bash
kubectl get application jenkins -n argocd -o yaml > apps/jenkins.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > apps/nfs-subdir-external-provisioner.yaml
kubectl get secret repo-3235210532 -n argocd -o yaml | kubeseal --format yaml > apps/sealed-secret.yaml
```
![argocd](https://i.ibb.co/wJrqC9Z/Screenshot-from-2023-12-05-09-06-30.png)
![argocd](https://i.ibb.co/dp1hHFD/Screenshot-from-2023-12-05-09-21-17.png)
![argocd](https://i.ibb.co/HxGPPpJ/Screenshot-from-2023-12-05-09-21-26.png)
![argocd](https://i.ibb.co/56SD6nT/Screenshot-from-2023-12-05-09-27-25.png)
## Apps repository
[Argo repo with apps](https://github.com/pavelbaranov/appsargocd.git "GitHub Argo apps")
 