## Finish application deployment

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/14.Kubernetes.Jenkins/screenshots/jenkins-ui.png "Jenkins UI")

## 1 Create repository

https://github.com/andrey-bar/kuber

## 2 Create GitHub pages

https://andrey-bar.github.io/kuber

## 3 Create Helm application

```
mkdir helm-source -p
mkdir helm-release -p

cd helm-source

helm create jenkins-helm
cd jenkins-helm
```

## 4 Remove all files and create new ones in templates dir
```
rm -rf templates/*

nano templates/configmap-jenkins.yaml
nano templates/configmap-security.yaml
nano templates/deployment.yaml
nano templates/ingress.yaml
nano templates/namespace.yaml
nano templates/rbac.yaml
nano templates/secret.yaml
nano templates/service.yaml

nano values.yaml
```

## 5 Create helm repo in existing git repository
```
helm package helm-source/jenkins-helm

mv jenkins-helm-0.1.0.tgz helm-release/

helm repo index --url "https://andrey-bar.github.io/kuber" .

helm repo add kuber https://andrey-bar.github.io/kuber

helm repo update

helm search repo kuber -l

helm install jenkins-helm kuber/jenkins-helm --version 0.1.0 -n ci-cd
```

### Jenkins pod

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/14.Kubernetes.Jenkins/screenshots/jenkins-pod.png "Jenkins pod")

