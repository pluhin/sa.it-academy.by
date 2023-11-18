# 12. Kubernetes. Data. Security

## Pre-installation of the necessary tools. Generating a pair of public and private keys and adding them to the module for the root user as secrets

Install kubeseal


```bash
ssh root@xxx.19 
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/kubeseal-0.24.2-linux-amd64.tar.gz
tar -C /usr/local/bin -xzf  kubeseal-0.24.2-linux-amd64.tar.gz
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/controller.yaml
#Check
kubeseal
Ctrl+C
```

Generating and adding key. Name "my-secret"

```bash
kubectl create secret generic my-secret --from-file=ssh-privatekey=/root/.ssh/id_rsa --from-file=ssh-publickey=/root/.ssh/id_rsa.pub
#Check
kubectl get secrets
```

## Improving the manifest appl.yaml ( Homework 11.K8s)
appl_hw12.yaml
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: html-config
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <body>
    <h1>_HOSTNAME_</h1>
    </body>
    </html>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0
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
        volumeMounts:
        - name: index-html-for-nginx
          mountPath: /usr/share/nginx/html
        - name: ssh-secret
          mountPath: /root/.ssh
      initContainers:
      - name: config
        image: nginx:latest
        command: ["sh", "-c", 'cd /tmp/; sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
        env:
        - name: HTML_CONTENT
          valueFrom:
            configMapKeyRef:
              name: html-config
              key: index.html
        volumeMounts:
        - name: config-mount
          mountPath: /tmp
        - name: index-html-for-nginx
          mountPath: /usr/share/nginx/html
        - name: ssh-secret
          mountPath: /root/.ssh
      volumes:
      - name: config-mount
        configMap:
          name: html-config
      - name: index-html-for-nginx
        emptyDir: {}
      - name: ssh-keys
        emptyDir: {}
      - name: ssh-secret
        secret:
          secretName: my-secret
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: webserver
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
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.k8s-8.sa"
spec:
  rules:
  - host: app.k8s-8.sa
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80