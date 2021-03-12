```
alias tunnel='ssh -L 6443:127.0.0.1:6443 root@192.168.203.13 -f -N'
alias k9s='/root/k9s/execs/k9s'



[root@onlyoffice ~]# kubectl get pods --all-namespaces
NAMESPACE     NAME                                         READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-596bd759d5-dqwvf     1/1     Running   0          23h
kube-system   calico-node-6zstj                            1/1     Running   0          23h
kube-system   calico-node-flm94                            1/1     Running   0          23h
kube-system   coredns-657959df74-97x8r                     1/1     Running   0          23h
kube-system   coredns-657959df74-p9srh                     1/1     Running   0          23h
kube-system   dashboard-metrics-scraper-7445d59dfd-pq5hn   1/1     Running   0          16h
kube-system   dns-autoscaler-b5c786945-hjpks               1/1     Running   0          23h
kube-system   kube-apiserver-node1                         1/1     Running   0          23h
kube-system   kube-controller-manager-node1                1/1     Running   0          23h
kube-system   kube-proxy-mj5rk                             1/1     Running   0          23h
kube-system   kube-proxy-sfc8g                             1/1     Running   0          23h
kube-system   kube-scheduler-node1                         1/1     Running   0          23h
kube-system   kubernetes-dashboard-6f85cc8978-cpbzx        1/1     Running   0          16h
kube-system   nginx-proxy-node2                            1/1     Running   0          23h
kube-system   nodelocaldns-vtj56                           1/1     Running   0          23h
kube-system   nodelocaldns-zl2hf                           1/1     Running   0          23h


[root@onlyoffice ~]# kubectl get services -n kube-system
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
coredns                     ClusterIP   10.233.0.3      <none>        53/UDP,53/TCP,9153/TCP   23h
dashboard-metrics-scraper   ClusterIP   10.233.15.74    <none>        8000/TCP                 16h
kubernetes-dashboard        ClusterIP   10.233.39.246   <none>        443/TCP                  16h


[root@onlyoffice ~]# curl -k https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login
<!--
Copyright 2017 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>Kubernetes Dashboard</title>
  <link rel="icon" type="image/png" href="assets/images/kubernetes-logo.png"/>
  <meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="styles.dd2d1d3576191b87904a.css"></head>

<body>
  <kd-root></kd-root>
<script src="runtime.380dd4d7ab4891f91b7b.js" defer=""></script><script src="polyfills-es5.65f1e5151c840cf04c3e.js" nomodule="" defer=""></script><script src="polyfills.8623bbc9d68876cdaaaf.js" defer=""></script><script src="scripts.7d5e232ea538f2c0f8a7.js" defer=""></script><script src="main.3036e86b43f81b098e24.js" defer=""></script></body>

</html>

```
