# 10.Kubernetes
## config.yaml
## 
```sh
---
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
---
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
data:
  password: cGFzc3dvcmQK
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
        - name: jenkins
          image: jfrog.it-academy.by/public/jenkins-ci:BAA
          imagePullPolicy: IfNotPresent
          env:
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: PASS
              valueFrom:
                secretKeyRef:
                  name: jenkins-secret
                  key: password
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
              cpu: 4000m
              memory: 4000Mi
          volumeMounts:
            - name: docker-sock
              mountPath: /var/run
            - name: jenkins-auth-config
              mountPath: /var/jenkins_home/init.groovy.d/basic-security.groovy
              subPath: basic-security.groovy
            - name: jenkins-config-yaml
              mountPath: /var/jenkins_home/casc_configs/jenkins.yaml
              subPath: jenkins.yaml
            - name: jenkins-config
              mountPath: /var/jenkins_home               
      volumes:
        - name: docker-sock
          hostPath:
            path: /var/run
        - name: jenkins-auth-config
          configMap:
            name: basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: 192.168.37.105
            path: /mnt/IT-Academy/nfs-data/sa2-16-21/Biaspatsau/jenkins_home
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: basic-security
  namespace: ci-cd
data:
  basic-security.groovy: |
        #!groovy        
        import jenkins.model.*
        import hudson.security.*
        def instance = Jenkins.getInstance()
        println "--> creating local user 'admin'"
        password = System.getenv("PASS")
        def hudsonRealm = new HudsonPrivateSecurityRealm(false)
        hudsonRealm.createAccount('admin',"password")
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
  namespace: ci-cd
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
                  password: "password"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "mrpihma@yandex.ru"
            url: "http://jenkins.k8s-3.sa/"
          shell:
            shell: "/bin/bash"
---
apiVersion: v1
kind: Service
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  type: LoadBalancer
  ports:
    - name: master
      port: 8080
      targetPort: 8080
    - name: slave
      port: 50000
      targetPort: 50000
  selector:
    app: jenkins         
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  namespace: ci-cd
  name: ingress-jenkins
spec:
  rules:
  - host: jenkins.k8s-3.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: jenkins
          servicePort: 8080  
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: jenkins
  namespace: ci-cd
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: ci-cd
```
## log
## 
```sh
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: kubernetes ci-cd/sample-app-3v47b-x1c11
[Normal][ci-cd/sample-app-3v47b-x1c11][Scheduled] Successfully assigned ci-cd/sample-app-3v47b-x1c11 to node1
[Normal][ci-cd/sample-app-3v47b-x1c11][Pulling] Pulling image "tutum/curl"
Still waiting to schedule task
‘sample-app-3v47b-x1c11’ is offline
[Normal][ci-cd/sample-app-3v47b-x1c11][Pulled] Successfully pulled image "tutum/curl" in 54.859361377s
[Normal][ci-cd/sample-app-3v47b-x1c11][Created] Created container curltest
[Normal][ci-cd/sample-app-3v47b-x1c11][Started] Started container curltest
[Normal][ci-cd/sample-app-3v47b-x1c11][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
Created Pod: kubernetes ci-cd/sample-app-3v47b-6542p
[Normal][ci-cd/sample-app-3v47b-6542p][Scheduled] Successfully assigned ci-cd/sample-app-3v47b-6542p to node1
[Normal][ci-cd/sample-app-3v47b-6542p][Pulled] Container image "tutum/curl" already present on machine
[Normal][ci-cd/sample-app-3v47b-6542p][Created] Created container curltest
[Normal][ci-cd/sample-app-3v47b-6542p][Started] Started container curltest
[Normal][ci-cd/sample-app-3v47b-6542p][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-3v47b-6542p][Pulled] Successfully pulled image "jenkins/inbound-agent:4.3-4" in 37.749734186s
[Normal][ci-cd/sample-app-3v47b-6542p][Created] Created container jnlp
[Normal][ci-cd/sample-app-3v47b-6542p][Started] Started container jnlp
Agent sample-app-3v47b-6542p is provisioned from template sample-app-3v47b
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/test/1/"
    runUrl: "job/test/1/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "d031a744136cb799e767b42367f130ee149c1df8"
    jenkins/label: "sample-app"
  name: "sample-app-3v47b-6542p"
  namespace: "ci-cd"
spec:
  containers:
  - command:
    - "cat"
    image: "tutum/curl"
    imagePullPolicy: "IfNotPresent"
    name: "curltest"
    tty: true
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  - env:
    - name: "JENKINS_SECRET"
      value: "********"
    - name: "JENKINS_AGENT_NAME"
      value: "sample-app-3v47b-6542p"
    - name: "JENKINS_NAME"
      value: "sample-app-3v47b-6542p"
    - name: "JENKINS_AGENT_WORKDIR"
      value: "/home/jenkins/agent"
    - name: "JENKINS_URL"
      value: "http://jenkins:8080/"
    image: "jenkins/inbound-agent:4.3-4"
    name: "jnlp"
    resources:
      limits: {}
      requests:
        memory: "256Mi"
        cpu: "100m"
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  nodeSelector:
    kubernetes.io/os: "linux"
  restartPolicy: "Always"
  volumes:
  - emptyDir:
      medium: ""
    name: "workspace-volume"

Running on sample-app-3v47b-6542p in /home/jenkins/agent/workspace/test
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] container
[Pipeline] {
[Pipeline] sh
+ curl --version
curl 7.35.0 (x86_64-pc-linux-gnu) libcurl/7.35.0 OpenSSL/1.0.1f zlib/1.2.8 libidn/1.28 librtmp/2.3
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smtp smtps telnet tftp 
Features: AsynchDNS GSS-Negotiate IDN IPv6 Largefile NTLM NTLM_WB SSL libz TLS-SRP 
[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // podTemplate
[Pipeline] End of Pipeline
Finished: SUCCESS
```

