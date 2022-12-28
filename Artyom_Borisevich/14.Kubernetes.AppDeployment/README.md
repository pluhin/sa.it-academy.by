# 14.Kubernetes.Application.Deployment

## Create helm package for your Jenkins application

* all variables should be inside variable file
* publish helm on your repository 

### Helm manifest

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
            - name: http
              containerPort: {{ .Values.service.port }}
            - name: jnlp
              containerPort: {{ .Values.service.jnlpport }}
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
              mountPath: {{ .Values.jenkinsAuthConfig }}
              subPath: {{ .Values.ACsubPath }}
            - name: jenkins-config-yaml
              mountPath: {{ .Values.jenkinsConfigYaml }}
              subPath: {{ .Values.JCsubPath }}
            - name: jenkins-config
              mountPath: {{ .Values.jenkinsConfig }}
      volumes:
        - name: jenkins-auth-config
          configMap:
            name: {{ .Values.configMap.name_basic }}
        - name: jenkins-config-yaml
          configMap:
            name: {{ .Values.configMap.name_config }}
        - name: jenkins-config
          nfs:
            server: {{ .Values.nfs.server }}
            path: {{ .Values.nfs.path }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.configMap.name_basic }}
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
  name: {{ .Values.configMap.name_config }}
  namespace: {{ .Values.namespace }}
data:
  jenkins.yaml: |
    jenkins:
      numExecutors: 2
      clouds:
      - kubernetes:
          containerCapStr: "10"
          maxRequestsPerHostStr: "32"
          jenkinsUrl: "http://jenkins:{{ .Values.service.port }}"
          name: "kubernetes"
          namespace: {{ .Values.namespace }}
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
        adminAddress: {{ .Values.location.adminAddress }}
        url: {{ .Values.location.url }}
      shell:
        shell: "/bin/bash"
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
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-{{ .Values.name }}
  namespace: {{ .Values.namespace }}
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: {{ .Values.ingress.hosts.host }}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: {{ .Values.name }}
                port:
                  number: {{ .Values.service.port }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  ports:
    - name: master
      port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.port }}
    - name: slave
      port: {{ .Values.service.jnlpport }}
      targetPort: {{ .Values.service.jnlpport }}
  selector:
    app: {{ .Values.name }}
```

### Helm variables

```yaml
replicaCount: 1
namespace: ci-cd
name: jenkins

image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: "aborisevich"

service:
  port: 8080
  jnlpport: 50000

jenkinsAuthConfig: /var/jenkins_home/init.groovy.d/basic-security.groovy
ACsubPath: basic-security.groovy
jenkinsConfigYaml: /var/jenkins_home/casc_configs/jenkins.yaml
JCsubPath: jenkins.yaml
jenkinsConfig: /var/jenkins_home
configMap:
  name_basic: basic-security
  name_config: jenkins-config
nfs:
  server: 192.168.37.105
  path: /mnt/IT-Academy/nfs-data/sa2-22-22/aborisevich/jenkins

location:
  adminAddress: "pluhin@gmail.com"
  url: "http://jenkins.k8s-3.sa/"

ingress:
  enabled: true
  className: ""
  hosts:
    host: jenkins.k8s-3.sa

resources:
  requests:
    cpu: 2000m
    memory: 2000Mi
  limits:
    cpu: 2000m
    memory: 3000Mi

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

### Printscreen of successful work. Jenkins

![Jenkins](Jenkins.png)

### Publish helm on your repository

[HelmRepo](https://github.com/artsiomborisevich/helm-borisevich)

#### Helm history

```bash
 1953  helm package jenkins-app/
 1955  mv jenkins-helm-0.2.0.tgz ../13.K8s.Helm/helm-releases/
 1975  helm package jenkins-app
 1976  mv jenkins-helm-0.2.0.tgz ../13.K8s.Helm/helm-releases/
 2005  helm package jenkins-app
 2006  helm install jenkins-helm jenkins-helm-0.2.0.tgz
 2008  rm jenkins-helm-0.2.0.tgz
 2029  helm package jenkins-app
 2030  helm install jenkins-helm jenkins-helm-0.2.0.tgz --dry-run --debug
 2032  rm jenkins-helm-0.2.0.tgz
 2043  helm package jenkins-app
 2044  helm install jenkins-helm jenkins-helm-0.2.0.tgz --dry-run --debug
 2060  rm jenkins-helm-0.2.0.tgz
 2062  helm package jenkins-app
 2063  helm install jenkins-helm jenkins-helm-0.2.0.tgz --dry-run --debug
 2075  rm jenkins-helm-0.2.0.tgz
 2077  helm package jenkins-app
 2078  helm install jenkins-helm jenkins-helm-0.2.0.tgz --dry-run --debug
 2080  helm install jenkins-helm jenkins-helm-0.2.0.tgz
 2081  helm install jenkins-helm jenkins-helm-0.2.0.tgz --dry-run --debug
 2082  helm install jenkins-helm jenkins-helm-0.2.0.tgz
 2084  mv jenkins-helm-0.2.0.tgz ../13.K8s.Helm/helm-releases/
 2102  helm package jenkins-app
 2103  helm install jenkins-helm jenkins-helm-0.2.0.tgz
 2105  helm install jenkins-app jenkins-app-0.2.0.tgz
 2106  helm install jenkins-app jenkins-app-0.2.0.tgz --dry-run --debug
 2113  helm package jenkins-app
 2114  helm install jenkins-app jenkins-app-0.2.0.tgz
 2115  helm uninstall jenkins-app
 2116  helm install jenkins-app jenkins-app-0.2.0.tgz
 2118  mv jenkins-app-0.2.0.tgz ../13.K8s.Helm/helm-releases/
 2129  helm uninstall jenkins-app
 2130  helm package jenkins-app
 2133  helm install jenkins-app jenkins-app-0.2.0.tgz
 2134  helm install jenkins-app jenkins-app-0.2.0.tgz --dry-run --debug
 2145  helm uninstall jenkins-app
 2146  helm package jenkins-app
 2147  helm install jenkins-app jenkins-app-0.2.0.tgz
 2150  helm uninstall jenkins-app
 2152  helm package jenkins-app
 2153  helm install jenkins-app jenkins-app-0.2.0.tgz
 2155  mv jenkins-app-0.2.0.tgz  ../13.K8s.Helm/helm-releases/
 2156  helm repo index --url https://artsiomborisevich.github.io/helm-borisevich/ --merge index.yaml .
```




