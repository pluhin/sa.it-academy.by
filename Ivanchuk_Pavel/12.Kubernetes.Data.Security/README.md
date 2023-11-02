# 12. Kubernetes. Data. Security

## Config maps and secrets

**_manifest_**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: html-config
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Pod Hostname</title>
        <style>
          .text {
          text-align: center;
          }
        </style>
    </head>
    <body>
        <div class="text">
        <h1>Classic: Hello, World!</h1>
        <h2>Pod Name: HOSTNAME</h2>
        </div>
    </body>
    </html>

---
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
          secretName: ssh-keys-secret
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

**_Install kubeseal_**
```bash 
 751  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/kubeseal-0.24.2-linux-amd64.tar.gz
  752  tar -C /usr/local/bin -xzf  kubeseal-0.24.2-linux-amd64.tar.gz
  753  kubeseal
  754  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/controller.yaml
  1089  kubeseal --version
  kubeseal version: 0.24.2
```

**_init secred_**
```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: github-token-secret
type: Opaque
data:
  GITHUB_TOKEN: token
---
apiVersion: v1
kind: Secret
metadata:
  name: ssh-keys-secret
type: Opaque
data:
  SSH_PUBLIC: id_rsa.pub key
  SSH_PRIVATE: id_rsa key
```

**_sealsed secret_**
```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: github-token-secret
  namespace: default
spec:
  encryptedData:
    GITHUB_TOKEN: AgAgNbrSdlZ+Raf+ex2f2IqtA2J/02FSq8+4kI8nUBqOR+JFKrhkaoSSisjReFd3VIlCoNs1h5PGLTy0hGI19sRIVPn5S1RZoeDH7EyUtCxKgADNfp9//4Zs/Wr3rfsGZLqEgzXQZ6JRAYa/JkM9DBIjWHYLgeMX/zW5vz2IwSCYA+qfpdEloCR/YvIRIDPvjQvECeb08g7AmOPj2kQSmNk0tqTEsWYwLNBmZjWLW+NJ1/fyEKbA4yb7hwpvnT6m9ATHU6Q82xO4ylgLir/CtJUsQ2dwgNtZgHpMBzAbiLhswfxJw95JQls1qTZyIK1f6Y8dggQomXaQlIoFea11+LMWa5TkgoRa1CHZWKmwFQGjAJzIk4cWro/Amv9MzSCz+xZ7Y6L9yhFNlCl5VIYWFg/Lqomj+G3vAqvkTKtn7tvRMCKvkrl00eVb6XdfGobR9z7i1OejJppUWd38TYoBEwXc172UcTF+xxDW1DwAgJTmZtQSYFf/5EG6tpqCAA6Xfc1aX7yEnYb8NG3EOi1slAaMyV/ih/Oup2jg5/niakmnWS5GI2xJZggjmF57XE0SU6oTXZVm7YNoU/U/4LDCL5GhZ6UPUP87HhQfyQ/6RbeHD0xIxyVWzzff2l43buN0ttSgx8p2rkBtceVZRZL7afvYDLy5qW0QC4w9MbMJhSO50CHm0pXfDgqSksNqp7kPWj6vmM7op8PUGHbZLfHrwKWtRLxDTJb6FrToq9dnWuFg/9Nyo6xJkUM/
  template:
    metadata:
      creationTimestamp: null
      name: github-token-secret
      namespace: default
    type: Opaque
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: ssh-keys-secret
  namespace: default
spec:
  encryptedData:
    SSH_PRIVATE: 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
    SSH_PUBLIC: AgA3ZAWKJKvBAyswD2wluepR825Pm/ym0JPmDJOAle1OiIE0BVaf7l7yJ9bhTXmAOhckmjNmdxqYosh/v+K9ItBSpQ5+NA/lkeJnjR0PHz3voJQmMmVvOaAZ0P2tagtDolDzWOmR8ULkCjxUUeinmkcpGf7QO67HVhol90FuR7vK0VfFXeFS9+8nE8oY8zEnSb9I7sRYGLudvW8AXPnVLNC+UcB192GXHuofxLI83hSzexTqJqUV15Lbp0TcpmtDJOMVl+1CeTlKKCmF+ddtelxkWxxU8+Mtd6iEIYc9xErg5Nv8X+4CrGiarIpXvd8TSJ9/Z3rX42zli+r3RTUa51Z5AtnNUkgQNWNJ+AUGiUeza6pbmrjArE7HX950vMQ5cAG7faddX/Sp6fNZ4/dGnpXghfaRKv0DSmj369NpZ5QOQkhLPCaDXlbeENYaTmdmCUAjZFFlN+3RNbGQA24G7DaPOxjgmG7KNkQXnfQE3vG+cBrX8M176/30FWbfuDFHb9ismVEXRK15KC/nCtlJ1oCCuxHGHzf5ljoAXK4ZH+HXkkKeiDvFVl0pQCxGVkyHEdyxvVjCRytZsegUQSlrp/ENYAwlBpPA38VIXaaDe1ofse5L3xbc6Yfl+FgrDAqrpd6Ydscl6NLs3I/cKXoJBmnXaN9xB6YxW5GhdvVmZ8NpAG53/WWsX4uTPh+rab0wmX7kPA/T4hwK3ZB3AJODXmvEiW0wBSVRAml2QkH0dG/CNlqSAjdMaSogxe11qGWYiy0CcvueucxmJbJKGF7g2xnA1xn3Jut2tx3pmFzEkPGhVUCLjmsbXLzQtqJk7FM1CYAXSghVw4k9H0RvvXykeaDIt7lq5KkV2/X77WA6YhRbjucMH1PbAXILzssW9Cucj0b+7W++kcEsszS/h52J42ttgNHL8GVyaxxMgA0WJSYg2FYV6HL6Yvjqe0ICzMDoggzhr7ofQrylIvt6ZjREq9ZQ4dVly24hVfa2E10+glL9m1PerUyGrwTTFAKFUC9A6y7Mpsak9P/q1tmgqgwh57iSFVZ0UMMWwdaEukmPLa9nPhnYDZFRqppjTO6s5zdgJr0HV6HupwucC9mjBpkJD3mVt1w7Za8Z2P/3kjmr3irMUnlhMRtK/VtGPqRgQmG2PxboL5OyF9L/f8wyZT72/+PM0MiX6gQL1GElSnCXqsUTWySQRgPfBnz2hpRTPNCMO3uuD8LlACfZaS2r/imstGN8VzwvyT1PY0X4KffUfX4qo6SCsGtQVklqZ2pgHpIn/a8UzLlKfYJeNUl4l+Fn2hhE2ozTaySCcVXdQ9HXupXsDzzzJzXz/8wojAxTMksu0lAGPCW2KHhbBPhkK12dVc9Q+cGll1xwLEoiACM/ZY8GlHqKKgT0vNfhEvn7OYu9psahjhk7L7zblpfXGaih40Ruzy8IRvwGYcW+ZaIk8z2m5vfhwok=
  template:
    metadata:
      creationTimestamp: null
      name: ssh-keys-secret
      namespace: default
    type: Opaque
```
### Secret
---
![Secret_1](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/96080085-e61b-4595-9093-ac7a0477c939)
---
![Secret_3](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/f3fc77db-cedb-4285-855f-3b46ccb0115e)
---
![Secret_2](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/7b826403-0fcd-43d5-b748-165956d5b906)

### Working html with all 4 pods 

![pod_3](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/bdf1dc14-d4a6-49c9-9a78-1ac6a2ada22e)
---
![pod_4](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/14c73b8b-d489-433b-af35-e3f5e1c17e6e)
---
![pod_2](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/98172d58-ee69-4c90-8d4b-95e3c061afa6)
---
![pod_1](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/07741ab9-8983-4c6e-be61-ddacee1a82f5)
