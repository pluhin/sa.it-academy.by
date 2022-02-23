# 12.Kubernetes.First deployment

## Manifest file
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: ngnix
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
        volumeMounts:
        - name: my-index-html
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: my-index-html
        configMap:
          name: index-html-data
---
apiVersion: v1
kind: Service
metadata:
  name: web-service
  labels:
    run: web-service
spec:
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
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-16.sa"
spec:
  rules:
    - host: app.k8s-15.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web-service
                port:
                  number: 80
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: index-html-data
data:
  index.html: |
    <html>
       <head>
           <title>Welcome to Kuber</title>
       </head>
       <body>Made by Sergei Svinobaev</body>
    </html>
```

# Test page
![Image](Screenshot.png)