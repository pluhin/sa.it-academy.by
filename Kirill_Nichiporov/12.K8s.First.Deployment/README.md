## Deployment for Nginx

```bash

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-server
  labels:
    app: simple-web
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: "50%"
      maxUnavailable: "50%"
  selector:
    matchLabels:
      app: simple-web
  template:
    metadata:
      labels:
        app: simple-web
    spec:
      containers:
      - name: nginx-install
        image: nginx
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
        - name: test-config-mount
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: test-config-mount
        configMap:
          name: test-config

---
apiVersion: v1
kind: Service
metadata:
  name: simple-web-service-nginx
  labels:
    run: simple-web-service-nginx
spec:
        #type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: simple-web

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-22.sa"
spec:
  rules:
    - host: nginx.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: simple-web-service-nginx
                port:
                  number: 80

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-config
data:
  index.html: |
    <html>
    <head>
    <title>Nginx</title>
    </head>
    <body><h1>Nginx.</h1>
    </body>
    </html>
    
```

![image](https://user-images.githubusercontent.com/110092772/186648569-613ba316-6ddd-4751-b28e-9b00aa882bf5.png)

![image](https://user-images.githubusercontent.com/110092772/186648654-6918adad-595d-47e7-b6cf-14bc2e43f31e.png)

## Runner

```bash

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
          value: KirillNichiporov
        - name: GITHUB_REPOSITORY
          value: K8s-runner
        - name: GITHUB_PAT
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: token


```

## Secret

```bash

apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  token: # Github token (base64)


```


![image](https://user-images.githubusercontent.com/110092772/186677729-b6d31e6a-e584-4a93-85c7-f90dc6acf363.png)


