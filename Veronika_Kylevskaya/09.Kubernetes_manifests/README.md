## Manifest
```bash
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: sonarr
  name: sonarr
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: sonarr
  strategy:
    type: Recreate
  template:
    metadata:
      annotations:
        kompose.cmd: kompose convert
        kompose.version: 1.22.0 (HEAD)
      creationTimestamp: null
      labels:
        io.kompose.service: sonarr
    spec:
      containers:
        - env:
            - name: ARGS
              value: '""'
            - name: DEBUG
              value: '"no"'
            - name: PGID
              value: "1000"
            - name: PUID
              value: "1000"
            - name: TZ
              value: '"Etc/UTC"'
            - name: UMASK
              value: "002"
          image: hotio/sonarr:nightly
          name: sonarr-app
          ports:
            - containerPort: 8989
          resources: {}
          volumeMounts:
            - mountPath: /config
              name: sonarr-config
      restartPolicy: Always
      volumes:
        - name: sonarr-config
          persistentVolumeClaim:
            claimName: sonarr-config
status: {}
---
apiVersion: v1
kind: Service
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: sonarr
  name: sonarr
spec:
  ports:
    - name: "8081"
      port: 8081
      targetPort: 8989
  selector:
    io.kompose.service: sonarr
status:
  loadBalancer: {}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  creationTimestamp: null
  labels:
    io.kompose.service: sonarr-config
  name: sonarr-config
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi
status: {}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: radarr
  name: radarr
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: radarr
  strategy:
    type: Recreate
  template:
    metadata:
      annotations:
        kompose.cmd: kompose convert
        kompose.version: 1.22.0 (HEAD)
      creationTimestamp: null
      labels:
        io.kompose.service: radarr
    spec:
      containers:
        - env:
            - name: ARGS
              value: '""'
            - name: DEBUG
              value: '"no"'
            - name: PGID
              value: "1000"
            - name: PUID
              value: "1000"
            - name: TZ
              value: '"Etc/UTC"'
            - name: UMASK
              value: "002"
          image: hotio/radarr:release
          name: radarr-app
          ports:
            - containerPort: 7878
          resources: {}
          volumeMounts:
            - mountPath: /config
              name: radarr-config
      restartPolicy: Always
      volumes:
        - name: radarr-config
          persistentVolumeClaim:
            claimName: radarr-config
status: {}
---
apiVersion: v1
kind: Service
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: radarr
  name: radarr
spec:
  ports:
    - name: "8082"
      port: 8082
      targetPort: 7878
  selector:
    io.kompose.service: radarr
status:
  loadBalancer: {}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  creationTimestamp: null
  labels:
    io.kompose.service: radarr-config
  name: radarr-config
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi
status: {}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: flask-web
  name: flask-web
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: flask-web
  strategy: {}
  template:
    metadata:
      annotations:
        kompose.cmd: kompose convert
        kompose.version: 1.22.0 (HEAD)
      creationTimestamp: null
      labels:
        io.kompose.service: flask-web
    spec:
      containers:
        - image: flask-web
          name: flask-web-container
          ports:
            - containerPort: 5000
          resources: {}
      restartPolicy: Always
status: {}
---
apiVersion: v1
kind: Service
metadata:
  annotations:
    kompose.cmd: kompose convert
    kompose.version: 1.22.0 (HEAD)
  creationTimestamp: null
  labels:
    io.kompose.service: flask-web
  name: flask-web
spec:
  ports:
    - name: "8080"
      port: 8080
      targetPort: 5000
  selector:
    io.kompose.service: flask-web
status:
  loadBalancer: {}

```
## Helm
```bash
replicaCount: 1
image:
  repository: linuxserver/sonarr
  pullPolicy: IfNotPresent
  tag: "amd64-latest"
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
    - host: helmsonnar.k8s-11.sa
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
nodeSelector: {}
tolerations: []
affinity: {}
---
replicaCount: 1
image:
  repository: linuxserver/radarr
  pullPolicy: IfNotPresent
  tag: "amd64-latest"
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
oservice:
  type: LoadBalancer
  port: 8989
ingress:
  enabled: enable
  annotations: {}
   hosts: 
    - host: helmradar.k8s-11.sa
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
nodeSelector: {}
tolerations: []
affinity: {}
```
