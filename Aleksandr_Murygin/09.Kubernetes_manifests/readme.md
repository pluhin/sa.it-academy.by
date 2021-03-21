# Kubernetes
## radarr 

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: radarr-web
  labels:
    app: simple-app2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: simple-app2
  template:
    metadata:
      labels:
        app: simple-app2
    spec:
      containers:
      - name: sonarr
        image: linuxserver/radarr
        ports:
        - containerPort: 7878
        resources:
          requests:
            cpu: 50m
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 200Mi
---
apiVersion: v1
kind: Service
metadata:
  name: simple-app2-service
  labels:
    run: simple-app2-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
    targetPort: 7878
  selector:
    app: simple-app2
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-sa2
spec:
  backend:
    serviceName: default-http-backend2
    servicePort: 80
  rules:
  - host: second.k8s-17.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: simple-app2-service
          servicePort: 80
```
## sonarr
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sonarr-web
  labels:
    app: simple-app1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: simple-app1
  template:
    metadata:
      labels:
        app: simple-app1
    spec:
      containers:
      - name: sonarr
        image: linuxserver/sonarr
        ports:
        - containerPort: 8989
        resources:
          requests:
            cpu: 50m
            memory: 200Mi
          limits:
            cpu: 100m
            memory: 300Mi
---
apiVersion: v1
kind: Service
metadata:
  name: simple-app1-service
  labels:
    run: simple-app1-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
    targetPort: 8989
  selector:
    app: simple-app1
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-sa
spec:
  backend:
    serviceName: default-http-backend
    servicePort: 80
  rules:
  - host: first.k8s-17.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: simple-app1-service
          servicePort: 80
```
# Helm
templates>deployment. I changed containerport for radarr and sonarr
### radarr
```yaml
# Default values for radarr-helm.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: linuxserver/radarr
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: "latest"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}

podSecurityContext: {}
  # fsGroup: 2000

securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

service:
  type: LoadBalancer
  port: 80

ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: second-helm.k8s-17.sa
      paths:
      - path: /
        backend:
          serviceName: chart-example.local
          servicePort: 80
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources: 
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 500m
    memory: 512Mi

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

### sonarr
```yaml
# Default values for sonarr-helm.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: linuxserver/sonarr
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: "latest"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}

podSecurityContext: {}
  # fsGroup: 2000

securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

service:
  type: LoadBalancer
  port: 80

ingress:
  enabled: true
  annotations: 
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: first-helm.k8s-17.sa
      paths:
      - path: /
        backend:
          serviceName: chart-example.local
          servicePort: 80
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources:
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 500m
    memory: 512Mi

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
