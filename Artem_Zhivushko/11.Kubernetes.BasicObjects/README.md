# Nginx deployment

Create deployment of nginx service:

- replicas: 4
- set resources for pods
- deployment shouldn't have any outage (service is available all time)
- ingress rule for host name (`nginx-test.k8s-<NUMBER>.sa`)

```yaml
---
# ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-nginx-sa
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-6.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx-test.k8s-5.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-service
                port:
                  number: 80
---
# deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx-app
spec:
  selector:
    matchLabels:
      app: nginx-app
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 2
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
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
            cpu: 100m
            memory: 100Mi
---
# service
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
spec:
  ports:
  - protocol: TCP
    port: 80
  selector:
    app: nginx-app
```

![](./attachments/Pasted%20image%2020240229234043.png)

![](./attachments/Pasted%20image%2020240229234104.png)

![](./attachments/Pasted%20image%2020240229234120.png)

![](./attachments/Pasted%20image%2020240229233958.png)

![](./attachments/Pasted%20image%2020240229234013.png)
