# https://github.com/aionfiend/10.Kubernetes

# 10.1
1. brew install kubectl
2. brew install kind
3. Создание файла конфигурации для кластера: kind-config.yaml
4. kind create cluster --name single-node --config kind-config.yaml
```
Creating cluster "single-node" ...
 ✓ Ensuring node image (kindest/node:v1.37.0) 🖼️ 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-single-node"
You can now use your cluster with:

kubectl cluster-info --context kind-single-node

Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/
```
5. kind get clusters
```
single-node
```
6. kind delete cluster

# 10.2
1. curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && chmod +x minikube
```
 % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  142M  100  142M    0     0  6611k      0  0:00:22  0:00:22 --:--:-- 5330k
```
2. sudo mv minikube /usr/local/bin - доступ из любого места в терминале
3. minikube start --vm-driver=docker
```
   😄  minikube v1.39.0 on Darwin 13.7.8
   ✨  Using the docker driver based on user configuration
   📌  Using Docker Desktop driver with root privileges
   👍  Starting "minikube" primary control-plane node in "minikube" cluster
   🚜  Pulling base image v0.0.51 ...
   💾  Downloading Kubernetes v1.37.0 preload ...
   > gcr.io/k8s-minikube/kicbase:  507.61 MiB / 507.61 MiB  100.00% 5.13 MiB p
   > preloaded-images-k8s-v18-v1...:  347.58 MiB / 347.58 MiB  100.00% 3.05 Mi
   🔥  Creating docker container (CPUs=2, Memory=1967MB) ...
   📦  Preparing Kubernetes v1.37.0 on containerd 2.3.4 ...
   🔗  Configuring CNI (Container Networking Interface) ...
   🔎  Verifying Kubernetes components...
   ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
   🌟  Enabled addons: default-storageclass, storage-provisioner

❗  /opt/local/bin/kubectl is version 1.31.14, which may have incompatibilities with Kubernetes 1.37.0.
▪ Want kubectl v1.37.0? Try 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```
4. minikube version
```
minikube version: v1.39.0
commit: 7a9f6a841470a207de8cf4bafcccee0969d8ba10
```
5. minikube status
```
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
6. minikube kubectl -- get nodes
```
kubectl.sha256:  64 B / 64 B [-------------------------] 100.00% ? p/s 0s
kubectl:  60.26 MiB / 60.26 MiB [--------------] 100.00% 3.67 MiB p/s 17s
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   4m35s   v1.37.0
```
7. minikube dashboard
```
🔌  Enabling dashboard ...
    ▪ Using image docker.io/kubernetesui/dashboard:v2.7.0
    ▪ Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
💡  Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:62176/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...

q
^C
user@users-MacBook-Pro$ minikube update-context
🙄  No changes required for the "minikube" context
💗  Current context is "minikube"
user@users-MacBook-Pro$ kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:32771
CoreDNS is running at https://127.0.0.1:32771/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
8.  kubectl get pods -n kube-system
```
NAME                               READY   STATUS    RESTARTS   AGE
coredns-559f6c778d-lssz6           1/1     Running   0          16m
etcd-minikube                      1/1     Running   0          16m
kindnet-6bv7l                      1/1     Running   0          16m
kube-apiserver-minikube            1/1     Running   0          16m
kube-controller-manager-minikube   1/1     Running   0          16m
kube-proxy-s98hh                   1/1     Running   0          16m
kube-scheduler-minikube            1/1     Running   0          16m
storage-provisioner                1/1     Running   0          16m
```

# 10.3
```
Run kubectl cluster-info
  kubectl cluster-info
  kubectl get nodes
  kubectl get pods -A
  shell: /usr/bin/bash -e {0}
  
Kubernetes control plane is running at https://127.0.0.1:37825
CoreDNS is running at https://127.0.0.1:37825/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   25s   v1.31.0
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-6f6b679f8f-vlrwn                     1/1     Running   0          16s
kube-system          coredns-6f6b679f8f-wpxgl                     1/1     Running   0          16s
kube-system          etcd-kind-control-plane                      1/1     Running   0          24s
kube-system          kindnet-5hrnt                                1/1     Running   0          16s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          23s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          23s
kube-system          kube-proxy-qq5cv                             1/1     Running   0          16s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          23s
local-path-storage   local-path-provisioner-ccc7bf7fc-jf5l7       1/1     Running   0          16s
```

10.4
```
Run kubectl cluster-info
  kubectl cluster-info
  kubectl get nodes
  kubectl get pods -A
  minikube status
  shell: /usr/bin/bash -e {0}
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   25s   v1.37.0
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-559f6c778d-xdl92           1/1     Running   0          16s
kube-system   etcd-minikube                      1/1     Running   0          22s
kube-system   kindnet-mb5kl                      1/1     Running   0          16s
kube-system   kube-apiserver-minikube            1/1     Running   0          22s
kube-system   kube-controller-manager-minikube   1/1     Running   0          22s
kube-system   kube-proxy-vkcck                   1/1     Running   0          16s
kube-system   kube-scheduler-minikube            1/1     Running   0          22s
kube-system   storage-provisioner                1/1     Running   0          15s
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```