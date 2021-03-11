
## Minikube on Windows

```
PS C:\Windows\system32> minikube start
* minikube v1.18.1 on Microsoft Windows 10 Pro 10.0.19041 Build 19041
* Automatically selected the virtualbox driver
* Starting control plane node minikube in cluster minikube
* Creating virtualbox VM (CPUs=2, Memory=2200MB, Disk=20000MB) ...
* Preparing Kubernetes v1.20.2 on Docker 20.10.3 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v4
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
PS C:\Windows\system32>
PS C:\Windows\system32> minikube ssh
                         _             _
            _         _ ( )           ( )
  ___ ___  (_)  ___  (_)| |/')  _   _ | |_      __
/' _ ` _ `\| |/' _ `\| || , <  ( ) ( )| '_`\  /'__`\
| ( ) ( ) || || ( ) || || |\`\ | (_) || |_) )(  ___/
(_) (_) (_)(_)(_) (_)(_)(_) (_)`\___/'(_,__/'`\____)

$ ls
$ ls -l
total 0
$ id
uid=1000(docker) gid=1000(docker) groups=1000(docker),10(wheel),1019(podman),1020(vboxsf)
$ free
              total        used        free      shared  buff/cache   available
Mem:        2186484      684008      101920      626564     1400556      773276
Swap:             0           0           0
$ logout
PS C:\Windows\system32> minikube addons enable dashboard
  - Using image kubernetesui/dashboard:v2.1.0
  - Using image kubernetesui/metrics-scraper:v1.0.4
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server


* The 'dashboard' addon is enabled

PS C:\Windows\system32> kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
minikube   Ready    control-plane,master   23m   v1.20.2
PS C:\Windows\system32> kubectl get pods -n kube-system
NAME                               READY   STATUS    RESTARTS   AGE
coredns-74ff55c5b-xxg2f            1/1     Running   0          23m
etcd-minikube                      1/1     Running   0          23m
kube-apiserver-minikube            1/1     Running   0          23m
kube-controller-manager-minikube   1/1     Running   0          23m
kube-proxy-xxxp9                   1/1     Running   0          23m
kube-scheduler-minikube            1/1     Running   0          23m
storage-provisioner                1/1     Running   1          23m
PS C:\Windows\system32> kubectl proxy --address='0.0.0.0' --disable-filter=true
W0310 20:42:05.604212   23364 proxy.go:167] Request filter disabled, your proxy is vulnerable to XSRF attacks, please be cautious
Starting to serve on [::]:8001


PS C:\Windows\system32> minikube addons enable ingress
  - Using image us.gcr.io/k8s-artifacts-prod/ingress-nginx/controller:v0.40.2
  - Using image jettech/kube-webhook-certgen:v1.2.2
  - Using image jettech/kube-webhook-certgen:v1.3.0
* Verifying ingress addon...
* The 'ingress' addon is enabled
PS C:\Windows\system32> kubectl get pods -n kube-system
NAME                                        READY   STATUS      RESTARTS   AGE
coredns-74ff55c5b-xxg2f                     1/1     Running     0          91m
etcd-minikube                               1/1     Running     0          91m
ingress-nginx-admission-create-7jdnc        0/1     Completed   0          88s
ingress-nginx-admission-patch-l2bzk         0/1     Completed   0          88s
ingress-nginx-controller-65cf89dc4f-8g8qd   0/1     Running     0          88s
kube-apiserver-minikube                     1/1     Running     0          91m
kube-controller-manager-minikube            1/1     Running     0          91m
kube-proxy-xxxp9                            1/1     Running     0          91m
kube-scheduler-minikube                     1/1     Running     0          91m
storage-provisioner                         1/1     Running     1          91m




PS C:\Windows\system32> minikube stop
* Stopping node "minikube"  ...
* 1 nodes stopped.



PS C:\Windows\system32> minikube delete
* Deleting "minikube" in virtualbox ...
* Removed all traces of the "minikube" cluster.

PS C:\Windows\system32> minikube start --memory=1900 --cpus=2 --disk-size=10g
* minikube v1.18.1 on Microsoft Windows 10 Pro 10.0.19041 Build 19041
* Automatically selected the virtualbox driver
* Starting control plane node minikube in cluster minikube
* Creating virtualbox VM (CPUs=2, Memory=1900MB, Disk=10240MB) ...
* Preparing Kubernetes v1.20.2 on Docker 20.10.3 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v4
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
PS C:\Windows\system32>

```
