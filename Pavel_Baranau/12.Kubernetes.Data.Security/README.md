# 12. Kubernetes. Data. Security
## Deploy.yaml
``` yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: index-html-configmap
  namespace: default
data:
  index.html: |
    <html>
    <h1>Welcome</h1>
    </br>
    <h1>Hi! This is a configmap Index file. Pod Name: HOSTNAME </h1>
    </html
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app01-pv-claim
  labels:
    app: simple-web
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: nfs-app
  resources:
    requests:
      storage: 100Mi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
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
        resources:
          requests:
            cpu: 56m # 1000m = 1CPU (0.051)
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: nginx-index-file
          mountPath: /usr/share/nginx/html
        - name: ssh-key-secrets
          mountPath: /root/.ssh/
      initContainers:
      - name: index-config
        image: nginx:latest
        command: ["sh", "-c", 'cd /tmp/; sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
        env:
        - name: init_html
          valueFrom:
            configMapKeyRef:
              name: index-html-configmap
              key: index.html
        volumeMounts:
        - name: config-mount
          mountPath: /tmp
        - name: nginx-index-file
          mountPath: /usr/share/nginx/html
        - name: ssh-key-secrets
          mountPath: /root/.ssh
      volumes:
      - name: config-mount
        configMap:
          name: index-html-configmap
      - name: nginx-index-file
        emptyDir: {}
      - name: ssh
        emptyDir: {}
      - name: ssh-key-secrets
        secret:
          secretName: sealed-secret2
         
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-web-service
  labels:
    run: nginx-web-service
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
    nginx.ingress.kubernetes.io/server-alias: "app-alias.k8s-1.sa"
spec:
  rules:
    - host: nginx-test.k8s-1.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-web-service
                port:
                  number: 80
```
![termina](https://i.ibb.co/7ysT8JT/Screenshot-from-2023-11-08-23-50-43.png)
![termina](https://i.ibb.co/61ZgSBc/Screenshot-from-2023-11-08-23-52-37.png)
![Web](https://i.ibb.co/L8nyxz8/Screenshot-from-2023-11-08-23-53-32.png)
