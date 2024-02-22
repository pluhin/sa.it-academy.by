# 11.Kubernetes.Basic_objects
---

## Homework Assignment 1. Nginx deployment

## nginx-manifest.yaml
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
      maxUnavailable: 0
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
            cpu: 51m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
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
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-8.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-7.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-service
                port:
                  number: 80
```

## Nginx pods
![Nginx pods](https://github.com/Goshaker/DevOpsCourse/blob/master/11.Kubernetes.Basic_objects/nginx-k9s.png)

## nginx.k8s-7.sa
![nginx.k8s-7.sa](https://github.com/Goshaker/DevOpsCourse/blob/master/11.Kubernetes.Basic_objects/nginx.k8s-7.sa.png)

## nginx.k8s-8.sa
![nginx.k8s-8.sa](https://github.com/Goshaker/DevOpsCourse/blob/master/11.Kubernetes.Basic_objects/nginx.k8s-8.sa.png)

## Homework Assignment 2. Self-hosted runner inside k8s

## Repo for Kubernetes
[Github repo for Kubernetes](https://github.com/Goshaker/K8s)

## runner-manifest.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-runner
  labels:
    app: runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: runner
  template:
    metadata:
      labels:
        app: runner
    spec:
      containers:
      - name: github-runner
        image: sanderknape/github-runner:latest
        env:
        - name: GITHUB_OWNER
          value: Goshaker
        - name: GITHUB_REPOSITORY
          value: K8s
        - name: GITHUB_PAT
          valueFrom:
            secretKeyRef:
              name: github-token-secret
              key: GITHUB_TOKEN
        resources:
          requests:
            memory: 128Mi
            cpu: 250m
          limits:
             memory: 264Mi
             cpu: 500m
```

## K9s runner
![K9s runner](https://github.com/Goshaker/DevOpsCourse/blob/master/11.Kubernetes.Basic_objects/runner.png)

## Github GUI runner
![Github GUI runner](https://github.com/Goshaker/DevOpsCourse/blob/master/11.Kubernetes.Basic_objects/gui-runner.png)