# Homework Assignment 1. ArgoCD deployment and application
## deploy ArgoCD into your cluster
![argocd](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-21%20%D0%B2%2020.07.10.png?raw=true)
## add your repositories with helm packages as source for deployment, create separate repository which contains application manifests for ArgoCD
[helm-repo](https://github.com/ussnorma/helm-releases)
![repo-argocd](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-21%20%D0%B2%2020.10.29.png?raw=true)
## application objects
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: test
  namespace: argocd
spec:
  destination:
    namespace: helm-jenkins
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins-helm
    repoURL: https://ussnorma.github.io/helm-releases/
    targetRevision: 0.1.0
  syncPolicy:
    automated:
      prune: true
    syncOptions:
    - CreateNamespace=true
```
## git secrets objects as sealsecret objects
![argocd-secrets](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-21%20%D0%B2%2020.18.50.png?raw=true)
```bash
cd 15.ArgoCD/
kubectl get secrets repo-3401700050 -n argocd -o yaml > repo-3401700050.yaml
kubectl get secrets repo-4209665368 -n argocd -o yaml > repo-4209665368.yaml
cat repo-3401700050.yaml | kubeseal --format yaml > sealed_secret_repo-3401700050.yaml
cat repo-4209665368.yaml | kubeseal --format yaml > sealed_secret_repo-4209665368.yaml
```
## finish
![argocd](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-11%20%D0%B2%2022.30.55.png?raw=true)

