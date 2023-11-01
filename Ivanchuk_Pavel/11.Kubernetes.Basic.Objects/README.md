# Kubernetes. Basic objects

## Nginx deployment

**_manifest file_**
```yaml
s nano README.md
➜  11.Kubernetes.Basic.objects cat manifest-nginx.yaml
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
    nginx.ingress.kubernetes.io/server-alias: "nginx-alias.k8s-3.sa"
spec:
  rules:
  - host: nginx.k8s-3.sa
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

---
![nginx-work](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/a256dc96-fbd7-462c-8b1b-14e3c434125e)

---

![pods_work](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/5fb05e2e-c0dd-4419-a2ad-00a90e599ddb)

---

![ingress_nginx_work](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/f71d4c3c-2e32-483e-9b72-da009e339891)

---

![k9s_serveces](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/5ce1c362-6f84-4cf9-beea-505c07333226)

## Self-hosted runner inside k8s (optional)

**_manifest for runner_**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-runner
  labels:
    app: runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: runner
  template:
    metadata:
      labels:
        app: runner
    spec:
      containers:
      - name: github-runner
        image: sanderknape/github-runner:latest
        env:
        - name: GITHUB_OWNER
          value: IPaul32
        - name: GITHUB_REPOSITORY
          value: 10.Kubernetes.Installation
        - name: GITHUB_PAT
          valueFrom:
            secretKeyRef:
              name: github-token-secret
              key: GITHUB_TOKEN
        resources:
          requests:
            memory: 128Mi
            cpu: 250m
          limits:
             memory: 264Mi
             cpu: 500m
```
---
![Runner in github](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/42212312-7e55-4998-91d7-5f279246223c)
---
![runner in k9s](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/d74919b1-8f5e-4683-b52c-8aaed4bbd6ec)
---
![pods in k9s](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/f36314c3-7930-4a75-afe3-601bc568a35a)

