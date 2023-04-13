# 15. Kubernetes CI CD
## Install Argocd in kubernetes
```bash
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
kubectl apply -f argocd-install.yaml -n argocd
```
## Add my repository helm-23-23 with helm packages as source for deployment

## [Link Helm repo](https://github.com/VitaliGet/helm-23-23.git)

---

![browser-argocd-helm](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/15.Kubernetes_CI-CD/argocd-helm.png)

---

## Create separate repository argocd-23-23 which contains application manifests for ArgoCD

## Create yaml file from the application and seal secret repo
```bash
mkdir apps
cd apps
kubectl get application helm-jenkins -n argocd -o yaml > helm-jenkins.yaml
kubectl get application helm-application -n argocd -o yaml > helm-application.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
kubectl get secret repo-2153938693 -n argocd -o yaml | kubeseal --format yaml > argocd-23-23-sealsecret.yaml
```
## Push this folder in repository argocd-23-23

## [Link Argo repo](https://github.com/VitaliGet/argocd-23-23.git)


## Deploy application from repository argocd-23-23

![browser-argocd-app](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/15.Kubernetes_CI-CD/argocd-app.png)

---

![browser-argocd-init](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/15.Kubernetes_CI-CD/argocd-init.png)

---

## List repositories

![browser-argocd-repo](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/15.Kubernetes_CI-CD/argocd-repo.png)
