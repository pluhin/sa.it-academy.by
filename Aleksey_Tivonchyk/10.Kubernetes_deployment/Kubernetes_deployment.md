# Jenkins log
```bash
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: ci-cd/sample-app-1l17p-66pc5
[Normal][ci-cd/sample-app-1l17p-66pc5][Scheduled] Successfully assigned ci-cd/sample-app-1l17p-66pc5 to node2
[Normal][ci-cd/sample-app-1l17p-66pc5][Pulling] Pulling image "tutum/curl"
Still waiting to schedule task
‘sample-app-1l17p-66pc5’ is offline
[Normal][ci-cd/sample-app-1l17p-66pc5][Pulled] Successfully pulled image "tutum/curl" in 55.629661204s
[Normal][ci-cd/sample-app-1l17p-66pc5][Created] Created container curltest
[Normal][ci-cd/sample-app-1l17p-66pc5][Started] Started container curltest
[Normal][ci-cd/sample-app-1l17p-66pc5][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
Created Pod: ci-cd/sample-app-1l17p-1l9xr
[Normal][ci-cd/sample-app-1l17p-1l9xr][Scheduled] Successfully assigned ci-cd/sample-app-1l17p-1l9xr to node2
[Normal][ci-cd/sample-app-1l17p-1l9xr][Pulled] Container image "tutum/curl" already present on machine
[Normal][ci-cd/sample-app-1l17p-1l9xr][Created] Created container curltest
[Normal][ci-cd/sample-app-1l17p-1l9xr][Started] Started container curltest
[Normal][ci-cd/sample-app-1l17p-1l9xr][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-1l17p-1l9xr][Pulled] Successfully pulled image "jenkins/inbound-agent:4.3-4" in 39.354184717s
[Normal][ci-cd/sample-app-1l17p-1l9xr][Created] Created container jnlp
[Normal][ci-cd/sample-app-1l17p-1l9xr][Started] Started container jnlp
Agent sample-app-1l17p-1l9xr is provisioned from template sample-app-1l17p
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/Test/1/"
    runUrl: "job/Test/1/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "d031a744136cb799e767b42367f130ee149c1df8"
    jenkins/label: "sample-app"
  name: "sample-app-1l17p-1l9xr"
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
      value: "sample-app-1l17p-1l9xr"
    - name: "JENKINS_NAME"
      value: "sample-app-1l17p-1l9xr"
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

Running on sample-app-1l17p-1l9xr in /home/jenkins/agent/workspace/Test
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
[Checks API] No suitable checks publisher found.
Finished: SUCCESS