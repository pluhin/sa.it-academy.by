№ 14. Kubernetes application deployment

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
