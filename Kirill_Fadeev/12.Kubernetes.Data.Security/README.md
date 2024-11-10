# Homework Assignment 1. Config maps and secrets
## You need to improve deployment from previous task:

  * Add index.php page as config map, which should display hostname of pod as first level header, or generate index.html inside init container  
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-pod
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
      initContainers:
      - name: init-nginx
        image: busybox
        command: ['sh', '-c', 'echo "<html><body><h1>Welcome to K8s pod $(HOSTNAME)</h1></body></html>" > /usr/share/nginx/html/index.html']
        env:
        - name: HOSTNAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        volumeMounts:
        - name: nginx-html
          mountPath: /usr/share/nginx/html/
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 200m
            memory: 200Mi
        volumeMounts:
        - name: nginx-html
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: nginx-html
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
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
                name: nginx-service
                port:
                  number: 80
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/1.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/2.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/3.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/4.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/5.jpg)  

  * Generate pair public and private keys (or use existing) and add them to the pod for user root as secrets, please use sealsecret object for that  
```bash
cat /root/.ssh/id_rsa | base64
cat /root/.ssh/id_rsa.pub | base64
```
  * secret.yaml  
```yaml
apiVersion: v1
kind: Secret
metadata:
name: ssh-keys
type: Opaque
data:
id_rsa: <base64-encoded-private-key>
id_rsa.pub: <base64-encoded-public-key>
```
```bash
kubeseal --format yaml < secret.yaml > sealedsecret.yaml
```
  * sealedsecret.yaml  
```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: ssh-keys
  namespace: default
spec:
  encryptedData:
    id_rsa: XXXXXXXXXXX
    id_rsa.pub: XXXXXXXXXXX
  template:
    metadata:
      creationTimestamp: null
      name: ssh-keys
      namespace: default
    type: Opaque
```
```bash
kubectl apply -f sealedsecret.yaml
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/7.jpg)  
  
  * Add sealedsecret to nginx.yaml  
```yaml
        volumeMounts:
        - name: nginx-html
          mountPath: /usr/share/nginx/html/
        - name: ssh-keys
          mountPath: /root/.ssh
          readOnly: true
      volumes:
      - name: nginx-html
        emptyDir: {}
      - name: ssh-keys
        secret:
          secretName: ssh-keys
```

  * Validate secrets and index.html display  
  ![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/12.Kubernetes.Data.Security/img/6.jpg)  