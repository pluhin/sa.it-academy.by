# Homework Assignment 1. Nginx deployment

## Create deployment of nginx service:
  * replicas: 4
  * set resources for pods
  * deployment shouldn't have any outage (service is available all time)
  * ingress rule for host name (nginx-test.k8s-<NUMBER>.sa)
  
  * nginx.yaml
```bash
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-deployment
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
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
spec:
  type: LoadBalancer
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
  * Pods  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/1.jpg)  

  * Ingress  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/2.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/3.jpg)  

  * Curl  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/4.jpg)  

# Homework Assignment 2. Self-hosted runner inside k8s (optional)
  * deploy pod inside k8s which should be connected to github as self-hosted runner  

  * Dockerfile
```bash
FROM ubuntu:22.04

 ARG RUNNER_VERSION

 RUN apt-get update -y && apt-get upgrade -y && useradd -m runner

 RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
     curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev

 RUN cd /home/runner && mkdir actions-runner && cd actions-runner \
     && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
     && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

 RUN chown -R runner ~runner && /home/runner/actions-runner/bin/installdependencies.sh

 COPY start.sh start.sh

 RUN chmod +x start.sh

 USER runner

 ENTRYPOINT ["./start.sh"]
```

  * start.sh
```bash
#!/bin/bash

 REPOSITORY=$REPOSITORY
 ACCESS_TOKEN=$ACCESS_TOKEN

 cd /home/runner/actions-runner

 ./config.sh --url https://github.com/${REPOSITORY} --token ${ACCESS_TOKEN}

 ./run.sh & wait $!
```
  * runner-k8s.yaml
```bash
apiVersion: v1
kind: Pod
metadata:
   name: runner-k8s
   labels:
     app: runner
spec:
   containers:
   - name: runner-container
     image: ghcr.io/pro100chok91/runner:v1.0
     command: ["/bin/sh", "-c"]
     args: ["sleep 360d"]
     imagePullPolicy: Always
   restartPolicy: Always
```
  * Deploy pod  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/6.jpg)  

```bash
kubectl exec runner-k8s -- env REPOSITORY="pro100chok91/11.basic" ACCESS_TOKEN=XXXXXXXXXXXXXXXXXX /bin/bash -c "./start.sh"
```

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/5.jpg)  

  * Runner on GH  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/7.jpg)  

  * Job for runner  
```bash
name: k8s runner
on:
  workflow_dispatch:
jobs:
  check-pods:
    runs-on: self-hosted
    steps:
      - name: Display OS information
        run: |
          cat /etc/os-release
      - name: Display disk's information
        run: |
          df -h
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/8.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/11.Kubernetes.Basic.Objects/img/9.jpg)  
