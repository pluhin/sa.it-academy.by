# Output of testing

```bash
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Still waiting to schedule task
‘Jenkins’ doesn’t have label ‘sample-app’
Created Pod: kubernetes ci-cd/sample-app-flhvw-clptw
[Normal][ci-cd/sample-app-flhvw-clptw][Scheduled] Successfully assigned ci-cd/sample-app-flhvw-clptw to node1
[Normal][ci-cd/sample-app-flhvw-clptw][Pulling] Pulling image "jfrog.it-academy.by/public/curl:spishchyk"
[Normal][ci-cd/sample-app-flhvw-clptw][Pulled] Successfully pulled image "jfrog.it-academy.by/public/curl:spishchyk" in 45.880600849s
[Normal][ci-cd/sample-app-flhvw-clptw][Created] Created container curltest
[Normal][ci-cd/sample-app-flhvw-clptw][Started] Started container curltest
[Normal][ci-cd/sample-app-flhvw-clptw][Pulling] Pulling image "jenkins/inbound-agent:4.3-4"
[Normal][ci-cd/sample-app-flhvw-clptw][Pulled] Successfully pulled image "jenkins/inbound-agent:4.3-4" in 1m22.848083822s
[Normal][ci-cd/sample-app-flhvw-clptw][Created] Created container jnlp
[Normal][ci-cd/sample-app-flhvw-clptw][Started] Started container jnlp
Agent sample-app-flhvw-clptw is provisioned from template sample-app-flhvw
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/Test/1/"
    runUrl: "job/Test/1/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "e63233bec581b1d9effa6b6d4f0bca0985a05b55"
    jenkins/label: "sample-app"
  name: "sample-app-flhvw-clptw"
  namespace: "ci-cd"
spec:
  containers:
  - command:
    - "cat"
    image: "jfrog.it-academy.by/public/curl:spishchyk"
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
      value: "sample-app-flhvw-clptw"
    - name: "JENKINS_NAME"
      value: "sample-app-flhvw-clptw"
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

Running on sample-app-flhvw-clptw in /home/jenkins/agent/workspace/Test
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] container
[Pipeline] {
[Pipeline] sh
+ curl -S https://onliner.by
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>

100   162  100   162    0     0     76      0  0:00:02  0:00:02 --:--:--    76
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
