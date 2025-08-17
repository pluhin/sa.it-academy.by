## 1. Create new repository
## 2. Configured GitHub Pages
## 3. Create Helm app

```
helm create jenkins-helm
cd jenkins-helm
```


## 4. Deleted and created new files in templates

```
rm -rf templates/*
cd templates/
nano namespace.yaml
nano secret.yaml
nano rbac.yaml
nano deployment.yaml
nano configmaps.yaml
nano service.yaml
nano ingress.yaml
cd ..
nano values.yaml
mkdir files
cd files/
nano jenkins.yaml
nano basic-security.groovy
cd ..
```


## 5. Create helm repo(in existing git repo)

```
helm package jenkins.yaml
helm repo index . --url https://2qic1.github.io/14.k8s/
git add --all
git commit -m "k8s_v1"
git push
helm repo add my-jenkins-repo https://2qic1.github.io/14.k8s/
helm repo update
helm install jenkins my-jenkins-repo/jenkins-helm   -n ci-cd   --create-namespace
```

## Jenkins

![jenkins](https://github.com/2Qic1/04.Github-actions/blob/master/photo/jenkins.jpg)

