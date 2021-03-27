# 09.Kubernetes
## Kubernetes.yaml
## 
```sh
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: nginx
spec:
  replicas: 1
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
        image: nginx
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: persistent-storage
          mountPath: "/usr/share/nginx/html"
      volumes:
      - name: persistent-storage
        persistentVolumeClaim:
          claimName: app01-pv-claim
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sonarr-app
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
      - name: sonarr-app
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
apiVersion: apps/v1
kind: Deployment
metadata:
  name: radarr-app
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
      - name: radarr-image
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
apiVersion: v1
kind: PersistentVolume
metadata:
  name: app01-pv-volume
  labels:
    type: nfs
    name: app-nfs-vol
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain
  nfs:
    path: /mnt/IT-Academy/nfs-data/sa2-16-21/Biaspatsau/html
    server: 192.168.37.105
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app01-pv-claim
  labels:
    app: apache
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
  selector:
    matchLabels:
      name: app-nfs-vol
      type: nfs
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
  name: ingress-sa
spec:
  backend:
    serviceName: http-front
    servicePort: 80
  rules:
  - host: app.k8s-10.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: nginx-service
          servicePort: 80
  - host: sonarr.k8s-10.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: sonarr-service
          servicePort: 8989
  - host: radarr.k8s-10.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: radarr-service
          servicePort: 7878
```
## nginx.yaml
## 
```sh
replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: "latest"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations: {}

podSecurityContext: {}

securityContext: {}

service:
  type: LoadBalancer
  port: 80

ingress:
  enabled: enable
  annotations: {}

  hosts:
    - host: helmnginx.k8s-4.sa
      paths: ["/"]
  tls: []

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```
## radarr.yaml
## 
```sh
replicaCount: 1

image:
  repository: linuxserver/radarr
  pullPolicy: IfNotPresent
  tag: "latest"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations: {}

podSecurityContext: {}

securityContext: {}

service:
  type: LoadBalancer
  port: 7878

ingress:
  enabled: enable
  annotations: {}
    
  hosts: 
    - host: helmradarr.k8s-4.sa
      paths: ["/"]
  tls: []
  
resources: 
   limits:
     cpu: 2000m
     memory: 2Gi
   requests:
     cpu: 2000m
     memory: 2Gi
  
autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```
## sonarr.yaml
## 
```sh
replicaCount: 1

image:
  repository: linuxserver/sonarr
  pullPolicy: IfNotPresent
  tag: "latest"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations: {}

podSecurityContext: {}

securityContext: {}

service:
  type: LoadBalancer
  port: 8989

ingress:
  enabled: enable
  annotations: {}
    
  hosts: 
    - host: helmsonnar.k8s-4.sa
      paths: ["/"]
  tls: []
  
resources: 
   limits:
     cpu: 2000m
     memory: 2Gi
   requests:
     cpu: 2000m
     memory: 2Gi
  
autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```

