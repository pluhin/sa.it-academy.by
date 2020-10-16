## Output
```
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: ci-cd/sample-app-09c9d-xxtcg
Created Pod: ci-cd/sample-app-09c9d-vf1tj
[Normal][ci-cd/sample-app-09c9d-vf1tj][Scheduled] Successfully assigned ci-cd/sample-app-09c9d-vf1tj to node1
[Normal][ci-cd/sample-app-09c9d-xxtcg][Scheduled] Successfully assigned ci-cd/sample-app-09c9d-xxtcg to node1
[Normal][ci-cd/sample-app-09c9d-xxtcg][Pulling] Pulling image "tutum/curl"
[Normal][ci-cd/sample-app-09c9d-vf1tj][Pulling] Pulling image "tutum/curl"
Still waiting to schedule task
All nodes of label ‘sample-app’ are offline
[Normal][ci-cd/sample-app-09c9d-xxtcg][Pulled] Successfully pulled image "tutum/curl" in 49.9039952s
[Normal][ci-cd/sample-app-09c9d-xxtcg][Created] Created container curltest
[Normal][ci-cd/sample-app-09c9d-xxtcg][Started] Started container curltest
[Normal][ci-cd/sample-app-09c9d-xxtcg][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-09c9d-vf1tj][Pulled] Successfully pulled image "tutum/curl" in 1m7.380252503s
[Normal][ci-cd/sample-app-09c9d-vf1tj][Created] Created container curltest
[Normal][ci-cd/sample-app-09c9d-vf1tj][Started] Started container curltest
[Normal][ci-cd/sample-app-09c9d-vf1tj][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
Created Pod: ci-cd/sample-app-09c9d-4crzd
Created Pod: ci-cd/sample-app-09c9d-rdc89
[Normal][ci-cd/sample-app-09c9d-4crzd][Scheduled] Successfully assigned ci-cd/sample-app-09c9d-4crzd to node1
[Normal][ci-cd/sample-app-09c9d-rdc89][Scheduled] Successfully assigned ci-cd/sample-app-09c9d-rdc89 to node1
[Normal][ci-cd/sample-app-09c9d-4crzd][Pulled] Container image "tutum/curl" already present on machine
[Normal][ci-cd/sample-app-09c9d-rdc89][Pulled] Container image "tutum/curl" already present on machine
[Normal][ci-cd/sample-app-09c9d-rdc89][Created] Created container curltest
[Normal][ci-cd/sample-app-09c9d-4crzd][Created] Created container curltest
[Normal][ci-cd/sample-app-09c9d-4crzd][Started] Started container curltest
[Normal][ci-cd/sample-app-09c9d-rdc89][Started] Started container curltest
[Normal][ci-cd/sample-app-09c9d-4crzd][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-09c9d-rdc89][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-09c9d-4crzd][Pulled] Successfully pulled image "jenkins/inbound-agent:4.3-4" in 1m7.319934269s
[Normal][ci-cd/sample-app-09c9d-4crzd][Created] Created container jnlp
[Normal][ci-cd/sample-app-09c9d-4crzd][Started] Started container jnlp
Agent sample-app-09c9d-4crzd is provisioned from template sample-app-09c9d
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
  name: "sample-app-09c9d-4crzd"
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
      value: "sample-app-09c9d-4crzd"
    - name: "JENKINS_NAME"
      value: "sample-app-09c9d-4crzd"
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

Running on sample-app-09c9d-4crzd in /home/jenkins/agent/workspace/test
[Pipeline] {
[Pipeline] withEnv
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
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // podTemplate
[Pipeline] End of Pipeline
Finished: SUCCESS
```