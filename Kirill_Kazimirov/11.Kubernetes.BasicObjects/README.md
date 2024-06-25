# Homework Assignment 1. Nginx deployment

 Create deployment of nginx service:
 replicas: 4
 set resources for pods
 deployment shouldn't have any outage (service is available all time)
 ingress rule for host name (nginx-test.k8s-1.sa)

Создал файл test-nginx.yaml 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test-nginx
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
  name: app-service-nginx
  labels:
    run: app-service-nginx
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
  name: ingress-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-1.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx-test.k8s-1.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: app-service-nginx
                port:
                  number: 80
```
Деплоим наше приложение
```
kubectl create -f app-nginx.yaml
```

С помощью k9s проверим результат 


