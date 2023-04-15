# 11. Kubernetes. Basic objects

## Ingress

![Ingress](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/11.K8s.Objects.Part.1/k9s.png)

## Nginx

![Ingress](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/11.K8s.Objects.Part.1/nginx-test.png)

## Nginxd.yaml

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: "33%"
      maxUnavailable: "0%"
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
  name: nginx
  labels:
    run: nginx-service
spec:
        #type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: nginx

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-14.sa"
spec:
  rules:
    - host: nginx-test.k8s-14.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx
                port:
                  number: 80
```
