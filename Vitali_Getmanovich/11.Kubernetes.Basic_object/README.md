# 11. Kubernetes. Basic objects

## nginx-server.yaml
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-webserver
  labels:
    app: newweb
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: newweb
  template:
    metadata:
      labels:
        app: newweb
    spec:
      containers:
      - name: nginx
        image: nginx
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
  name: my-web-service
  labels:
    run: my-web-service
spec:
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: newweb
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.k8s-4.sa"
spec:
  rules:
    - host: app.k8s-4.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-web-service
                port:
                  number: 80
```
---
### Add ingress-controller

![screeningress-controller](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/11.Kubernetes.Basic_object/ingress-controller.png)

---
## Add alias in file host
178.124.206.53 app-alias.k8s-4.sa app.k8s-4.sa

---

## kubectl apply -f nginx-server.yaml
---
## Screen pods 

![screen-pods](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/11.Kubernetes.Basic_object/screen-pods.png)

---

## Screen services

![screen-services](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/11.Kubernetes.Basic_object/screen-svc.png)

---

## Screen ingresses

![screen-ingresses](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/11.Kubernetes.Basic_object/screen-ingress.png)

---

## Screen browser

![screen-browser](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/11.Kubernetes.Basic_object/screen-browser.png)
