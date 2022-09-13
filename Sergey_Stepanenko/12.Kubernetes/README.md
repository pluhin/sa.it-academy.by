## K8s.First Deployment

###  Deployment of nginx service
```bash
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver1
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
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 200m
            memory: 200Mi
        volumeMounts:
        - name: index-html
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: index-html
        configMap:
          name: html-data
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
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-28.sa"
spec:
  rules:
    - host: app.k8s-27.sa
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
  name: html-data
data:
  index.html: |
    <html>
       <head>
       </head>
       <body>
       <h1>Homework 12 Sergey Stepanenko</h1>
       </body>
    </html>
```