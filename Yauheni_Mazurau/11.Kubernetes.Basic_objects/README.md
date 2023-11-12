# 11. Kubernetes. Basic objects

* Deploy ingress cont

ssh root@xxx.8
```bash
wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.3/deploy/static/provider/baremetal/deploy.yaml -O 
nano ingress-controller.yaml
kubectl apply -f ingress-controller.yaml     
exit
```
ingress-controller.yaml  [https://github.com/pluhin/sa.it-academy.by/blob/md-sa2-25-23/demo/11.K8s/ingress-controller.yaml]

## Homework Assignment 1. Nginx deployment
ssh root@xxx.19

appl_hw.yaml
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-hw11
  labels:
    app: simple-web
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0
  selector:
    matchLabels:
      app: simple-web
  template:
    metadata:
      labels:
        app: simple-web
    spec:
      containers:
      - name: php-apache
        image: eboraas/apache-php
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
  name: simple-web-service
  labels:
    run: simple-web-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: simple-web
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.nt-k8s-8.sa"
spec:
  rules:
    - host: nginx-test.k8s-8.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: simple-web-service
                port:
                  number: 80
```   
```bash               
kubectl apply -f appl_hw.yaml
```