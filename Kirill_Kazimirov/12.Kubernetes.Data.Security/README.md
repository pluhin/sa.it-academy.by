# Homework Assignment 1. Config maps and secrets
## 1. Add index.php page as config map, which should display hostname of pod as first level header, or generate index.html inside init container
Обновлённый test-nginx.yaml
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: html-config
data:
  index.html: 
    !DOCTYPE html
    html
    head
        meta charset="UTF-8"
        titlePod Hostname/title
        style
          .text 
          text-align: center;
          
        /style
    /head
    body
        div class="text"
        h1Classic: Hello, World!/h1
        h2Pod Name: HOSTNAME/h2
        /div
    /body
    /html
---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: test-nginx
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 2
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
        command: "sh", "-c", cd /tmp/; sed -e "s/HOSTNAME/HOSTNAME/" /tmp/index.html  /usr/share/nginx/html/index.html
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
        emptyDir: 
      - name: ssh-secret
        secret:
          secretName: ssh-keys
---
apiVersion: v1
kind: Service
metadata:
  name: app-service-nginx
  labels:
    run: app-service-nginx
spec:
  ports:
  - protocol: TCP
    port: 80
  selector:
    app: nginx
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx-test2.k8s-1.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx-test2.k8s-1.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: app-service-nginx
                port:
                  number: 80
```
## 2. generate pair public and private keys (or use existing) and add them to the pod for user root as secrets, please use sealsecret object for that

Установим  sealed-secret contoller в наш кластер 
```
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/controller.yaml
```

Установим kubeseal

```
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/kubeseal-0.27.0-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xzf kubeseal-0.27.0-linux-amd64.tar.gz
kubeseal --version
```

Получим на выходе версию kubeseal

```
kubeseal version: 0.27.0

```
Создал два файлика с любым содержимым
``` 
nano privkey
nano pubkey.pub
```
Сгенерировал пару ключей. Положил в k8s. На основании этого получил ssh-keys-secret.yaml и закодировал его с помощью kubeseal в sealed-ssh-keys-secret.yaml
```
kubectl create secret generic ssh-keys --from-file=privkey --from-file=pubkey.pub

kubectl get secret ssh-keys  -o yaml > ssh-keys-secret.yaml
kubeseal < ssh-keys-secret.yaml > sealed-ssh-keys-secret.yaml

```
Задеплоил в мой кластер
```
kubectl apply -f sealed-ssh-keys-secret.yaml
```
Проверка этих ключей
```
kubectl exec -it test-nginx-5444dfc794-cd9w4 -- bash
```
На выходе
``` 
kirillubuntudev:/12.Kubernetes kubectl exec -it test-nginx-5444dfc794-cd9w4 -- bash
Defaulted container "nginx" out of: nginx, config (init)
roottest-nginx-5444dfc794-cd9w4:/ ls /root/.ssh
privkey  pubkey.pub
roottest-nginx-5444dfc794-cd9w4:/ exit
exit
```
