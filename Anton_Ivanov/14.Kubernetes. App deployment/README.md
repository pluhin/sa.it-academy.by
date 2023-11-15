# Ivanov Anton HW14

## Jenkins helm installation

```yaml
helm create jenkins
nano jenkins/values
nano jenkins/tempates/deployment.yaml
kubectl create namespace ci-cd
kubectl label namespace ci-cd app.kubernetes.io/managed-by=Helm
kubectl annotate namespace ci-cd meta.helm.sh/release-name=jenkins --overwrite
kubectl annotate namespace ci-cd meta.helm.sh/release-namespace=default --overwrite
helm package jenkins
helm install jenkins ../helm-releases/jenkins-0.1.0.tgz
```

## Links

[GitHub link](https://github.com/AntonIvanovDevOps/Helm)

[HELM repository link](https://antonivanovdevops.github.io/Helm/)
