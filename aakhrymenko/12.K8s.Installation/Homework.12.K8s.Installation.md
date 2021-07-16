# Homework.12.K8s.installation

```bash


➜  ~ alias | grep kube
kgda='kubectl get deployment --all-namespaces'
kgia='kubectl get ingress --all-namespaces'
kgno='kubectl get nodes'
kgns='kubectl get namespaces'
kgpa='kubectl get pods --all-namespaces'
kgseca='kubectl get secret --all-namespaces'
kl1h='kubectl logs --since 1h'

➜  ~
➜  ~ kgno
NAME    STATUS   ROLES                  AGE   VERSION
node1   Ready    control-plane,master   44h   v1.21.2
node2   Ready    <none>                 44h   v1.21.2

➜  ~ kgpa
NAMESPACE     NAME                                         READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-5b4d7b4594-fwx4h     1/1     Running   0          44h
kube-system   calico-node-5ddt8                            1/1     Running   0          44h
kube-system   calico-node-t8jwh                            1/1     Running   0          44h
kube-system   coredns-8474476ff8-22nv5                     1/1     Running   0          44h
kube-system   coredns-8474476ff8-g88nl                     1/1     Running   0          44h
kube-system   dashboard-metrics-scraper-778b77d469-fljsr   1/1     Running   0          14h
kube-system   dns-autoscaler-7df78bfcfb-9dmn7              1/1     Running   0          44h
kube-system   kube-apiserver-node1                         1/1     Running   0          44h
kube-system   kube-controller-manager-node1                1/1     Running   0          44h
kube-system   kube-proxy-b4dwm                             1/1     Running   0          44h
kube-system   kube-proxy-drrrj                             1/1     Running   0          44h
kube-system   kube-scheduler-node1                         1/1     Running   0          44h
kube-system   kubernetes-dashboard-58b6595bb5-4s92z        1/1     Running   0          14h
kube-system   metrics-server-74b7bd57ff-9jxwv              1/1     Running   0          43m
kube-system   nginx-ingress-controller-68dd474dcb-xjz8h    1/1     Running   0          14h
kube-system   nginx-proxy-node2                            1/1     Running   0          44h
kube-system   nodelocaldns-bn5g8                           1/1     Running   0          44h
kube-system   nodelocaldns-zzcrl                           1/1     Running   0          44h

➜  ~ k9s

➜  ~ kubectl get svc --all-namespaces -o wide
NAMESPACE     NAME                        TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE   SELECTOR
default       kubernetes                  ClusterIP   10.233.0.1     <none>        443/TCP                      44h   <none>
kube-system   coredns                     ClusterIP   10.233.0.3     <none>        53/UDP,53/TCP,9153/TCP       44h   k8s-app=kube-dns
kube-system   dashboard-metrics-scraper   ClusterIP   10.233.52.31   <none>        8000/TCP                     14h   k8s-app=dashboard-metrics-scraper
kube-system   ingress-nginx               NodePort    10.233.24.21   <none>        80:30001/TCP,443:30002/TCP   14h   app.kubernetes.io/name=ingress-nginx,app.kubernetes.io/part-of=ingress-nginx
kube-system   kubernetes-dashboard        ClusterIP   10.233.32.55   <none>        443/TCP                      14h   k8s-app=kubernetes-dashboard
kube-system   metrics-server              ClusterIP   10.233.9.206   <none>        443/TCP                      46m   k8s-app=metrics-server
➜  ~

```

