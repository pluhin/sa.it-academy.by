# 11.Kubernetes.Basic.Objects

## Nginx deploy
``` yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
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
        resources:
          requests:
            cpu: 56m # 1000m = 1CPU (0.051)
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-web-service
  labels:
    run: nginx-web-service
spec:
  #type: LoadBalancer
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
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.k8s-1.sa"
spec:
  rules:
    - host: nginx-test.k8s-1.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-web-service
                port:
                  number: 80
```

![Nginx](https://i.ibb.co/rFBgBzp/Screenshot-from-2023-11-07-23-16-35.png)

![Nginx](https://i.ibb.co/XjfkDVb/Screenshot-from-2023-11-07-23-21-56.png)

## Homework Assignment 2. Self-hosted runner inside k8s
### Self-hosted runner deploy
``` yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gh-runner
  labels:
    app: gh-runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: gh-runner
  template:
    metadata:
      labels:
        app: gh-runner
    spec:
      containers:
      - name: gh-runner
        image: sanderknape/github-runner:latest
        env:
        - name: GITHUB_OWNER
          value: pavelbaranov
        - name: GITHUB_REPOSITORY
          value: kubergit
        - name: GITHUB_PAT 
          valueFrom:
            secretKeyRef:
              name: gh-token-secret
              key: pat
```
### saled_gh.yaml
``` yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: gh-token-secret
  namespace: default
spec:
  encryptedData:
    pat: AgAWEfStzkrw8fFA0UTpl4QYda2VJ9jmDltDrhfR/o+0d5MtCuDBO5gCLagS23sIPS1SHxhuMl6KUOYroEJumcfU1iq1+Zn1Ldo1bijCYmwtUSuEZUkYaxn/wAzIJOvcmSQqU9rqP8kIJeYh4r/NAm+9IHpC5VsNy552fbgsZuvtluMKz0/GfsLhN3oO+bPfelwmniHYx3eVYHMOY6z3Bt0kTmPeuVjv7PIAOBst4f1uSTizgW1H6EpLDIUUSlqA25mbonPa/jeNruHT9sHja2llzOBjPKg9u5EmYmbqPpICVPU2Pzd84Ahj1ltiR9UltVOeebGoREZ4UP03vYhBvhttKrewD3wUMv/so+eu4LGaSFffimZkLvpXnW4Vyp7lbbTPCYOjwDo9At/Zi92GOhsbH+usS4xHI+NBwVfBfI5HGnh+r6aroL4yRlIqWwTgvd84M8Y7DTP5KKxEYyTT6lF2Oy0aWvIjg+ZbXZgoZEdn1EvE+oDlncQ4kbB/5KZx0ksMkQRfUhxY/kdCvqQOSPRCqOQXXdV7iaqxLeTZ3HTnvj4MFJ/xY2RdduKhGwAYD/d2pEhiUdNDosaRn9+p1+7xddGWfyCHHAhJTHwHnjcCdoLUODhCqmJCEV8lPnH1R37progmjTGK6PGLaYvdnwUK1W3fO5aNYELgUrIlNz3j4wVigq1XhAYPxqQIjwwk7RdFm4OGyMRAZATWig76MiwlPNsqmmqpmFivMKqrwv+P+/XLa1+9vwt4
  template:
    metadata:
      creationTimestamp: null
      name: gh-token-secret
      namespace: default
    type: Opaque
```

![Github Runner](https://i.ibb.co/DfdB5P5/Screenshot-from-2023-11-07-23-32-27.png)

![Github Runner in kuber](https://i.ibb.co/bH1H8Bp/Screenshot-from-2023-11-07-23-34-55.png)