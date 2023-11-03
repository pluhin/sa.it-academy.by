# 11. Kubernetes. Basic objects


## Homework Assignment 1. Nginx deployment

Create deployment of nginx service:

replicas: 4
set resources for pods
deployment shouldn't have any outage (service is available all time)
ingress rule for host name (nginx-test.k8s-<NUMBER>.sa)

>Note : First I add string to my OS host file for aliasing AC host

### history of commands
```bash
kubectl apply -f ingress-controller.yaml
kubectl apply -f manifest-nginx.yaml
```

### manifest-nginx.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-nginx
  labels:
    app: nginx
spec:
  replicas: 4
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
  name: nginx-service
  labels:
    run: webserver-nginx
spec:
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "nginx-alias.k8s-6.sa"
spec:
  rules:
  - host: nginx.k8s-6.sa
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


### Screen that ingress controller and nginx service had applied and run in k9s

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/k9s-nginx-pods.png)

### Testing working NGINX via browser

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/nginx-running.png)

