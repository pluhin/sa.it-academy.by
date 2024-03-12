# 14. Kubernetes application deployment

## Homework Assignment 1. Transform Jenkins deployment to Helm

### commands:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm create jenkins
helm package jenkins
helm install my-jenkins2 jenkins-0.1.0.tgz --set namespace=my-jenkins-2,name=my-jenkins-2,ingress.inghost=jenkins-2.k8s-13.sa
helm repo index jenkins #generete index.yaml 
```

### deploment.yaml 

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.namespace }} 
---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.namespace }}
  namespace: {{ .Values.namespace }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app:  {{.Values.name }}
  template:
    metadata:
      labels:
        app:  {{.Values.name }}
    spec:
      containers:
        - name:  {{.Values.name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
            # - name: PASS
              #valueFrom:
              #  secretKeyRef:
              #    name: jenkins-secret
              #    key: password
            - name: JAVA_OPTS
              value: {{ .Values.env.value1 }}
            - name: {{ .Values.env.name }}
              value: {{ .Values.env.value2 }}
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
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.name }}-rolebing
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
apiVersion: v1
kind: ConfigMap
metadata:
  name:  {{ .Values.configMap.basic_name }}
  namespace: {{ .Values.namespace }}
data:
  basic-security.groovy: |
    #!groovy
    import jenkins.model.*
    import hudson.security.*
    def instance = Jenkins.getInstance()
    println "--> creating local user 'admin'"
    def password = System.getenv("PASS")
    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('admin', password)
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
              jenkinsUrl: "http://jenkins:8080"
              name: "kubernetes"
              namespace: "ci-cd"
              skipTlsVerify: true
        credentials:
          system:
            domainCredentials:
            - credentials:
              - usernamePassword:
                  description: "Githubuser"
                  id: "some_randome"
                  password: "admin123"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "belogolovayanv@gmail.com"
            url: "http://jenkins.k8s-13.sa/"
          shell:
            shell: "/bin/bash"

```

### ingress.yaml

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Values.ingress.className }}
  namespace: {{ .Values.namespace }}
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

```

### service.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - name: master
      port: {{ .Values.service.hport }}
      targetPort: {{ .Values.service.hport }}
    - name: slave
      port: {{ .Values.service.jport }}
      targetPort: {{ .Values.service.jport }}
  selector:
    app: {{ .Values.name }}
```

### Chart.yaml

```yaml
apiVersion: v2
name: jenkins
description: A Helm chart for Kubernetes
type: application
version: 0.1.0
appVersion: "1.16.0"
```

### values.yaml

```yaml
replicaCount: 1
namespace: my-jenkins
name: my-jenkins

image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  tag: "nmyslivets"
  
imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  automount: true
  annotations: {}
  name: ""

podAnnotations: {}
podLabels: {}
podSecurityContext: {}
securityContext: {}
 
service:
  type: ClusterIP
  hport: 8080
  jport: 50000

ingress:
  enabled: false
  className: "ingress-jenkins"
  inghost: jenkins.k8s-13.sa
  tls: []
  
env:
  value1: "-Djenkins.install.runSetupWizard=false"
  name: CASC_JENKINS_CONFIG
  value2: /var/jenkins_home/casc_configs/jenkins.yaml 

resources: 
  requests:
    cpu: 2
    memory: 2Gi
  limits:
    cpu: 3
    memory: 3Gi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

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
  path: "/mnt/IT-Academy/nfs-data/sa2-27-24/nmyslivets/jenkins"  
  readOnly: false
  vers: 3

nodeSelector: {}

tolerations: []

affinity: {}
```

[GitHub link](https://github.com/NataliaBelogolovaya/helm-charts.git)

[GitHub Helm Page](https://nataliabelogolovaya.github.io/helm-charts/jenkins/)

![pods](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/14.Kubernetes%20application%20deployment/jenkins.png)

![web](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/14.Kubernetes%20application%20deployment/jenkins-web.png)