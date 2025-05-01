```bash
kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-ff8999cc5-x58wv                   1/1     Running   0          11d   
kube-system   local-path-provisioner-774c6665dc-h57fp   1/1     Running   0          11d   
kube-system   metrics-server-6f4c6675d5-hrsm5           1/1     Running   0          11d   
vlad@testserv:~/K8s$ kubectl get pods -A --context "k8s"
client_loop: send disconnect: Broken pipe
Get "https://127.0.0.1:6443/api/v1/pods?limit=500": dial tcp 127.0.0.1:6443: connect: connection refused - error from a previous attempt: read tcp 127.0.0.1:58162->127.0.0.1:6443: read: connection reset by peer
vlad@testserv:~/K8s$ ssh -L 6443:127.0.0.1:6443 root@192.168.208.17 -f -N
root@192.168.208.17's password: 
vlad@testserv:~/K8s$ kubectl get pods -A --context "k8s"
NAMESPACE     NAME                                       READY   STATUS    RESTARTS        AGE
default       ubuntu-default                             1/1     Running   1 (4d10h ago)   11d
kube-system   calico-kube-controllers-6747688466-7rmxd   1/1     Running   0               
12d
kube-system   calico-node-5js4t                          1/1     Running   0               
12d
kube-system   calico-node-8n8xn                          1/1     Running   0               
12d
kube-system   coredns-5c54f84c97-pf2tm                   1/1     Running   0               
12d
kube-system   coredns-5c54f84c97-xz7hh                   1/1     Running   0               
12d
kube-system   dns-autoscaler-76ddddbbc-zlg2l             1/1     Running   0               
12d
kube-system   kube-apiserver-node1                       1/1     Running   1               
12d
kube-system   kube-controller-manager-node1              1/1     Running   3               
12d
kube-system   kube-proxy-bwvg9                           1/1     Running   0               
12d
kube-system   kube-proxy-sx8b5                           1/1     Running   0               
12d
kube-system   kube-scheduler-node1                       1/1     Running   1               
12d
kube-system   nginx-proxy-node2                          1/1     Running   0               
12d
kube-system   nodelocaldns-78ztg                         1/1     Running   0               
12d
kube-system   nodelocaldns-tc52z                         1/1     Running   0               
12d
vlad@testserv:~/K8s$ kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-ff8999cc5-x58wv                   1/1     Running   0          11d   
kube-system   local-path-provisioner-774c6665dc-h57fp   1/1     Running   0          11d   
kube-system   metrics-server-6f4c6675d5-hrsm5           1/1     Running   0          11d   
vlad@testserv:~/K8s$ kubectl get pods -A --context "k8s"
NAMESPACE     NAME                                       READY   STATUS    RESTARTS        AGE
default       ubuntu-default                             1/1     Running   1 (4d10h ago)   11d
kube-system   calico-kube-controllers-6747688466-7rmxd   1/1     Running   0               
12d
kube-system   calico-node-5js4t                          1/1     Running   0               
12d
kube-system   calico-node-8n8xn                          1/1     Running   0               
12d
kube-system   coredns-5c54f84c97-pf2tm                   1/1     Running   0               
12d
kube-system   coredns-5c54f84c97-xz7hh                   1/1     Running   0               
12d
kube-system   dns-autoscaler-76ddddbbc-zlg2l             1/1     Running   0               
12d
kube-system   kube-apiserver-node1                       1/1     Running   1               
12d
kube-system   kube-controller-manager-node1              1/1     Running   3               
12d
kube-system   kube-proxy-bwvg9                           1/1     Running   0               
12d
kube-system   kube-proxy-sx8b5                           1/1     Running   0               
12d
kube-system   kube-scheduler-node1                       1/1     Running   1               
12d
11d
kube-system   calico-kube-controllers-6747688466-7rmxd   1/1     Running   0               12d
kube-system   calico-node-5js4t                          1/1     Running   0               12d
kube-system   calico-node-8n8xn                          1/1     Running   0               12d
kube-system   coredns-5c54f84c97-pf2tm                   1/1     Running   0               12d
kube-system   coredns-5c54f84c97-xz7hh                   1/1     Running   0               12d
kube-system   dns-autoscaler-76ddddbbc-zlg2l             1/1     Running   0               12d
kube-system   kube-apiserver-node1                       1/1     Running   1               12d
kube-system   kube-controller-manager-node1              1/1     Running   3               12d
kube-system   kube-proxy-bwvg9                           1/1     Running   0               12d
kube-system   kube-proxy-sx8b5                           1/1     Running   0               12d
kube-system   kube-scheduler-node1                       1/1     Running   1               12d
kube-system   nginx-proxy-node2                          1/1     Running   0               12d
kube-system   nodelocaldns-78ztg                         1/1     Running   0               12d
kube-system   nodelocaldns-tc52z                         1/1     Running   0               12d
vlad@testserv:~/K8s$ kubectl apply -f pod.yaml
pod/ubuntu-default created
vlad@testserv:~/K8s$ kubectl get pods
NAME             READY   STATUS              RESTARTS   AGE
ubuntu-default   0/1     ContainerCreating   0          37s
vlad@testserv:~/K8s$ kubectl get pods
NAME             READY   STATUS    RESTARTS   AGE
ubuntu-default   1/1     Running   0          113s
```