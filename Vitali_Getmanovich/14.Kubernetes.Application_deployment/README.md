# 14. Kubernetes application deployment
## Create a new Helm chart
```bash
helm create jenkins
```
## Modify the file values.yaml
```yaml
replicaCount: 1

image:
  repository: jfrog.it-academy.by/public/jenkins-ci
  pullPolicy: IfNotPresent
  tag: "vgetmanovich"


service:
  type: ClusterIP
  port:
    http: 8080
    jnlp: 50000

ingress:
  enabled: true
  className: ""
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: helm-jenkins.k8s-4.sa
      paths:
        - path: /
          pathType: ImplementationSpecific

resources:
  limits:
    cpu: 3
    memory: 3Gi
  requests:
    cpu: 2
    memory: 2Gi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80


namespace: ci-cd

nfs:
  server: 192.168.37.105
  path: /mnt/IT-Academy/nfs-data/sa2-23-23/vgetmanovich/jenkins
```
---

## ## Modify the file deployment.yaml
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
  name: {{ include "jenkins.fullname" . }}
  namespace: {{ .Values.namespace }}
  labels:
    {{- include "jenkins.labels" . | nindent 4 }}
spec:
  {{- if not .Values.autoscaling.enabled }}
  replicas: {{ .Values.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "jenkins.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
        {{- include "jenkins.selectorLabels" . | nindent 8 }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            runAsUser: 0
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: /var/jenkins_home/casc_configs/jenkins.yaml
          ports:
            - name: http
              containerPort: {{ .Values.service.port.http }}
            - name: jnlp
              containerPort: {{ .Values.service.port.jnlp }}
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
            name: basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: {{ .Values.nfs.server }}
            path: {{ .Values.nfs.path }}


      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}

---
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
            adminAddress: "getmanovich1987@gmail.com"
            url: "http://jenkins.k8s-4.sa/"
          shell:
            shell: "/bin/bash"

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{ include "jenkins.fullname" . }}
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
---
## Modify the file service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "jenkins.fullname" . }}
  namespace: {{ .Values.namespace }}
  labels:
    {{- include "jenkins.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port.http }}
      targetPort: {{ .Values.service.port.http }}
      name: http
    - port: {{ .Values.service.port.jnlp }}
      targetPort: {{ .Values.service.port.jnlp }}
      name: jnlp
  selector:
    {{- include "jenkins.selectorLabels" . | nindent 4 }}
```
---
## Modify the file ingress.yaml
```yaml
{{- if .Values.ingress.enabled -}}
{{- $fullName := include "jenkins.fullname" . -}}
{{- $svcPort := .Values.service.port -}}
{{- if and .Values.ingress.className (not (semverCompare ">=1.18-0" .Capabilities.KubeVersion.GitVersion)) }}
  {{- if not (hasKey .Values.ingress.annotations "kubernetes.io/ingress.class") }}
  {{- $_ := set .Values.ingress.annotations "kubernetes.io/ingress.class" .Values.ingress.className}}
  {{- end }}
{{- end }}
{{- if semverCompare ">=1.19-0" .Capabilities.KubeVersion.GitVersion -}}
apiVersion: networking.k8s.io/v1
{{- else if semverCompare ">=1.14-0" .Capabilities.KubeVersion.GitVersion -}}
apiVersion: networking.k8s.io/v1beta1
{{- else -}}
apiVersion: extensions/v1beta1
{{- end }}
kind: Ingress
metadata:
  name: {{ $fullName }}
  namespace: {{ .Values.namespace }}
  labels:
    {{- include "jenkins.labels" . | nindent 4 }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if and .Values.ingress.className (semverCompare ">=1.18-0" .Capabilities.KubeVersion.GitVersion) }}
  ingressClassName: {{ .Values.ingress.className }}
  {{- end }}
  {{- if .Values.ingress.tls }}
  tls:
    {{- range .Values.ingress.tls }}
    - hosts:
        {{- range .hosts }}
        - {{ . | quote }}
        {{- end }}
      secretName: {{ .secretName }}
    {{- end }}
  {{- end }}
  rules:
    {{- range .Values.ingress.hosts }}
    - host: {{ .host | quote }}
      http:
        paths:
          {{- range .paths }}
          - path: {{ .path }}
            {{- if and .pathType (semverCompare ">=1.18-0" $.Capabilities.KubeVersion.GitVersion) }}
            pathType: {{ .pathType }}
            {{- end }}
            backend:
              {{- if semverCompare ">=1.19-0" $.Capabilities.KubeVersion.GitVersion }}
              service:
                name: {{ $fullName }}
                port:
                  number: 8080
              {{- else }}
              serviceName: {{ $fullName }}
              servicePort: 8080
              {{- end }}
          {{- end }}
    {{- end }}
{{- end }}
```
---
## Create a package
```bash
helm package jenkins
```
## Create Helm repo and publish chart

### Create new repo GitHub helm-course-23-23
```bash
 2030  git init
 2035  git commit -m "first commit"
 2042  git remote add origin https://github.com/VitaliGet/helm-course-23-23.git
 2043  git remote
 2044  git status
 2046  git push -u origin master
 2047  helm repo index --url https://vitaliget.github.io/helm-course-23-23/ .
 2048  ls -la
 2049  vim index.yaml
 2050  git add --all
 2051  git commit -m "Add jenkins v1"
 2052  git push
 2056  helm repo add helm-course https://vitaliget.github.io/helm-course-23-23/
 2057  helm search repo helm-course -l
```

```bash
$ helm search repo helm-course -l
NAME                    CHART VERSION   APP VERSION     DESCRIPTION
helm-course/jenkins     0.1.0           1.16.0          A Helm chart for Kubernetes
```

## Create a new deploy from the repo
```bash
$ helm install helm-jenkins helm-course/jenkins
NAME: helm-jenkins
LAST DEPLOYED: Wed Apr 12 11:57:30 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  http://helm-jenkins.k8s-4.sa/

```
## Add an entry to the file hosts
```bash
178.124.206.53 helm-jenkins.k8s-4.sa
```

![browser-jenkins](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/14.Kubernetes.Application_deployment/jenkins.png)

[Link GitHub repo](https://github.com/VitaliGet/helm-course-23-23.git)
