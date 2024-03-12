# Homework Assignment 1. Transform Jenkins deployment to Helm

## Helm package for your Jenkins application:

```bash
kubectl apply -f jenkins-helm-ns-secret.yaml
helm create jenkins-helm
rm -rf ingress.yaml 
rm -rf service.yaml 
rm -rf serviceaccount.yaml
helm package jenkins-helm
helm install helm-jenkins --dry-run helm/releases/jenkins-helm-0.1.0.tgz -n default
helm install helm-jenkins jenkins-helm-0.1.0.tgz -n default
helm repo index --url "https://ussnorma.github.io/helm-releases/" .
echo -e "User-Agent: *\nDisallow: /" > robots.txt
helm repo add test https://ussnorma.github.io/helm-releases/
helm repo update
helm search repo test -l 
```
### github repo for helm:
[GIT-Helm Repo](https://github.com/ussnorma/helm-releases)

### Install jenkins from github helm repo:
```bash
helm install jenkins-helm test/jenkins-helm -n default
```

### Output:
```bash
NAME: jenkins-helm
LAST DEPLOYED: Mon Mar 11 17:28:50 2024
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=jenkins-helm,app.kubernetes.io/instance=jenkins-helm" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
```

### k9s:
![k9s-helm-jenkins-git](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-11%20%D0%B2%2020.30.54.png?raw=true)

### Jenkins web:

![jenkins web](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-11%20%D0%B2%2020.35.12.png?raw=true)