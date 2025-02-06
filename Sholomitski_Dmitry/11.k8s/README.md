# Homework Assignment 1. Nginx deployment

## Deployment of nginx service

Created [yaml file](nginx.yaml)

bash command

```bash 
kubectl apply -f nginx.yaml
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    app: nginx-server
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
  selector:
    matchLabels:
      app: nginx-server
  template:
    metadata:
      labels:
        app: nginx-server
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
  type: LoadBalancer
  ports:
    - port: 80
      protocol: TCP
      nodePort: 30001
  selector:
    app: nginx-server
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-20.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-19.sa
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

Connection from my PC

![alt text](image.png)
