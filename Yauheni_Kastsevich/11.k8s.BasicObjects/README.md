#
# 11. Kubernetes. Basic objects
#

## Homework Assignment 1. Nginx deployment

### nginx-manifest.yaml

``` yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-project
spec:
  #type: NodePort
  ports:
    - port: 80
  selector:
    app: nginx-project
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-project
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
       maxSurge: 25%
       maxUnavailable: 25% 
  selector:
    matchLabels:
      app: nginx-project
  template:
    metadata:
      labels:
        app: nginx-project
    spec:
      containers:
        - name: nginx
          image: nginx:1.17.3
          ports:
            - containerPort: 80
          resources:
            requests:
              memory: "100Mi"
              cpu: "200m"
            limits:
              memory: "200Mi"
              cpu: "400m"

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-22.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-project
                port:
                  number: 80
```
### screen nginx

![nginx](https://github.com/YauheniKastsevich/my_pictures/blob/master/nginx%20screen.png)
