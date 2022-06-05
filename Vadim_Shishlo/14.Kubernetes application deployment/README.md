## 14. Kubernetes application deployment
* [GitHub](https://github.com/mnogosemok/JenkinsHelm)
## Run commands
``` Bash
project: default
source:
  repoURL: 'https://github.com/mnogosemok/JenkinsHelm'
  targetRevision: 0.2.0
  chart: jenkins-app
destination:
  server: 'https://kubernetes.default.svc'
  namespace: ci-cd-helm
syncPolicy:
  automated: {}
```
## Screenshots
* ![Image 1](argocd.PNG)
* ![Image 1](Jenkins.PNG)



