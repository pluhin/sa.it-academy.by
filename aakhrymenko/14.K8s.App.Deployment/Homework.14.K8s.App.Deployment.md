# Homework 14.K8s.App.Deployment

## Test task in Jenkins

```

Console Output

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

Created Pod: kubernetes ci-cd/sample-app-s5n4l-ck83s
[Normal][ci-cd/sample-app-s5n4l-ck83s][Scheduled] Successfully assigned ci-cd/sample-app-s5n4l-ck83s to node1

[Normal][ci-cd/sample-app-s5n4l-ck83s][Pulled] Container image "jfrog.it-academy.by/public/curl:spishchyk" already present on machine
[Normal][ci-cd/sample-app-s5n4l-ck83s][Created] Created container curltest
[Normal][ci-cd/sample-app-s5n4l-ck83s][Started] Started container curltest
[Normal][ci-cd/sample-app-s5n4l-ck83s][Pulled] Container image "jenkins/inbound-agent:4.3-4" already present on machine
[Normal][ci-cd/sample-app-s5n4l-ck83s][Created] Created container jnlp
[Normal][ci-cd/sample-app-s5n4l-ck83s][Started] Started container jnlp

Agent sample-app-s5n4l-ck83s is provisioned from template sample-app-s5n4l
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/Test/4/"
    runUrl: "job/Test/4/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "e63233bec581b1d9effa6b6d4f0bca0985a05b55"
    jenkins/label: "sample-app"
  name: "sample-app-s5n4l-ck83s"
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
      value: "sample-app-s5n4l-ck83s"
    - name: "JENKINS_NAME"
      value: "sample-app-s5n4l-ck83s"
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

Running on sample-app-s5n4l-ck83s in /home/jenkins/agent/workspace/Test
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Test)

[Pipeline] container
[Pipeline] {
[Pipeline] sh
+ curl -S https://rbc.ru
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>

100   162  100   162    0     0    657      0 --:--:-- --:--:-- --:--:--   658

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


## K8s PODs

```

➜  Jenkins git:(main) kubectl get pods --all-namespaces
NAMESPACE     NAME                                         READY   STATUS    RESTARTS   AGE
ci-cd         jenkins-54cc9cc55-lw4rs                      1/1     Running   0          11m
ci-cd         sample-app-s5n4l-ck83s                       2/2     Running   0          5m54s
default       helm-app-68d746474b-k7wtz                    1/1     Running   0          24h
default       helm-nginx-app-8b77589b9-r4h2g               1/1     Running   0          20h
default       helm-radar-app-67699d54c8-2wvz7              1/1     Running   0          18h
default       helm-sonar-app-544f9d9db6-kpqqg              1/1     Running   0          18h
default       nginx-5c95b5fb9-7wq8b                        1/1     Running   0          23h
default       radarr-658f5dbcc-hxqb5                       1/1     Running   0          20h
default       sonarr-744b574599-4j9bp                      1/1     Running   0          20h
default       webserver-76fd8bb6b9-6426l                   1/1     Running   0          43h
flux-system   helm-controller-6dcbff747f-cjfm8             1/1     Running   0          129m
flux-system   kustomize-controller-5bb9984cf9-8lh58        1/1     Running   0          129m
flux-system   notification-controller-7569f7c974-m6r9w     1/1     Running   0          129m
flux-system   source-controller-5b976b8dd6-rqqlg           1/1     Running   0          129m
kube-system   calico-kube-controllers-5b4d7b4594-fwx4h     1/1     Running   0          8d
kube-system   calico-node-5ddt8                            1/1     Running   0          8d
kube-system   calico-node-t8jwh                            1/1     Running   0          8d
kube-system   coredns-8474476ff8-22nv5                     1/1     Running   0          8d
kube-system   coredns-8474476ff8-g88nl                     1/1     Running   0          8d
kube-system   dashboard-metrics-scraper-778b77d469-fljsr   1/1     Running   0          7d15h
kube-system   dns-autoscaler-7df78bfcfb-9dmn7              1/1     Running   0          8d
kube-system   kube-apiserver-node1                         1/1     Running   0          8d
kube-system   kube-controller-manager-node1                1/1     Running   0          8d
kube-system   kube-proxy-b4dwm                             1/1     Running   0          8d
kube-system   kube-proxy-drrrj                             1/1     Running   0          8d
kube-system   kube-scheduler-node1                         1/1     Running   0          8d
kube-system   kubernetes-dashboard-58b6595bb5-4s92z        1/1     Running   0          7d15h
kube-system   metrics-server-74b7bd57ff-9jxwv              1/1     Running   0          7d1h
kube-system   nginx-ingress-controller-68dd474dcb-xjz8h    1/1     Running   0          7d15h
kube-system   nginx-proxy-node2                            1/1     Running   0          8d
kube-system   nodelocaldns-bn5g8                           1/1     Running   0          8d
kube-system   nodelocaldns-zzcrl                           1/1     Running   0          8d
➜  Jenkins git:(main)

```
