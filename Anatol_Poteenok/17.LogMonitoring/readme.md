``` sh
cubectl get pods
NAME                                      READY   STATUS    RESTARTS        AGE
drupal-helm-d667bcb4c-bbnd2               2/2     Running   0               18d
drupal-helm-mariadb-0                     2/2     Running   0               18d
drupal-helm-wordpress-6954488b89-2254d    2/2     Running   2 (18d ago)     18d
nfs-client-provisioner-7549474d4b-5n6z6   1/1     Running   0               18d
nginx-678fcfb6d7-bdpp7                    1/1     Running   0               23d
nginx-678fcfb6d7-cbcs7                    1/1     Running   0               23d
nginx-678fcfb6d7-cmhm5                    1/1     Running   0               23d
nginx-678fcfb6d7-srzgp                    1/1     Running   0               23d
ubuntu-default                            1/1     Running   5 (4d20h ago)   39d

```



```
kubectl  logs nginx-678fcfb6d7-bdpp7
2026/03/08 09:25:48 [notice] 1#1: using the "epoll" event method
2026/03/08 09:25:48 [notice] 1#1: nginx/1.29.5
2026/03/08 09:25:48 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/03/08 09:25:48 [notice] 1#1: OS: Linux 6.1.0-37-amd64
2026/03/08 09:25:48 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 65535:65535
2026/03/08 09:25:48 [notice] 1#1: start worker processes
2026/03/08 09:25:48 [notice] 1#1: start worker process 8
2026/03/08 09:25:48 [notice] 1#1: start worker process 9
2026/03/08 09:25:48 [notice] 1#1: start worker process 10
2026/03/08 09:25:48 [notice] 1#1: start worker process 11
2026/03/08 09:25:48 [notice] 1#1: start worker process 12
2026/03/08 09:25:48 [notice] 1#1: start worker process 13
2026/03/08 09:25:48 [notice] 1#1: start worker process 14
2026/03/08 09:25:48 [notice] 1#1: start worker process 15
10.233.75.7 - - [08/Mar/2026:19:56:14 +0000] "GET / HTTP/1.1" 200 424 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "10.233.102.128"
10.233.75.7 - - [08/Mar/2026:20:29:06 +0000] "GET / HTTP/1.1" 200 424 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "10.233.102.128"
10.233.75.7 - - [09/Mar/2026:07:41:48 +0000] "GET / HTTP/1.1" 200 424 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "10.233.102.128"
10.233.75.7 - - [12/Mar/2026:21:12:27 +0000] "GET / HTTP/1.1" 200 424 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "192.168.208.4"
10.233.75.7 - - [12/Mar/2026:21:12:33 +0000] "GET / HTTP/1.1" 200 424 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "192.168.208.4"
10.233.75.7 - - [12/Mar/2026:21:12:34 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0" "192.168.208.4"

```


* Collect logs from all Pods of your Deployment:
``` bash
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.labels.app}{"\n"}{end}' | sort -u

github-runner
istiod
istio-ingressgateway
jenkins
nfs-client-provisioner
nginx
ubuntu


kubectl get namespaces
NAME              STATUS   AGE
argocd            Active   15d
ci-cd             Active   25d
default           Active   40d
githubrunner      Active   26d
ingress-nginx     Active   28d
istio-system      Active   18d
kube-node-lease   Active   40d
kube-public       Active   40d
kube-system       Active   40d
monitoring        Active   10d


kubectl logs -l app=jenkins --all-containers=true --prefix=true -n ci-cd
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-28 18:01:40.352+0000 [id=173342] INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-28 18:01:44.393+0000 [id=173342] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-28 18:01:45.427+0000 [id=173342] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-28 18:01:45.427+0000 [id=173342] INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-29 18:01:41.710+0000 [id=180888] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-29 18:01:42.933+0000 [id=180888] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-30 18:01:40.352+0000 [id=188454] INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-30 18:01:45.151+0000 [id=188454] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-30 18:01:46.221+0000 [id=188454] INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
[pod/jenkins-69bbcc4bf8-g499v/jenkins] 2026-03-30 18:01:46.222+0000 [id=188454] INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1

```

* Stream logs in real time:

``` bash

 kubectl logs -f deploy/jenkins -n ci-cd
 
 .....
 2026-03-28 18:01:44.393+0000 [id=173342]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2026-03-28 18:01:45.427+0000 [id=173342]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2026-03-28 18:01:45.427+0000 [id=173342]        INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
2026-03-29 18:01:41.710+0000 [id=180888]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2026-03-29 18:01:42.933+0000 [id=180888]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2026-03-30 18:01:40.352+0000 [id=188454]        INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2026-03-30 18:01:45.151+0000 [id=188454]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2026-03-30 18:01:46.221+0000 [id=188454]        INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2026-03-30 18:01:46.222+0000 [id=188454]        INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
 
```

* faling pod/jenkins-69bbcc4bf8-g499v/jenkins
fail-loop-pod.yaml
``` yaml
apiVersion: v1
kind: Pod
metadata:
  name: fail-loop-pod
  labels:
    app: fail-loop-pod
spec:
  restartPolicy: Always
  containers:
    - name: crash
      image: busybox:1.36
      command:
        - /bin/sh
        - -c
        - |
          echo "$(date -Iseconds) tick stdout"
          echo "$(date -Iseconds) tick stderr" >&2
          sleep 20
          echo "$(date -Iseconds) exiting 1" >&2
          exit 1
```


``` bash
kubectl apply -f ./fail-loop-pod.yaml

pod/fail-loop-pod created

kubectl get pod fail-loop-pod -w

kubectl logs fail-loop-pod 
2026-04-02T16:07:28+00:00 tick stdout
2026-04-02T16:07:28+00:00 tick stderr
2026-04-02T16:07:31+00:00 exiting 1
...

kubectl logs fail-loop-pod -f --previous 
unable to retrieve container logs for containerd://12c9755c26de8d7627f89b5c23ec439a1fc4ea3a0d225f1bddde11e1535d9989

```

* logs on node  


```
ls /var/log/pods
root@node1:~# ls /var/log/pods
argocd_argocd-application-controller-0_e5bf4379-168b-4375-b2fb-833046cb434d
argocd_argocd-applicationset-controller-6d94667dc8-2gjwp_ef5591b6-2c87-4b87-8c83-db891a6ca317
argocd_argocd-dex-server-55f6cd99fd-8s7kn_87aaee13-9da7-4098-a0ac-68556d6a8eca
argocd_argocd-redis-6674d67c8b-tvxrm_f56984ff-6181-46b7-ad8a-0263593f13f6
default_drupal-helm-mariadb-0_e433c4db-e31c-48c2-b971-242be29faabb
default_drupal-helm-wordpress-6954488b89-2254d_db55d819-a1fb-4700-bad8-62b2d5f672dc
default_fail-loop-pod_61e82d31-28c6-48d9-be20-6551c7090b6d
default_nfs-client-provisioner-7549474d4b-5n6z6_08117004-282b-4736-b4f1-5535e59f3e95
default_nginx-678fcfb6d7-cbcs7_52337f32-1038-41b9-804e-d5045ded6b1f
.....


root@node1:~# tail /var/log/containers/monitoring-stack-grafana-5d57cdf9b7-khpnj_monitoring_grafana-b95d08f4da5b9909d66d5e9e2728e75a1331534f0
c8ed613a1e6abf0c4335deb.log
2026-04-02T18:29:44.267025113+03:00 stdout F logger=infra.usagestats t=2026-04-02T15:29:44.266811415Z level=info msg="Usage stats are ready to report"
2026-04-02T18:39:03.27481469+03:00 stdout F logger=cleanup t=2026-04-02T15:39:03.274580907Z level=info msg="Completed cleanup jobs" duration=19.491959ms
2026-04-02T18:49:03.279241221+03:00 stdout F logger=cleanup t=2026-04-02T15:49:03.279019771Z level=info msg="Completed cleanup jobs" duration=24.053145ms
2026-04-02T18:59:03.297091725+03:00 stdout F logger=cleanup t=2026-04-02T15:59:03.29688066Z level=info msg="Completed cleanup jobs" duration=42.337736ms
2026-04-02T18:59:44.26608966+03:00 stdout F logger=infra.usagestats t=2026-04-02T15:59:44.265904061Z level=info msg="Usage stats are ready to report"
2026-04-02T19:09:03.295688858+03:00 stdout F logger=cleanup t=2026-04-02T16:09:03.295422685Z level=info msg="Completed cleanup jobs" duration=40.052452ms

```
