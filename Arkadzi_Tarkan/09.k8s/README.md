## radar-app.yaml

### [radarr-app](http://radarr-app.k8s-21.sa)

```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: radarr-app
  labels:
    app: radarr-web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: radarr-web
  template:
    metadata:
      labels:
        app: radarr-web
    spec:
      containers:
      - name: radarr
        image: ghcr.io/linuxserver/radarr
        ports:
        - containerPort: 7878
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: radarr-web-service
  labels:
    run: radarr-web-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 7878
    protocol: TCP
  selector:
    app: radarr-web
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
  - host: radarr-app.k8s-21.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: radarr-web-service
          servicePort: 80
```

## sonar-app.yaml

### [sonarr-app](http://sonarr-app.k8s-21.sa)

```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sonarr-app
  labels:
    app: sonarr-web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sonarr-web
  template:
    metadata:
      labels:
        app: sonarr-web
    spec:
      containers:
      - name: sonarr
        image: ghcr.io/linuxserver/sonarr
        ports:
        - containerPort: 8989
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 200m
            memory: 200Mi
---
apiVersion: v1
kind: Service
metadata:
  name: sonarr-web-service
  labels:
    run: sonarr-web-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 8989
    protocol: TCP
  selector:
    app: sonarr-web
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
  - host: sonarr-app.k8s-21.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: sonarr-web-service
          servicePort: 80
```

## radarr-helm.yaml

### [radarr-helm](http://radarr-helm.k8s-21.sa/)

```
# Default values for radarr-helm.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: ghcr.io/linuxserver/radarr
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
  port: 7878

ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: radarr-helm.k8s-21.sa
      paths:
      - path: /
        backend:
          serviceName: radarr-helm-service
          servicePort: 7878
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
    cpu: 200m
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 128Mi

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

## sonarr-helm.yaml

### [sonarr-helm](sonarr-helm.k8s-21.sa)

```

# Default values for sonarr-helm.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: ghcr.io/linuxserver/sonarr
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
  port: 8989

ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: sonarr-helm.k8s-21.sa
      paths:
      - path: /
        backend:
          serviceName: sonarr-helm-service
          servicePort: 8989
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
    cpu: 200m
    memory: 256Mi

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