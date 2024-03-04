# 14.Kubernetes.Application.Deployment.WS
---

## Jenkins k9s
![Jenkins k9s](https://github.com/Goshaker/DevOpsCourse/blob/master/14.Kubernetes.Application.Deployment.WS/jenkins_pod.png)

## Jenkins UI
![jenkins.k8s-7.sa](https://github.com/Goshaker/DevOpsCourse/blob/master/14.Kubernetes.Application.Deployment.WS/jenkins_ui.png)

## Repo with helm-source/releases for Jenkins
[Github repo](https://github.com/Goshaker/helm-27-24)

## index.yaml
```yaml
apiVersion: v1
entries:
  jenkins-app:
  - apiVersion: v2
    appVersion: 1.16.0
    created: "2024-03-04T16:28:51.828351263Z"
    description: A Helm chart for Kubernetes
    digest: 94ba1ef105821c724e0c71283d44afe3bf34e7434468470d653106706dafb9c9
    name: jenkins-app
    type: application
    urls:
    - https://github.com/Goshaker/helm-27-24.git/helm-jenkins-releases/jenkins-app-0.1.0.tgz
    version: 0.1.0
generated: "2024-03-04T16:28:51.827764769Z"
```

## Chart.yaml
```yaml
apiVersion: v2
name: jenkins-app
description: A Helm chart for Kubernetes
type: application
version: 0.1.0
appVersion: "1.16.0"
```

## values.yaml
```yaml
# Default values for jenkins-app.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1
namespace: jenkins-app
name: jenkins-app

image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: "gakobiakov"


imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Automatically mount a ServiceAccount's API credentials?
  automount: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}
podLabels: {}

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
  type: ClusterIP
  hport: 8080
  jport: 50000

env:
  JAVA_OPTS: "-Djenkins.install.runSetupWizard=false"
  CASC_JENKINS_CONFIG: "/var/jenkins_home/casc_configs/jenkins.yaml"

ingress:
  enabled: true
  name: helm-jenkins-ingress
  inghost: jenkins-app.k8s-7.sa
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
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
    cpu: 3
    memory: 3Gi
  requests:
    cpu: 2
    memory: 2Gi

livenessProbe:
  httpGet:
    path: /
    port: http
readinessProbe:
  httpGet:
    path: /
    port: http

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

# Additional volumes on the output Deployment definition.
configMap:
  basic_name: my-basic-config
  jenkins_name: my-jenkins-config

JenkinsAuthConfig: "/var/jenkins_home/init.groovy.d/basic-security.groovy"
JACsubPath: "basic-security.groovy"
JenkinsConfigYaml: "/var/jenkins_home/casc_configs/jenkins.yaml"
JCYsubPath: "jenkins.yaml"
JenkinsConfig: "/var/jenkins_home"

nfs:
  server: 192.168.37.105
  path: "/mnt/IT-Academy/nfs-data/sa2-27-24/gakobiakov/jenkins"
  readOnly: false
  vers: 3

nodeSelector: {}

tolerations: []

affinity: {}
```

## deployment.yaml
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.namespace }}
--- 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{.Values.name }}
  template:
    metadata:
      labels:
        app: {{.Values.name }}
    spec:
      containers:
        - name: {{ .Values.name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
            - name: JAVA_OPTS
              value: "{{ .Values.env.JAVA_OPTS }}"
            - name: CASC_JENKINS_CONFIG
              value: "{{ .Values.env.CASC_JENKINS_CONFIG }}"
          ports:
            - name: http-port
              containerPort: {{ .Values.service.hport }}
            - name: jnlp-port
              containerPort: {{ .Values.service.jport }}
          securityContext:
            runAsUser: 0
          resources:
            requests:
              cpu: {{ .Values.resources.requests.cpu }}
              memory: {{ .Values.resources.requests.memory }}
            limits:
              cpu: {{ .Values.resources.limits.cpu }}
              memory: {{ .Values.resources.limits.memory }}
          volumeMounts:
            - name: jenkins-auth-config
              mountPath: {{ .Values.JenkinsAuthConfig }} 
              subPath: {{ .Values.JACsubPath }}
            - name: jenkins-config-yaml
              mountPath: {{ .Values.JenkinsConfigYaml }}
              subPath: {{ .Values.JCYsubPath }}
            - name: jenkins-config
              mountPath: {{ .Values.JenkinsConfig }}
      volumes:
        - name: jenkins-auth-config
          configMap:
            name: {{ .Values.configMap.basic_name }} 
        - name: jenkins-config-yaml
          configMap:
            name: {{ .Values.configMap.jenkins_name }}
        - name: jenkins-config
          nfs:
            server: {{ .Values.nfs.server }}
            path: {{ .Values.nfs.path }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.configMap.basic_name }}
  namespace: {{ .Values.namespace }}
data:
  basic-security.groovy: |
    import jenkins.model.*
    import hudson.security.*
    def instance = Jenkins.getInstance()
    println "--> creating local user 'admin'"
    def password = System.getenv("PASS")
    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('admin',"admin")
    instance.setSecurityRealm(hudsonRealm)
    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    strategy.setAllowAnonymousRead(true)
    instance.setAuthorizationStrategy(strategy)
    instance.save()
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.configMap.jenkins_name }}
  namespace: {{ .Values.namespace }}
data:
  jenkins.yaml: |
        jenkins:
          numExecutors: 2
          clouds:
          - kubernetes:
              containerCapStr: "10"
              maxRequestsPerHostStr: "32"
              jenkinsUrl: "http://jenkins-app:8080"
              name: "kubernetes"
              namespace: "{{ .Values.namespace }}"
              skipTlsVerify: true
        credentials:
          system:
            domainCredentials:
            - credentials:
              - usernamePassword:
                  description: "Githubuser"
                  id: "some_randome"
                  password: "XXXXXXXXXXX"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "georgiy.ko@gmail.com"
            url: "http:/jenkins-app.k8s-7.sa/"
          shell:
            shell: "/bin/bash"
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.name }}-binding
  namespace: {{ .Values.namespace }}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: {{ .Values.namespace }}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Values.ingress.name }}
  namespace: jenkins-app
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  ingressClassName: nginx
  rules:
    - host: {{ .Values.ingress.inghost }}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: {{ .Values.name }}
                port:
                  number: {{ .Values.service.hport }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - name: http
      port: {{ .Values.service.hport }}
      targetPort: {{ .Values.service.hport }}
    - name: jnlp
      port: {{ .Values.service.jport }}
      targetPort: {{ .Values.service.jport }}
  selector:
    app: {{ .Values.name }}
```