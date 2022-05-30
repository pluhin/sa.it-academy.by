## K8s.First Deployment_Alex_Muzhichenko

---

### Screenshots_Main_Task:

![Image 1](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/12.Kubernetes_First_deployment/31.PNG)

 
![Image 2](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/12.Kubernetes_First_deployment/32.PNG)


###  Deployment of nginx service

```bash

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
        - name: alex-index-html
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: alex-index-html
        configMap:
          name: alex-html-data
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
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-32.sa"
spec:
  rules:
    - host: app.k8s-31.sa
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
  name: alex-html-data
data:
  index.html: |
    <html>
       <head>
           <title>Welcome to my Webpage</title>
       </head>
       <body>Made by Alex Muzhichenko</body>
    </html>


```

### Additional task:

```bash
apiVersion: v1
kind: Secret
metadata:
  name: github-token
data:
  token: ***** 
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-runner
  labels:
    app: github-runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: github-runner
  template:
    metadata:
      labels:
        app: github-runner
    spec:
      containers:
      - name: github-runner
        image: sanderknape/github-runner:latest
        env:
        - name: GITHUB_OWNER
          value: amuzhichenko
        - name: GITHUB_REPOSITORY
          value: self-hosted-runner_kub
        - name: GITHUB_PAT
          valueFrom:
            secretKeyRef:
              name: github-token
              key: token

```

![Image 1](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/12.Kubernetes_First_deployment/runner%20install.JPG)



![Image 2](https://github.com/amuzhichenko/sa.it-academy.by/blob/md-sa2-20-22/Alex_Muzhichenko/12.Kubernetes_First_deployment/runner_github.JPG)
