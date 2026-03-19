app.yaml
```  yaml
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels: 
    app: nginx
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  - name: https
    port: 443
    protocol: TCP
    targetPort: 443
  selector:
    app: nginx
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-4.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: app.k8s-3.sa
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

deployment.yaml
``` yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
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
        ports:
        - containerPort: 80
        - containerPort: 443
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        volumeMounts:
        - name: template
          mountPath: /tmp/template
          readOnly: true
        - name: html
          mountPath: /usr/share/nginx/html
        - name: tls
          mountPath: /etc/nginx/ssl
          readOnly: true
        - name: ssl-config
          mountPath: /etc/nginx/conf.d/ssl.conf
          subPath: ssl.conf
          readOnly: true
        command:
        - /bin/sh
        - -c
        - |
          sed -e "s#\$POD_NAME#${POD_NAME}#g" -e "s#\$POD_IP#${POD_IP}#g" /tmp/template/index.template > /usr/share/nginx/html/index.html &&
          exec nginx -g 'daemon off;'
        resources:
          requests:
            cpu: 50m
            memory: 64Mi
          limits:
            cpu: 200m
            memory: 128Mi
      volumes:
      - name: template
        configMap:
          name: nginx-index-template
      - name: html
        emptyDir: {}
      - name: tls
        secret:
          secretName: app-k8s-3-sa-tls
      - name: ssl-config
        configMap:
          name: nginx-ssl-config


```


#configmap

``` yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-index-template
  labels:
    app: nginx
data:
  "index.template": |
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>Pod Info</title>
      <style>
        body { font-family: sans-serif; max-width: 40em; margin: 2em auto; padding: 0 1em; }
        h1 { color: #333; }
        code { background: #f4f4f4; padding: .2em .4em; border-radius: 3px; }
      </style>
    </head>
    <body>
      <h1>Pod name: $POD_NAME</h1>
      <p><strong>Pod IP:</strong> <code>$POD_IP</code></p>
    </body>
    </html>

```




# Result: any curl -> round robin between 4 repl

``` bash 
curl http://app.k8s-3.sa/
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Pod Info</title>
  <style>
    body { font-family: sans-serif; max-width: 40em; margin: 2em auto; padding: 0 1em; }
    h1 { color: #333; }
    code { background: #f4f4f4; padding: .2em .4em; border-radius: 3px; }
  </style>
</head>
<body>
  <h1>Pod name: nginx-678fcfb6d7-cmhm5</h1>
  <p><strong>Pod IP:</strong> <code>10.233.102.141</code></p>
</body>
</html>
```

```  Bash
curl http://app.k8s-3.sa/
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Pod Info</title>
  <style>
    body { font-family: sans-serif; max-width: 40em; margin: 2em auto; padding: 0 1em; }
    h1 { color: #333; }
    code { background: #f4f4f4; padding: .2em .4em; border-radius: 3px; }
  </style>
</head>
<body>
  <h1>Pod name: nginx-678fcfb6d7-cbcs7</h1>
  <p><strong>Pod IP:</strong> <code>10.233.102.142</code></p>
</body>
</html>
```


---------------


# Secrets.. thrue secrets


1. Generate selfsigned cert

``` bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout app.k8s-3.sa.key   -out app.k8s-3.sa.crt   -subj "/CN=app.k8s-3.sa"   -addext "subjectAltName=DNS:app.k8s-3.sa"
```
2. Grep Cert && Key in base64
``` bash
cat app.k8s-3.sa.crt | base64 -w0
cat app.k8s-3.sa.key | base64 -w0
```
3.   Create Secrets

``` yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: app-k8s-3-sa-tls
  namespace: default
type: kubernetes.io/tls
data:
  tls.crt: "$secret..." 
  "$secret..."
```

4. Apply Secrets   ```kubectl apply -f secret-tls.yaml --context k8s```

5. ConfigMap 4 certs

``` yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-ssl-config
  labels:
    app: nginx
data:
  ssl.conf: |
    server {
      listen 443 ssl;
      server_name app.k8s-3.sa;
      ssl_certificate     /etc/nginx/ssl/tls.crt;
      ssl_certificate_key /etc/nginx/ssl/tls.key;
      root /usr/share/nginx/html;
      index index.html;
      location / {
        try_files $uri $uri/ /index.html;
      }
    }

```
6.   Https default redirect to Jfrog..  I can`t validate https site...
