## Access nginx service from browser

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/11.Kubernetes.BasicObjects/nginx-test.png "access nginx service from browser")


## Nginx pods list

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/11.Kubernetes.BasicObjects/nginx-pods-list.png "Nginx pods list")


## Deployment
```
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
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-2.sa"
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
                name: app-service
                port:
                  number: 80
                  
---
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
      maxSurge: 25%
      maxUnavailable: 25%
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
            memory: 64Mi
          limits:
            cpu: 100m
            memory: 128Mi
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 10
          timeoutSeconds: 2
          successThreshold: 1
          failureThreshold: 3
```
