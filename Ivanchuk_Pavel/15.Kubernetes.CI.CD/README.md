# Kubernetes CI CD 

## Deploy ArgoCD into my cluster
```bash
 2903  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
 2904  ls -la
 2905  nano argocd-install.yaml
 2906  kubectl create namespace argocd
 2907  k9s
 2908  history | grep 6443
 2909  ssh -L 6443:127.0.0.1:6443 root@192.168.203.3 -f -N
 2910  kubectl create namespace argocd
 2911  kubectl apply -f argocd-install.yaml -n argocd
```

## Add your repositories with helm packages as source for deployment

**_Github repositoryn with helm:_**
[->Click here <-](https://github.com/IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps "GitHub Helm Chart")

## Created separate repository which contains application git secrets objects as sealsecret objects for ArgoCD 
```bash
 2975  kubectl get application argo.my-helm-jenkins -n argocd -o yaml > apps/argo.my-helm-jenkins.yaml
 2976  kubectl get application jenkins-git -n argocd -o yaml > apps/jenkins-git.yaml
 2977  kubectl get application helm-nfs-external-provisioner -n argocd -o yaml > apps/helm-nfs-external-provisioner.yaml
 2978  kubectl get application grafana-loki -n argocd -o yaml > apps/grafana-loki.yaml
 2997  kubectl get secret repo-367471090 -n argocd -o yaml | kubeseal --format yaml > apps/sealed-secret.yaml
```

**_After that add all files in repo:_**
[->Click here <-](https://github.com/IPaul32/ArgoCD-Ivanchuk-md2-25-23 "GitHub Argo apps")

## Add this repository as project for your applications

![argo-cd-apps](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/821e0593-153c-45ca-bfc4-77762126ec98)
---
![argo_init-inside](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/2e8de85c-ed9a-4ac9-b9d6-52e2f64ded4c)
---
![sealed_secrect_in_k9s](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/df2f1c73-0ffe-4e1c-b95c-0551b41c8209)
---
![apps_argo_in_k9s](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/27ffc706-d1dd-4f00-900d-f7a7055850a6)
