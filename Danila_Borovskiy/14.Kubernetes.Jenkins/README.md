## 14.Kubernetes.Jenkins

---

### Create new Jenkins Helm App

```bash
helm create jenkins-helm
```

### Configure Templates

```yaml
# namespace.yaml

apiVersion: v1
kind: Namespace
metadata:
  name: "{{ .Values.namespace }}"
```

```yaml
# jenkins-secret.yaml

apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: {{ .Values.namespace }}
type: Opaque
data:
  password: {{ .Values.password }}
```

```yaml
# deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.appName }}
  namespace: {{ .Values.namespace }}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: {{ .Values.appName }}
  serviceName: {{ .Values.appName }}
  template:
    metadata:
      labels:
        app: {{ .Values.appName }}
    spec:
      containers:
        - name: {{ .Values.appName }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
            - name: PASS
              valueFrom:
                secretKeyRef:
                  name: jenkins-secret
                  key: password
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: /var/jenkins_home/casc_configs/jenkins.yaml
          ports:
            - name: http-port
              containerPort: {{ .Values.service.httpPort }}
            - name: jnlp-port
              containerPort: {{ .Values.service.jnlpPort }}
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
```

```yaml
# config.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: basic-security
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
              password: "QwertY_13"
              scope: GLOBAL
              username: "git_hub_user"
    unclassified:
      location:
        adminAddress: "pluhin@gmail.com"
        url: "http://{{ .Values.ingress.host }}/"
      shell:
        shell: "/bin/bash"
```

```yaml
# clusterrolebinding.yaml

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ .Values.appName  }}
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

```yaml
# ingress.yaml

{{- if .Values.ingress.enabled }}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Values.appName }}
  namespace: {{ .Values.namespace }}
spec:
  ingressClassName: {{ .Values.ingress.className }}
  rules:
    - host: {{ .Values.ingress.host }}
      http:
        paths:
          - path: {{ .Values.ingress.path }}
            pathType: Prefix
            backend:
              service:
                name: {{ .Values.appName }}
                port:
                  number: {{ .Values.service.httpPort }}
{{- end }}
```

```yaml
# service.yaml

apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.appName  }}
  namespace: {{ .Values.namespace }}
spec:
  ports:
    - name: master
      port: {{ .Values.service.httpPort }}
      targetPort: {{ .Values.service.httpPort }}
    - name: slave
      port: {{ .Values.service.jnlpPort }}
      targetPort: {{ .Values.service.jnlpPort }}
  selector:
    app: {{ .Values.appName }}
```

### Configure Helm Values

```yaml
# values.yaml

replicaCount: 1

appName: jenkins-helm
namespace: jenkins-helm

password: 4oCcUXdlcnRZXzEz4oCd

image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  tag: spishchyk_02

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

nfs:
  server: 192.168.37.105
  path: /mnt/IT-Academy/nfs-data/sa2-27-24/d_borovskiy/jenkins-helm

podSecurityContext: {}

securityContext: {}

service:
  type: ClusterIP
  httpPort: 8080
  jnlpPort: 50000


ingress:
  enabled: true
  className: "nginx"
  host: "jenkins-helm.k8s-3.sa"
  path: "/"

tls: []

resources:
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

volumes: []
# - name: foo
#   secret:
#     secretName: mysecret
#     optional: false

# Additional volumeMounts on the output Deployment definition.
volumeMounts: []
# - name: foo
#   mountPath: "/etc/foo"
#   readOnly: true

nodeSelector: {}

tolerations: []

affinity: {}
```

### Helm App Installation and Versioning

```bash
helm package jenkins-helm
mv jenkins-helm-0.1.0.tgz ./releases
mv jenkins-helm ./sources
```

```bash
git init
git add .
git status
git commit -m 'initial commit'
git branch -M main
git remote add origin https://github.com/dborovskiy00/k8s-helm-jenkins.git
git push -u origin main
```

```bash
helm repo index --url "https://dborovskiy00.github.io/k8s-helm-jenkins/" .
```

```yaml
# index.yaml

apiVersion: v1
entries:
  jenkins-helm:
    - apiVersion: v2
      appVersion: 1.16.0
      created: "2024-03-14T11:15:23.858497653Z"
      description: A Helm chart for Jenkins
      digest: 729e3b2a66115763ba8b06e654bc7c50d6473b59410554a0ccd454d17f90d5f3
      name: jenkins-helm
      type: application
      urls:
        - https://dborovskiy00.github.io/k8s-helm-jenkins/releases/jenkins-helm-0.1.0.tgz
      version: 0.1.0
generated: "2024-03-14T11:15:23.857607796Z"
```

```bash
git add .
git status
git commit -m '0.1.0'
git push origin main
```

```bash
helm repo add k8s-jenkins-helm https://dborovskiy00.github.io/k8s-helm-jenkins/
helm install jenkins-helm k8s-jenkins-helm/jenkins-helm -n default
```
