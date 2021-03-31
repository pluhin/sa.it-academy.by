### radar.yaml
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
            cpu: 1000m
            memory: 2Gi
          limits:
            cpu: 1000m
            memory: 2Gi
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
````

### sonarr.yaml
````
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sonarr-deployment
  labels:
    app: sonarr
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sonarr
  template:
    metadata:
      labels:
        app: sonarr
    spec:
      containers:
      - name: sonarr
        image: linuxserver/sonarr
        ports:
        - containerPort: 8989
        resources:
          requests:
            cpu: 1000m
            memory: 2Gi
          limits:
            cpu: 1000m
            memory: 2Gi
---
apiVersion: v1
kind: Service
metadata:
  name: sonarr-service
  labels:
    run: sonarr-service
spec:
  type: LoadBalancer
  ports:
  - port: 8989
    protocol: TCP
  selector:
    app: sonarr

---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-sonarr
spec:
  backend:
    serviceName: default-http-backend
    servicePort: 80
  rules:
  - host: sonarr.k8s-11.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: sonarr-service
          servicePort: 8989
````
### next
