# 14. Kubernetes application deployment

## Chart structure
```
jenkins
├── Chart.yaml
├── templates
│   ├── clusterrolebinding.yaml
│   ├── configmap-jenkins.yaml
│   ├── configmap-security.yaml
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── hpa.yaml
│   ├── httproute.yaml
│   ├── ingress.yaml
│   ├── namespace.yaml
│   ├── secret.yaml
│   ├── serviceaccount.yaml
│   └── service.yaml
└── values.yaml
```

## Create Chart Structure & base files
```
mkdir jenkins
helm create jenkins
```

## Helm chart check
```
helm lint jenkins
```

## Package chart
```
helm package jenkins/
```
### Install package
```
helm upgrade --install jenkins jenkins-0.1.0.tgz -f ./jenkins/values.yaml --namespace ci-cd   --create-namespace
```

## Repo URL 
### https://ArtegaAS.github.io/jenkins-helm

### Chech repo 
__Input__
```
helm repo add jenkins-helm https://ArtegaAS.github.io/jenkins-helm
helm repo update
helm search repo jenkins-helm
```

__Output__
```
"jenkins-helm" has been added to your repositories

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "jenkins-helm" chart repository
...Successfully got an update from the "sealed-secrets" chart repository
...Successfully got an update from the "ingress-nginx" chart repository

NAME                    CHART VERSION   APP VERSION     DESCRIPTION
jenkins-helm/jenkins    0.1.0           latest          Helm chart for Jenkins CI/CD
```
