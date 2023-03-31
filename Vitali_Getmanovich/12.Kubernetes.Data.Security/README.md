# 12.Kubernetes.Data.Security

## Add config map
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: server-config
data:
  server.html: |
    <html>
    <html>
    <head>
    <title>My-web-server</title>
    <style>
    html { color-scheme: light dark; }
    body { width: 35em; margin: 0 auto;
    font-family: Tahoma, Verdana, Arial, sans-serif; }
    </style>
    </head>
    <body>
    <h1>Welcome to HOSTNAME</h1>
    </body>
    </html>
```
---
## Create initContainer and volumes

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
      volumes:
      - name: nginx-config
        configMap:
          name: server-config
      - name: server
        emptyDir:
          sizeLimit: 100Mi
   
      initContainers:
      - name: init-container
        image: nginx
        command: ["bash", "-c", 'cd /usr/share/nginx/html/; sed -e "s/HOSTNAME/$HOSTNAME/" server.html > /usr/share/nginx/html/index.html']
        volumeMounts:
        - name: nginx-config
          mountPath: /usr/share/nginx/html/server.html
          subPath: server.html
        - name: server
          mountPath: /usr/share/nginx/html/

      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 51m
            memory: 51Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: server
          mountPath: /usr/share/nginx/html/
```
---
## Screen browser

![screen_browser_1](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/screen_browser_1.png)

---

![screen_browser_2](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/screen_browser_2.png)

---

![screen_browser_3](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/screen_browser_3.png)

---

## Create and seal secret for private and public keys. Add keys to /root/.ssh in pods

### Install kubeseal
```bash
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/kubeseal-0.20.2-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xzf kubeseal-0.20.2-linux-amd64.tar.gz
$ kubeseal --version
kubeseal version: 0.20.2
```
### Add controller
```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/controller.yaml
```
### Create and seal secret for private and public keys

```bash
kubectl create secret generic ssh-secret-key --from-file=ssh-privatekey=~/.ssh/id_rsa --from-file=ssh-publickey=~/.ssh/id_rsa.pub -o yaml | kubeseal --format yaml > ssh-sealed-secret.yaml
```
### ssh-sealed-secret.yaml
```yaml
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: ssh-secret-key
  namespace: default
spec:
  encryptedData:
    ssh-privatekey: AgCQbuyJt5z+2AWwpGHEhREfu8kj...
    ssh-publickey: AgBCw2ADLyP0PzPMgtYtWXZMrR8su...
  template:
    metadata:
      creationTimestamp: null
      name: ssh-secret-key
      namespace: default
    type: Opaque
```
### Add volumes
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
      volumes:
      - name: nginx-config
        configMap:
          name: server-config
      - name: server
        emptyDir:
          sizeLimit: 100Mi
      - name: secret-config
        secret:
          secretName: ssh-secret-key

      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 51m
            memory: 51Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: server
          mountPath: /usr/share/nginx/html/
        - name: secret-config
          mountPath: /root/.ssh/
```
### Screens

![screen_secrets](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/screen_secrets.png)

---

![describe_ssh_secret_key](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/describe_ssh_secret_key.png)

---

![keys_in_pods](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/12.Kubernetes.Data.Security/keys_in_pods.png)

---
