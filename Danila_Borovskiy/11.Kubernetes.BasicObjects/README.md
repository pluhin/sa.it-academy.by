## 11.Kubernetes.Basic Objects

---

### 1. Nginx deployment

---

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
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
          volumeMounts:
            - name: nginx-html
              mountPath: /usr/share/nginx/html
      volumes:
        - name: nginx-html
          configMap:
            name: nginx-html
```

```yaml
# service.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx-pod
  ports:
    - protocol: TCP
      port: 80
```

```yaml
# ingress.yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
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

---

```bash
curl app.k8s-3.sa
```

```html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to nginx!</title>
</head>
<body>
  <h1>Hello from HTML file!</h1>
</body>
</html>
```

```bash
curl app.k8s-4.sa
```

```html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to nginx!</title>
</head>
<body>
  <h1>Hello from HTML file!</h1>
</body>
</html>
```

---

### 2. Self-hosted runner inside k8s (optional)

---

```bash
kubectl create ns github-self-hosted-runner
```

```bash
kubectl create secret generic github-personal-token \
    -n github-self-hosted-runner \
    --from-literal=GITHUB_PERSONAL_TOKEN=***
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-self-hosted-runner-deployment
  namespace: github-self-hosted-runner
  labels:
    app: github-self-hosted-runner-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: github-self-hosted-runner-pod
  template:
    metadata:
      labels:
        app: github-self-hosted-runner-pod
    spec:
      containers:
      - name: github-self-hosted-runner-container
        image: sanderknape/github-runner:latest
        env:
        - name: GITHUB_OWNER
          value: dborovskiy00
        - name: GITHUB_REPOSITORY
          value: kubernetes-test
        - name: GITHUB_PAT
          valueFrom:
            secretKeyRef:
              name: github-personal-token
              key: GITHUB_PERSONAL_TOKEN
```

```
Requesting token at 'https://api.github.com/repos/dborovskiy00/kubernetes-test/actions/runners/registration-token 

│ 
│ |        ____ _ _   _   _       _          _        _   _                      
│ |       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      
│ |      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     
│ |      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     
│ |       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     
│ |                                                                              
│ |                       Self-hosted runner registration                        
│ |                                                                              
│ 

│ # 


│ √ Connected to 

│ # Runner 



│ √ Runner successfully 
│ √ Runner connection is 

│ # Runner 


│ √ Settings Saved

│ .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/
│ Starting Runner listener with startup type: 
│ Started listener process, pid: 
│ Started running 

│ √ Connected to 

│ 2024-02-25 21:54:55Z: Listening for 
│ Runner update in progress, do not shutdown runner
│ Downloading 2.313.0 
│ Waiting for current job finish running
│ Generate and execute update script
│ Runner will exit shortly for update, should back online within 10 seconds
│ Runner listener exited with error code 
│ Runner listener exit because of updating, re-launch runner in 5 seconds
│ Starting Runner listener with startup type: 
│ Started listener process, pid: 

│ √ Connected to 

│ Current runner version: '2.313.0
│ 2024-02-25 21:55:29Z: Listening for 
└───────────────────────────────────────────
```
