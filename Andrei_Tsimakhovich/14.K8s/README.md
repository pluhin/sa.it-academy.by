# 14. Kubernetes application deployment

## Homework Assignment 1. Transform Jenkins deployment to Helm
### Part 1
1. Deployment of jenkins has been completed.
### Part 2 
Create helm package for your Jenkins application  
Structure:  
/jenkins/Chart.yaml  
/jenkins/templates/configmap-casc.yaml  
/jenkins/templates/deployment.yaml  
/jenkins/templates/ingress.yaml  
/jenkins/templates/namespace.yaml  
/jenkins/templates/secret.yaml  
/jenkins/values.yaml  
1. I've created files as described above.
2. Run helm:
```
debian@vbox ~/i/1/helm-sources (master)> helm install jenkins ./jenkins
NAME: jenkins
LAST DEPLOYED: Thu May 15 16:48:35 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```
- github action build and k9s screen you can find in attachement
