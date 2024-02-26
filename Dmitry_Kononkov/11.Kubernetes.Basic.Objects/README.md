# Homework Assignment 1. Nginx deployment

## app.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-nginx
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: app-service
  labels:
    run: app-service
spec:
  ports:
  - protocol: TCP
    port: 80
  selector:
    app: nginx
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-10.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx-test.k8s-9.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: app-service
                port:
                  number: 80
```
## k9s-pods
![k9s-pods](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-26%20%D0%B2%2023.12.31.png?raw=true)
## k9s-ingress
![k9s-ingress](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-26%20%D0%B2%2023.12.45.png?raw=true)
## check:
![check-k8s-9.sa](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-26%20%D0%B2%2023.12.00.png?raw=true)
![check-k8s-10.sa](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-26%20%D0%B2%2023.12.08.png?raw=true)

# Homework Assignment 2. Self-hosted runner inside k8s (optional)

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.crds.yaml
wget https://get.helm.sh/helm-v3.14.2-linux-amd64.tar.gz
tar -zxvf helm-v3.14.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
helm repo add jetstack https://charts.jetstack.io
kubectl create ns cert-manager
helm install my-release --namespace cert-manager --version v1.14.3 jetstack/cert-manager
kubectl create ns actions-runner-system
kubectl create secret generic controller-manager -n actions-runner-system 
--from-literal=github_token=<GitHub Token>
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
helm repo update
helm upgrade --install --namespace actions-runner-system 
--create-namespace --wait actions-runner-controller 
actions-runner-controller/actions-runner-controller --set 
syncPeriod=1m
```
## runner.yaml
```yaml
apiVersion: actions.summerwind.dev/v1alpha1
kind: RunnerDeployment
metadata:
  name: k8s-action-runner
  namespace: actions-runner-system
spec:
  replicas: 2 
  template:
    spec:
      repository: ussnorma/K8s-temp
      labels:
        - arc-runner-repo 
```

## action for test:

```yaml
name: Test selfhosted runner
on:
  push:
    branches: [main]
  
jobs:
  build: 
    runs-on: arc-runner-repo
    steps: 
     - run: echo "Hello build!"
```