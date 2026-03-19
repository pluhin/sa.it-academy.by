


```
#deployment.yaml

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
        command:
        - /bin/sh
        - -c
        - |
          envsubst '$POD_NAME $POD_IP' < /tmp/template/index.template > /usr/share/nginx/html/index.html &&
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

```

kubectl apply -f app.yaml --context k8s


``` yaml
#app.yaml


apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    app: nginx
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
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


After 
```
kubectl rollout restart deployment nginx --context k8s
```
See stepped up pods in default namespace:

![[Attachments/replicas4_vs_RollingUpdate.png]]



* ingress controller


![[Attachments/replicas4_vs_RollingUpdate.png]]



```
cat /etc/hosts

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
178.124.206.53 app.k8s-3.sa app.k8s-4.sa  app.k8s-9.sa
```

*Check Nginx thrue bastion server

```
curl app.k8s-3.sa/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

```



GitHubRunner:


1. Craeate namespace

```---
apiVersion: v1
kind: Namespace
metadata:
  name: githubrunner
  labels:
    app.kubernetes.io/name: githubrunner
```


2. Create secret

kubectl create secret generic github-runner-secret   --from-literal=RUNNER_TOKEN=ALAMysycret -n githubrunner --context k8s

3. Deploy pod in namespace

kubectl apply -f deploymentrunner.yaml --context k8s



Deployment:

```yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-runner
  namespace: githubrunner
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
      - name: runner
        image: myoung34/github-runner:latest
        env:
        - name: RUNNER_TOKEN
          valueFrom:
            secretKeyRef:
              name: github-runner-secret
              key: RUNNER_TOKEN
        - name: REPO_URL
          value: "https://github.com/poteenoka/k8s_minikube_workflow"
        - name: RUNNER_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: DISABLE_AUTO_UPDATE
          value: "1"
        resources:
          requests:
            cpu: 100m
            memory: 256Mi
          limits:
            cpu: 1000m
            memory: 1Gi

```



Result:

![[Attachments/GitHubRunner.png]]


![[Attachments/insideK8s.png]]
![[Attachments/RunnerinsideK8s.png]]

