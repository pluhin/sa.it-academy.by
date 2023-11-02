# 11. Kubernetes. Basic objects

## Homework Assignment 1. Nginx deployment

Create deployment of nginx service:

- replicas: 4

```yaml
spec:
  replicas: 4
```

- set resources for pods

```yaml
resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
```

- deployment shouldn't have any outage (service is available all time)

```yaml
strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0
```

- ingress rule for host name (nginx-test.k8s-<NUMBER>.sa)

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.nt-k8s-7.sa"
spec:
  rules:
    - host: nginx-test.k8s-7.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: simple-web-service
                port:
                  number: 80
```
