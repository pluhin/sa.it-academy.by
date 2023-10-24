# 09.Kubernetes
## Homework Assignment 1: KinD Kubernetes Cluster Setup
``` bash
930  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64\n# For ARM64\n[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64\nchmod +x ./kind\nsudo mv ./kind /usr/local/bin/kind
931  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"\n\ncurl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"\n\necho "$(cat kubectl.sha256)  kubectl" | sha256sum --check\n\nsudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl\n\nkubectl version --client
935  sudo nano cluster-config.yaml
936  kind create cluster --config cluster-config.yaml
937  sudo nano cluster-config.yaml
938  kind create cluster --config cluster-config.yaml
939  kubectl get nodes

NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   74m   v1.27.3

kubectl get pods -A
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-5d78c9869d-lkcqc                     1/1     Running   0          79m
kube-system          coredns-5d78c9869d-ntlkr                     1/1     Running   0          79m
kube-system          etcd-kind-control-plane                      1/1     Running   0          79m
kube-system          kindnet-gvwtr                                1/1     Running   0          79m
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          79m
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          79m
kube-system          kube-proxy-m4c2l                             1/1     Running   0          79m
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          79m
local-path-storage   local-path-provisioner-6bc4bddd6b-q7sg7      1/1     Running   0          79m

```
## Homework Assignment 2: Minikube Kubernetes Cluster Setup
``` bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

➜  ~ minikube start
😄  minikube v1.31.2 on Ubuntu 20.04
✨  Automatically selected the docker driver. Other choices: virtualbox, none, ssh
📌  Using Docker driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.27.4 preload ...
    > preloaded-images-k8s-v18-v1...:  393.21 MiB / 393.21 MiB  100.00% 7.58 Mi
    > gcr.io/k8s-minikube/kicbase...:  447.62 MiB / 447.62 MiB  100.00% 5.42 Mi
🔥  Creating docker container (CPUs=2, Memory=8000MB) ...
🐳  Preparing Kubernetes v1.27.4 on Docker 24.0.4 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

➜  ~ kubectl get nodes                                                                    
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   9m18s   v1.27.4

➜  ~ kubectl get pods -A                                                                  
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-5d78c9869d-nqf8p           1/1     Running   1 (4m47s ago)   9m39s
kube-system   etcd-minikube                      1/1     Running   1 (4m52s ago)   9m54s
kube-system   kube-apiserver-minikube            1/1     Running   1 (4m42s ago)   9m52s
kube-system   kube-controller-manager-minikube   1/1     Running   1 (4m52s ago)   9m52s
kube-system   kube-proxy-8z9n9                   1/1     Running   1 (4m52s ago)   9m39s
kube-system   kube-scheduler-minikube            1/1     Running   1 (4m52s ago)   9m55s
kube-system   storage-provisioner                1/1     Running   3 (4m38s ago)   9m51s
➜  ~ 
minikube addons enable metrics-server
minikube addons enable dashboard

➜  ~ kubectl get pods -A
NAMESPACE              NAME                                         READY   STATUS    RESTARTS      AGE
kube-system            coredns-5d78c9869d-nqf8p                     1/1     Running   1 (14m ago)   19m
kube-system            etcd-minikube                                1/1     Running   1 (14m ago)   19m
kube-system            kube-apiserver-minikube                      1/1     Running   1 (14m ago)   19m
kube-system            kube-controller-manager-minikube             1/1     Running   1 (14m ago)   19m
kube-system            kube-proxy-8z9n9                             1/1     Running   1 (14m ago)   19m
kube-system            kube-scheduler-minikube                      1/1     Running   1 (14m ago)   19m
kube-system            metrics-server-7746886d4f-9rzqv              1/1     Running   0             7m
kube-system            storage-provisioner                          1/1     Running   3 (14m ago)   19m
kubernetes-dashboard   dashboard-metrics-scraper-5dd9cbfd69-5kddj   1/1     Running   0             7m17s
kubernetes-dashboard   kubernetes-dashboard-5c5cfc8747-zhslb        1/1     Running   0             7m17s

```
## Homework Assignment 3: GitHub Actions for KinD Cluster Setup
``` bash
Kubernetes control plane is running at https://127.0.0.1:39931
CoreDNS is running at https://127.0.0.1:39931/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.27.3
```
## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
``` bash
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.27.4
```