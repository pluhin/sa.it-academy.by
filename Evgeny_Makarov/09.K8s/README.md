# 09.K8s.Install

## Final result
```
PLAY RECAP ***************************************************************************************************************
node1                      : ok=654  changed=144  unreachable=0    failed=0    skipped=829  rescued=0    ignored=4   
node2                      : ok=434  changed=90   unreachable=0    failed=0    skipped=477  rescued=0    ignored=0   

Monday 18 May 2026  11:16:28 +0000 (0:00:00.120)       0:19:50.263 ************ 
=============================================================================== 
download : Download_container | Download image if required ------------------------------------------------------- 73.36s
download : Download_container | Download image if required ------------------------------------------------------- 70.49s
download : Download_container | Download image if required ------------------------------------------------------- 57.50s
system_packages : Manage packages -------------------------------------------------------------------------------- 57.18s
download : Download_container | Download image if required ------------------------------------------------------- 45.64s
download : Download_container | Download image if required ------------------------------------------------------- 41.71s
download : Download_container | Download image if required ------------------------------------------------------- 40.63s
download : Download_file | Download item ------------------------------------------------------------------------- 36.84s
download : Download_container | Download image if required ------------------------------------------------------- 33.94s
download : Download_container | Download image if required ------------------------------------------------------- 30.41s
download : Download_container | Download image if required ------------------------------------------------------- 24.46s
download : Download_file | Download item ------------------------------------------------------------------------- 24.13s
container-engine/containerd : Download_file | Download item ------------------------------------------------------ 23.89s
download : Download_file | Download item ------------------------------------------------------------------------- 22.77s
download : Download_file | Download item ------------------------------------------------------------------------- 21.11s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.05s
download : Download_container | Download image if required ------------------------------------------------------- 20.19s
container-engine/runc : Download_file | Download item ------------------------------------------------------------ 19.56s
download : Download_container | Download image if required ------------------------------------------------------- 18.05s
container-engine/crictl : Download_file | Download item ---------------------------------------------------------- 17.85s

```


## Assignment 1. KinD

`kind create cluster --name 09.kind-cluster`
```
Creating cluster "09.kind-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.35.0) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-09.kind-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-09.kind-cluster
```

`kubectl get nodes`
```
NAME                            STATUS   ROLES           AGE   VERSION
09.kind-cluster-control-plane   Ready    control-plane   93s   v1.35.0
```

`kubectl get pods -A`
```
NAMESPACE            NAME                                                    READY   STATUS    RESTARTS   AGE
kube-system          coredns-7d764666f9-ftjcr                                1/1     Running   0          112s
kube-system          coredns-7d764666f9-kqjcf                                1/1     Running   0          112s
kube-system          etcd-09.kind-cluster-control-plane                      1/1     Running   0          2m
kube-system          kindnet-n5q97                                           1/1     Running   0          112s
kube-system          kube-apiserver-09.kind-cluster-control-plane            1/1     Running   0          2m
kube-system          kube-controller-manager-09.kind-cluster-control-plane   1/1     Running   0          2m
kube-system          kube-proxy-kpf9q                                        1/1     Running   0          112s
kube-system          kube-scheduler-09.kind-cluster-control-plane            1/1     Running   0          2m
local-path-storage   local-path-provisioner-67b8995b4b-c6pn8                 1/1     Running   0          112s
```

`kubectl cluster-info`
```
Kubernetes control plane is running at https://127.0.0.1:53340
CoreDNS is running at https://127.0.0.1:53340/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```


## Asignment 2. Minikube

`minikube start --driver=docker`
```
😄  minikube v1.38.1 on Darwin 26.5 (arm64)
✨  Using the docker driver based on user configuration
❗  Starting v1.39.0, minikube will default to "containerd" container runtime. See #21973 for more info.
📌  Using Docker Desktop driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.50 ...
💾  Downloading Kubernetes v1.35.1 preload ...
    > preloaded-images-k8s-v18-v1...:  243.95 MiB / 243.95 MiB  100.00% 4.02 Mi
    > gcr.io/k8s-minikube/kicbase...:  483.40 MiB / 483.40 MiB  100.00% 2.84 Mi
🔥  Creating docker container (CPUs=2, Memory=4600MB) ...
🐳  Preparing Kubernetes v1.35.1 on Docker 29.2.1 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

`kubectl get nodes`
```
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   31s   v1.35.1
```

`kubectl get pods -A`
```
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-7d764666f9-xn94k           1/1     Running   0               4m46s
kube-system   etcd-minikube                      1/1     Running   0               4m52s
kube-system   kube-apiserver-minikube            1/1     Running   0               4m52s
kube-system   kube-controller-manager-minikube   1/1     Running   0               4m52s
kube-system   kube-proxy-wwjv7                   1/1     Running   0               4m46s
kube-system   kube-scheduler-minikube            1/1     Running   0               4m53s
kube-system   storage-provisioner                1/1     Running   1 (4m16s ago)   4m51s
```

## History
```
brew install kind
kind version
kind create cluster --name 09.kind-cluster
kubectl get nodes

brew install minikube
minikube version
minikube start --driver=docker
kubectl get nodes
```

Git Actions
```
vim .github/workflows/kind.yml
```


```
vim .github/workflows/minikube.yml
```

