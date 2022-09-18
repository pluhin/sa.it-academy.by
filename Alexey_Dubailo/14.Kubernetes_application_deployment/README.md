# 14.K8s application deployment

## ArgoCD screenshot
![argocd](./argocd.png)

## Jenkins screenshot
![jenkins](./jenkins.png)

## Template values
```
# Default values for jenkins_tmp.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

metadata:
  name: jenkins
  namespace: ci-cd

image:
  name: jenkins
  repository: jfrog.it-academy.by/public/jenkins-ci:adubailo
  pullpolicy: IfNotPresent

nfs:
  server: 192.168.37.105
  path: /mnt/IT-Academy/nfs-data/sa2-21-22/adubailo/jenkins

service:
  type: ClusterIP
  masterport: 8080
  mastertargetport: 8080
  slaveport: 5000
  slavetargetport: 5000

ingress:
  host: jenkins.k8s-7.sa
  alias: "jenkins.k8s-8.sa"

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80
```

## Template deployment/service/ingress.yaml
```
####Deployment.yaml
--
apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.metadata.namespace }}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.metadata.name }}
  namespace: {{ .Values.metadata.namespace }}
spec:
  replicas: {{ .Values.replicaCount  }}
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
        - name: {{ .Values.image.name }}
          image: {{ .Values.image.repository }}
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: /var/jenkins_home/casc_configs/jenkins.yaml
          ports:
            - name: http-port
              containerPort: 8080
            - name: jnlp-port
              containerPort: 50000
          securityContext:
             runAsUser: 0
          resources:
            requests:
              cpu: 2000m
              memory: 2000Mi
            limits:
              cpu: 2000m
              memory: 3000Mi
          volumeMounts:
            - name: jenkins-auth-config
              mountPath: /var/jenkins_home/init.groovy.d/basic-security.groovy
              subPath: basic-security.groovy
            - name: jenkins-config-yaml
              mountPath: /var/jenkins_home/casc_configs/jenkins.yaml
              subPath: jenkins.yaml
            - name: jenkins-config
              mountPath: /var/jenkins_home
      volumes:
        - name: jenkins-auth-config
          configMap:
            name: basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: {{ .Values.nfs.server }}
            path: {{ .Values.nfs.path }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: basic-security
  namespace: {{ .Values.metadata.namespace }}
data:
  basic-security.groovy: |
    #!groovy
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
  name: jenkins-config
  namespace: {{ .Values.metadata.namespace }}
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
                  password: "XXXXXXXXXXX"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "pluhin@gmail.com"
            url: "http://jenkins.k8s-7.sa/"
          shell:
            shell: "/bin/bash"
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.metadata.name }}
  namespace: {{ .Values.metadata.namespace }}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: {{ .Values.metadata.namespace }}

### service.yaml
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.metadata.name }}
  namespace: {{ .Values.metadata.namespace }}
spec:
  ports:
    - name: master
      port: {{ .Values.service.masterport }}
      targetPort: {{ .Values.service.mastertargetport }}
    - name: slave
      port: {{ .Values.service.slaveport }}
      targetPort: {{ .Values.service.slavetargetport }}
  selector:
    app: jenkins

### ingress.yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-jenkins
  namespace: {{ .Values.metadata.namespace }}
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: {{ .Values.ingress.alias }}
spec:
  rules:
    - host: {{ .Values.ingress.host }}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: jenkins
                port:
                  number: 8080
```

