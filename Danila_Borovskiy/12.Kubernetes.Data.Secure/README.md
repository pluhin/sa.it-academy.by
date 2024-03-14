## 12.Kubernetes. Data. Security

---

### 1. Config maps and secrets

```yaml
# config_map.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-html
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>Welcome to nginx!</title>
    </head>
    <body>
      <h1>Hello from HTML file!</h1>
      <p>Pod: HOSTNAME</p>
    </body>
    </html>
```

```yaml
# deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
  selector:
    matchLabels:
      app: nginx-pod
  template:
    metadata:
      labels:
        app: nginx-pod
    spec:
      initContainers:
        - name: init-nginx-container
          image: nginx:latest
          volumeMounts:
            - name: nginx-html-from-config-map
              mountPath: /tmp
            - name: updated-nginx-html
              mountPath: /usr/share/nginx/html
          command: ["sh", "-c", 'sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']

      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
          volumeMounts:
            - name: updated-nginx-html
              mountPath: /usr/share/nginx/html
            - name: ssh-secret
              mountPath: /root/.ssh
      volumes:
        - name: nginx-html-from-config-map
          configMap:
            name: nginx-html
        - name: updated-nginx-html
          emptyDir: {}
        - name: ssh-secret
          secret:
            secretName: ssh-keys
```

```bash
# generate secret

kubectl create secret generic ssh-keys --from-file=private-key.pem --from-file=public-key.pub
```

```bash
# create secret yaml from existed one

kubectl get secret ssh-keys  -o yaml > ssh-keys-secret.yaml
```

```bash
# make secret sealed

kubeseal < ssh-keys-secret.yaml > sealed-ssh-keys-secret.yaml
```

```bash
# apply sealed secret

kubectl apply -f sealed-ssh-keys-secret.yaml
```

---

### Validation

```bash
curl app.k8s-4.sa

# output

<!DOCTYPE html>
<html>
<head>
  <title>Welcome to nginx!</title>
</head>
<body>
  <h1>Hello from HTML file!</h1>
  <p>Pod: nginx-deployment-5d4957555f-j2f2k</p>
</body>
</html>
```

```bash
curl app.k8s-3.sa

# output

<!DOCTYPE html>
<html>
<head>
  <title>Welcome to nginx!</title>
</head>
<body>
  <h1>Hello from HTML file!</h1>
  <p>Pod: nginx-deployment-5d4957555f-29wqz</p>
</body>
</html>
```

```bash
# root@nginx-deployment-5d4957555f-5czn6

ls /root/.ssh

# output

private-key.pem  public-key.pub
```
