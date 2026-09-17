# 10.Kubernetes
## 📁 Repository Directory Structure

```text
10.Kubernetes/
├── .github/
│   └── workflows/
│       ├── kind.yml          # Assignment 3
│       └── minikube.yml      # Assignment 4 
├── kind/
│   ├── inventory.ini         # For KinD
│   ├── playbook.yml          # Local automated KinD environment setup
│── inventory.ini             # For K8s 
└── README.md
```

# Homework Assignment 0: Finish full install k8s
```
ansible-playbook -i inventory/sample/inventory.ini cluster.yml -u student -b
```
```
PLAY RECAP *****************************************************************************
node1                      : ok=640  changed=143  unreachable=0    failed=0    skipped=832  rescued=0    ignored=4
node2                      : ok=437  changed=92   unreachable=0    failed=0    skipped=469  rescued=0    ignored=0


TASKS RECAP ****************************************************************************
Tuesday 15 September 2026  16:27:13 +0000 (0:00:00.087)       0:23:47.661 *****
===============================================================================
download : Download_container | Download image if required --------------------- 39.78s
kubernetes/preinstall : Read current sysctl values for floor-managed keys ------ 30.03s
kubernetes/preinstall : Increase sysctl value if lower than configured minimum -- 26.69s
download : Download_file | Download item --------------------------------------- 23.86s
network_plugin/calico : Calico | Create calico manifests ----------------------- 22.91s
system_packages : Manage packages ---------------------------------------------- 22.49s
download : Download_container | Download image if required --------------------- 20.50s
download : Download_file | Download item --------------------------------------- 19.23s
kubernetes-apps/ansible : Kubernetes Apps | CoreDNS ---------------------------- 18.97s
download : Download_container | Download image if required --------------------- 16.36s
download : Download_file | Download item --------------------------------------- 15.78s
container-engine/containerd : Download_file | Download item -------------------- 15.33s
download : Download_container | Download image if required --------------------- 15.31s
download : Download_container | Download image if required --------------------- 15.04s
policy_controller/calico : Create calico-kube-controllers manifests ------------ 14.63s
kubernetes/node : Modprobe Kernel Module for IPVS ------------------------------ 14.24s
download : Download_container | Download image if required --------------------- 13.81s
download : Download_container | Download image if required --------------------- 12.93s
container-engine/crictl : Extract_file | Unpacking archive --------------------- 11.38s
container-engine/crictl : Download_file | Download item ------------------------ 10.99s
```
---


## 🛠️ Homework Assignment 1: KinD Kubernetes Cluster Setup
Set up Kind using Ansible. Use playbook.yml.
```
kind$ ansible-playbook -i inventory.ini playbook.yml

PLAY [Assignment 1: Инсталляция Docker, kubectl, KinD и запуск кластера] *******************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
[WARNING]: Host 'node' is using the discovered Python interpreter at '/usr/bin/python3.11', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [node]

TASK [Обновление кэша пакетов APT] *********************************************************************************************************************
ok: [node]

TASK [Установка системных зависимостей] ****************************************************************************************************************
ok: [node]

TASK [Установка Docker] ********************************************************************************************************************************
ok: [node]

TASK [Загрузка и установка kubectl] ********************************************************************************************************************
ok: [node]

TASK [Загрузка и установка KinD] ***********************************************************************************************************************
ok: [node]

TASK [Запуск KinD кластера (от имени обычного пользователя)] **********************************************************************
ok: [node]

TASK [Проверка нод кластера KinD] *************************************************************************************************
changed: [node]

TASK [Вывод информации о нодах] ***************************************************************************************************
ok: [node] => {
    "kubectl_nodes.stdout_lines": [
        "NAME                               STATUS     ROLES           AGE   VERSION",
        "it-academy-cluster-control-plane   NotReady   control-plane   6s    v1.37.0"
    ]
}

PLAY RECAP ************************************************************************************************************************
node                       : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

### Playing with KinD
```
student@k3s-4:~$ kubectl get nodes
NAME                         STATUS   ROLES           AGE     VERSION
test-cluster-control-plane   Ready    control-plane   4m14s   v1.37.0


student@k3s-4:~$ kubectl version
Client Version: v1.37.0
Kustomize Version: v5.8.1
Server Version: v1.37.0

student@k3s-4:~$ kind --version
kind version 0.33.0


student@k3s-4:~$ kind create cluster --name test-cluster
Creating cluster "test-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.37.0) 🖼️
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-test-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-test-cluster

Have a question, bug, or feature request? Let us know! https://kind.sigs.k8s.io                                                                

student@k3s-4:~$ kubectl cluster-info --context kind-test-cluster
Kubernetes control plane is running at https://127.0.0.1:38933
CoreDNS is running at https://127.0.0.1:38933/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy


student@k3s-4:~$ kind get clusters
it-academy-cluster
test-cluster

student@k3s-4:~$ kind delete cluster --name  test-cluster
Deleting cluster "test-cluster" ...
Deleted nodes: ["test-cluster-control-plane"]
```
---

## Homework Assignment 2: Minikube Kubernetes Cluster Setup

```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
ls -l /usr/local/bin/minikube
```
### Creating a minikube cluster

 ```
$minikube start
* minikube v1.39.0 on Ubuntu 26.04 (vbox/amd64)
* Automatically selected the docker driver. Other choices: none, ssh

X The requested memory allocation of 3072MiB does not leave room for system overhead (total system memory: 3398MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=3072mb'

* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.51 ...
* Downloading Kubernetes v1.37.0 preload ...
    > gcr.io/k8s-minikube/kicbase:  507.60 MiB / 507.61 MiB  100.00% 1.77 MiB p
    > preloaded-images-k8s-v18-v1...:  347.58 MiB / 347.58 MiB  100.00% 964.20
* Creating docker container (CPUs=2, Memory=3072MB) ...
* Preparing Kubernetes v1.37.0 on containerd 2.3.4 ...
* Configuring CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

### Checking cluster status
```
$minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
### Playing with minikibe
```
$ minikube addons list
$ minikube addons enable metrics-server
$ minikube kubectl -- get pods -A
NAMESPACE              NAME                                         READY   STA                                                                         TUS    RESTARTS   AGE
kube-system            coredns-559f6c778d-94wgv                     1/1     Run                                                                         ning   0          17m
kube-system            etcd-minikube                                1/1     Run                                                                         ning   0          17m
kube-system            kindnet-25t75                                1/1     Run                                                                         ning   0          17m
kube-system            kube-apiserver-minikube                      1/1     Run                                                                         ning   0          17m
kube-system            kube-controller-manager-minikube             1/1     Run                                                                         ning   0          17m
kube-system            kube-proxy-z7qjt                             1/1     Run                                                                         ning   0          17m
kube-system            kube-scheduler-minikube                      1/1     Run                                                                         ning   0          17m
kube-system            metrics-server-768f9f6999-5bjnf              0/1     Run                                                                         ning   0          30s
kube-system            storage-provisioner                          1/1     Run                                                                         ning   0          17m
kubernetes-dashboard   dashboard-metrics-scraper-69cbd87b98-8dfhs   1/1     Run                                                                         ning   0          10m
kubernetes-dashboard   kubernetes-dashboard-6df74558bd-b4k5k        1/1     Run                                                                         ning   0          10m
```
---
## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

[https://github.com/maksimsolapai-gif/K8s.10/actions/runs/35112916181/job/104850944794]

```
NAME                               STATUS   ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                       KERNEL-VERSION              CONTAINER-RUNTIME
it-academy-cluster-control-plane   Ready    control-plane   21s   v1.37.0   172.18.0.2    <none>        Debian GNU/Linux 13 (trixie)   6.17.0-1022-azure (amd64)   containerd://2.3.4
```
---
## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
[https://github.com/maksimsolapai-gif/K8s.10/actions/runs/35112916329/job/104850945581]
```

minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured


NAME       STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION      CONTAINER-RUNTIME
minikube   Ready    control-plane   26s   v1.31.0   192.168.49.2   <none>        Debian GNU/Linux 12 (bookworm)   6.17.0-1022-azure   containerd://2.3.4
```
