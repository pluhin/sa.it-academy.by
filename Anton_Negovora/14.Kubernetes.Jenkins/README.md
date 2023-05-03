# 14.Kubernetes.Jenkins

 [Helm repository link](https://github.com/Anton50013/helm-repo "Helm repository link")

## Jenkins

![pods](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/14.Kubernetes.Jenkins/jenkins.png)

## deployment.yaml

```yaml
---
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
      app: {{ .Values.name }}
  template:
    metadata:
      labels:
        app: {{ .Values.name }}
    spec:
      containers:
        - name: {{ .Values.name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
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
          {{- toYaml .Values.resources | nindent 12 }}
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
            name: {{ .Values.name }}-basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: {{ .Values.ip_server }}
            path: {{ .Values.nfs_mount }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.name }}-basic-security
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
              namespace: "{{ .Values.namespace }}"
              skipTlsVerify: true
        credentials:
          system:
            domainCredentials:
            - credentials:
              - usernamePassword:
                  description: "Githubuser"
                  id: "some_randome"
                  password: "{{ .Values.pswd }}"
                  scope: GLOBAL
                  username: "{{ .Values.uname }}"
        unclassified:
          location:
            adminAddress: "anton50013@gmail.com"
            url: "http://jenkins.k8s-14.sa/"
          shell:
            shell: "/bin/bash"
```

## ingress.yaml

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: {{ .Values.server_alias }}
spec:
  rules:
    - host: {{ .Values.host_ingress }}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: {{ .Values.name }}
                port:
                  number: {{ .Values.ingress_port }}
```

## service.yaml

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  ports:
    - name: master
      port: {{ .Values.master_p }}
      targetPort: {{ .Values.master_t }}
    - name: slave
      port: {{ .Values.slave_p }}
      targetPort: {{ .Values.slave_t }}
  selector:
    app: {{ .Values.name }}
```

## serviceaccount.yaml

```yaml
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: {{ .Values.namespace }}
```

## service.yaml

```yaml
replicaCount: 1
namespace: ci-cd
name: jenkins
image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  tag: "anegovora"

service:
  htport: 8080
  jnlport: 50000


JenkinsAuthConfig: /var/jenkins_home/init.groovy.d/basic-security.groovy
JACsubPath: basic-security.groovy
JenkinsConfigYaml: /var/jenkins_home/casc_configs/jenkins.yaml
JCYsubPath: jenkins.yaml
JenkinsConfig: /var/jenkins_home
configMap:
   basic_name: basic-security
   jenkins_name: jenkins-config
nfs:
   server: 192.168.37.105
   path: /mnt/IT-Academy/nfs-data/sa2-23-23/Anton_Negovora/jenkins

ingress:
  name: ingress-jenkins
  enabled: true
  className: ""
  hosts:
    host: jenkins.k8s-14.sa

resources: 
   limits:
     cpu: 2000m
     memory: 2000Mi
   requests:
     cpu: 2000m
     memory: 2000Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```