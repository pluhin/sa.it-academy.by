## Jenkins-Helm

![image](https://user-images.githubusercontent.com/110092772/187925462-f1b07c36-fbd8-4ea4-83a6-5c442ce47dc1.png)

## App in Argocd for Jenkins-Helm

![image](https://user-images.githubusercontent.com/110092772/187925776-09613a16-e914-45f8-a7db-e22a6ad35898.png)

## Deployment

```bash

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
  replicas: 1
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
          image: {{ .Values.image }}
          imagePullPolicy: IfNotPresent
          env:
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: {{ .Values.jenkins_yaml_path }}
          ports:
            - name: http-port
              containerPort: 8080
            - name: jnlp-port
              containerPort: 50000
          securityContext:
            runAsUser: 0
          resources:
            requests:
              cpu: {{ .Values.requests_cpu }}
              memory: {{ .Values.requests_memory }}
            limits:
              cpu: {{ .Values.limits_cpu }}
              memory: {{ .Values.limits_memory }}
          volumeMounts:
            - name: jenkins-auth-config
              mountPath: {{ .Values.basic_security_path }}
              subPath: basic-security.groovy
            - name: jenkins-config-yaml
              mountPath: {{ .Values.jenkins_yaml_path }}
              subPath: jenkins.yaml
            - name: jenkins-config
              mountPath: {{ .Values.jenkins_config_path }}
      volumes:
        - name: jenkins-auth-config
          configMap:
            name: {{ .Values.name }}-basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: {{ .Values.nfs_server }}
            path: {{ .Values.nfs_path }}
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
                  password: "XXXXXXXXXXX"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "{{ .Values.admin_address }}"
            url: "{{ .Values.main_host_url }}"
          shell:
            shell: "/bin/bash"
            
```

## Ingress

```bash

---
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
    - host: {{ .Values.web_host }}
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

## Service

```bash

---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
  namespace: {{ .Values.namespace }}
spec:
  ports:
    - name: master
      port: {{ .Values.master_port }}
      targetPort: {{ .Values.master_targetport }}
    - name: slave
      port: {{ .Values.slave_port }}
      targetPort: {{ .Values.slave_targetport }}
  selector:
    app: {{ .Values.name }} 

```

## Serviceaccount

```bash

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

## Values

```bash

namespace: jenkins
name: jenkins-helm
image: jfrog.it-academy.by/public/jenkins-ci:knichiporov


nfs_path: /mnt/IT-Academy/nfs-data/sa2-21-22/Nichiporov/jenkins
nfs_server: 192.168.37.105

basic_security_path: /var/jenkins_home/init.groovy.d/basic-security.groovy
jenkins_yaml_path: /var/jenkins_home/casc_configs/jenkins.yaml
jenkins_config_path: /var/jenkins_home
admin_address: kirill.nichiporov.01@mail.ru


ingress:
  enabled: enabled
server_alias: "jenkins-helm.k8s-22.sa"
web_host: jenkins-helm.k8s-21.sa
ingress_port: 8080


main_host_url: http://jenkins-helm.k8s-21.sa/

resources:
requests_cpu: 2000m
requests_memory: 2000Mi
limits_cpu: 2000m
limits_memory: 3000Mi


master_port: 8080
master_targetport: 8080
slave_port: 50000
slave_targetport: 50000 

```
