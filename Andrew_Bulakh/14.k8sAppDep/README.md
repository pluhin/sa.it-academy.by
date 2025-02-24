# 14. Kubernetes application deployment

```bash
helm create jenkins-helm
helm package jenkins-helm/

git branch -M main
git remote add origin https://github.com/AndrewBulah/14.-KubernetesApplicationDeployment.git
git add jenkins-helm-0.1.0.tgz
git commit -m "helm"
git push -u origin main
```
[download](https://github.com/AndrewBulah/14.-KubernetesApplicationDeployment/raw/refs/heads/main/jenkins-helm-0.1.0.tgz)