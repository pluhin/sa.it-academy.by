# 10.Kubernetes_application_deployment

### jenkins.yaml

```
---
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
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
          image: pluhin31/jenkins_ci
          imagePullPolicy: Always
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
---
apiVersion: v1
kind: Service
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  type: NodePort
  ports:
    - name: master
      port: 8080
      targetPort: 8080
      nodePort: 31456
    - name: slave
      port: 50000
      targetPort: 50000
      nodePort: 31457
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
  - host: jenkins.k8s-13.sa
    http:
      paths:
      - path: /
        backend:
          serviceName: jenkins
          servicePort: 8080
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
        hudsonRealm.createAccount('admin',PASS)
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
          numExecutors: 4
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
            adminAddress: "pluhin@gmail.com"
            url: "http://jenkins.k8s-13.sa/"
          shell:
            shell: "/bin/bash"
---
```

### output 

```
Started by user unknown or anonymous
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: ci-cd/sample-app-7q6gx-5h4jv
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Scheduled] Successfully assigned ci-cd/sample-app-7q6gx-5h4jv to node1
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Pulled] Container image "tutum/curl" already present on machine
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Created] Created container curltest
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Started] Started container curltest
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Pulled] Container image "jenkins/inbound-agent:4.3-4" already present on machine
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Created] Created container jnlp
[Normal][ci-cd/sample-app-7q6gx-5h4jv][Started] Started container jnlp
Agent sample-app-7q6gx-5h4jv is provisioned from template sample-app-7q6gx
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/test_01/1/"
    runUrl: "job/test_01/1/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "d031a744136cb799e767b42367f130ee149c1df8"
    jenkins/label: "sample-app"
  name: "sample-app-7q6gx-5h4jv"
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
      value: "sample-app-7q6gx-5h4jv"
    - name: "JENKINS_NAME"
      value: "sample-app-7q6gx-5h4jv"
    - name: "JENKINS_AGENT_WORKDIR"
      value: "/home/jenkins/agent"
    - name: "JENKINS_URL"
      value: "http://jenkins:8080/"
    image: "jenkins/inbound-agent:4.3-4"
    name: "jnlp"
    resources:
      requests:
        cpu: "100m"
        memory: "256Mi"
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

Running on sample-app-7q6gx-5h4jv in /home/jenkins/agent/workspace/test_01
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
[Checks API] No suitable checks publisher found.
Finished: SUCCESS
```
