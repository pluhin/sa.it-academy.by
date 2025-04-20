# 10. Kubernetes installation (WS)

## Homework Assignment 1. K8s Installation

### Localhost
1. Install kubectl
```
debian@vbox ~/i/10.K8s (master)> kubectl version
Client Version: v1.32.3
Kustomize Version: v5.5.0
Server Version: v1.32.3+k3s1
```
2. Install k9s 
```
ebian@vbox ~/i/10.K8s (master)> k9s version                                                                                                                                                             
 ____  __ ________       
|    |/  /   __   \______
|       /\____    /  ___/
|    \   \  /    /\___  \
|____|\__ \/____//____  /
         \/           \/

Version:    v0.50.3
Commit:     594c2c6e4c8dce30e5553e84e4a16a3e55e36066
Date:       2025-04-14T00:28:19Zi
```
3. You can find screenshoots in files

### Monitoring of cluster
1. Create check_pods.yaml in .github/workflows/ 
2. Create pod_err.yaml and run on k8s cluster 192.168.208.19 
``` 
kubectl apply -f pod-err.yaml

 ```
3. Check pods status k8s
``` 
debian@vbox ~/i/10.K8s (master)> kubectl get pods -A                                                                                                                                                     
NAMESPACE     NAME                                       READY   STATUS             RESTARTS   AGE
default       broken-pod                                 0/1     ImagePullBackOff   0          33m
default       ubuntu-default                             1/1     Running            0          2d
kube-system   calico-kube-controllers-6747688466-w8hhn   1/1     Running            0          2d21h
kube-system   calico-node-gfg8t                          1/1     Running            0          2d21h
kube-system   calico-node-x2pxq                          1/1     Running            0          2d21h
kube-system   coredns-5c54f84c97-rntfz                   1/1     Running            0          2d21h
kube-system   coredns-5c54f84c97-zk6gj                   1/1     Running            0          2d21h
kube-system   dns-autoscaler-76ddddbbc-sgzjr             1/1     Running            0          2d21h
kube-system   kube-apiserver-node1                       1/1     Running            1          2d21h
kube-system   kube-controller-manager-node1              1/1     Running            2          2d21h
kube-system   kube-proxy-2tphz                           1/1     Running            0          2d21h
kube-system   kube-proxy-hmjm8                           1/1     Running            0          2d21h
kube-system   kube-scheduler-node1                       1/1     Running            1          2d21h
kube-system   nginx-proxy-node2                          1/1     Running            0          2d21h
kube-system   nodelocaldns-5b7ch                         1/1     Running            0          2d21h
kube-system   nodelocaldns-9bdqq                         1/1     Running            0          2d21h

```
4. Push all changes to remote repo
5. Go to github and open Actions section
6. Run "Check status of pods and Slack notification" action
7. Actual result: notification in slack from k8s cluster. See screenshot.
