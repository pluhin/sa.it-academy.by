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
### radarr-helm 
`````
# Default values for raddar-app.
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
  port: 7878

ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: radarr-helm.k8s-11.sa
      paths:
      - path: /
        backend:
          serviceName: radarr-service
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
      cpu: 1000m
      memory: 2000Mi
    requests:
      cpu: 1000m
      memory: 2000Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
`````

#### sonarr-helm

````
# Default values for sonarr-app.
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
  port: 8989

ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: sonarr-helm.k8s-11.sa
      paths:
      - path: /
        backend:
          serviceName: radarr-service
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
      cpu: 1000m
      memory: 2000Mi
    requests:
      cpu: 1000m
      memory: 2000Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
`````

##PS. K9S is a perfect manager. Especially for monitoring and search log errors

