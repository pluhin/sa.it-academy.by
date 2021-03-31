#### radarr.yaml
````
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: radarr-deployment
  labels:
    app: radarr
spec:
  replicas: 1
  selector:
    matchLabels:
      app: radarr
  template:
    metadata:
      labels:
        app: radarr
    spec:
      containers:
      - name: radarr
        image: linuxserver/radarr
        ports:
        - containerPort: 7878
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: radarr-service
  labels:
    run: radarr-service
spec:
  type: LoadBalancer
  ports:
  - port: 7878
    protocol: TCP
  selector:
    app: radarr

---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-radarr
spec:
  backend:
    serviceName: default-http-backend
    servicePort: 80
  rules:
  - host: radarr.k8s-11.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: radarr-service
          servicePort: 7878
 `````
 
 #### sonarr.yaml
