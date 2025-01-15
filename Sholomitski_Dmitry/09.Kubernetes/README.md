# 09.Kubernetes

### Homework Assignment 0: Finish full install k8s

Clohe repository

```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
```

inventory file

```ini
# This inventory describe a HA typology with stacked etcd (== same nodes as control plane)
# and 3 worker nodes
# See https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
# for tips on building your # inventory

# Configure 'ip' variable to bind kubernetes services on a different ip than the default iface
# We should set etcd_member_name for etcd cluster. The node that are not etcd members do not need to set the value,
# or can set the empty string value.
#[kube_control_plane]
# node1 ansible_host=95.54.0.12  # ip=10.3.0.1 etcd_member_name=etcd1
# node2 ansible_host=95.54.0.13  # ip=10.3.0.2 etcd_member_name=etcd2
# node3 ansible_host=95.54.0.14  # ip=10.3.0.3 etcd_member_name=etcd3

#[etcd:children]
#kube_control_plane

#[kube_node]
# node4 ansible_host=95.54.0.15  # ip=10.3.0.4
# node5 ansible_host=95.54.0.16  # ip=10.3.0.5
# node6 ansible_host=95.54.0.17  # ip=10.3.0.6



node1 ansible_host=192.168.208.19  ip=192.168.208.19 etcd_member_name=etcd1
node2 ansible_host=192.168.208.20  ip=192.168.208.20

[kube_control_plane]
node1

[etcd:children]
kube_control_plane

[kube_node]
node1
node2
```

Bash command to install

```bash
ansible-playbook -i inventory/my/inventory.ini cluster.yml -u root --ask-pass
```

Result of instalation

```bash
Monday 13 January 2025  16:58:26 +0000 (0:00:00.030)       0:18:41.510 ********
===============================================================================
kubernetes/preinstall : Install packages requirements ----------------------------------------------------------------------------------- 67.66s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 36.72s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 35.99s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 29.14s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 25.47s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 24.20s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 23.57s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) --------------- 23.09s
container-engine/crictl : Download_file | Download item --------------------------------------------------------------------------------- 20.82s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 20.52s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 20.48s
container-engine/containerd : Download_file | Download item ----------------------------------------------------------------------------- 20.21s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 19.52s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.76s
container-engine/runc : Download_file | Download item ----------------------------------------------------------------------------------- 18.69s
container-engine/nerdctl : Download_file | Download item -------------------------------------------------------------------------------- 18.33s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.18s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.12s
network_plugin/calico : Calico | Create calico manifests -------------------------------------------------------------------------------- 16.81s
bootstrap-os : Update Apt cache --------------------------------------------------------------------------------------------------------- 16.62s
```

### Homework Assignment 1: KinD Kubernetes Cluster Setup on local VM

Docker installed like in [Docker](../07.Docker/)

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

Create cluster

```bash
sudo kind create cluster --name myclaster
Creating cluster "myclaster" ...
 ✓ Ensuring node image (kindest/node:v1.32.0) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-myclaster"
You can now use your cluster with:

kubectl cluster-info --context kind-myclaster

Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/

sudo kind get clusters
myclaster
```

Install kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
kubectl: OK
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

sudo kubectl cluster-info --context kind-myclaster
Kubernetes control plane is running at https://127.0.0.1:45049
CoreDNS is running at https://127.0.0.1:45049/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

root@Webserver21:/# kubectl config get-clusters
NAME
kind-myclaster
```

#### Time to install w/o Kubectl - 3-4 minutes

### Homework Assignment 2: Minikube Kubernetes Cluster Setup

Docker installed like in [Docker](../07.Docker/)

I selected ARM64  because I use MakBook on M1 CPU and Vitrtual Box with ARM Ubuntu

```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-arm64
sudo install minikube-linux-arm64 /usr/local/bin/minikube && rm minikube-linux-arm64

sudo minikube start
[sudo] password for xaos:
😄  minikube v1.34.0 on Ubuntu 24.04 (arm64)
✨  Automatically selected the docker driver. Other choices: none, ssh
🛑  The "docker" driver should not be used with root privileges. If you wish to continue as root, use --force.
💡  If you are running minikube within a VM, consider using --driver=none:
📘    https://minikube.sigs.k8s.io/docs/reference/drivers/none/

❌  Exiting due to DRV_AS_ROOT: The "docker" driver should not be used with root privileges.

xaos@Webserver22:~$ sudo minikube start --force
😄  minikube v1.34.0 on Ubuntu 24.04 (arm64)
❗  minikube skips various validations when --force is supplied; this may lead to unexpected behavior
✨  Automatically selected the docker driver. Other choices: none, ssh
🛑  The "docker" driver should not be used with root privileges. If you wish to continue as root, use --force.
💡  If you are running minikube within a VM, consider using --driver=none:
📘    https://minikube.sigs.k8s.io/docs/reference/drivers/none/

🧯  The requested memory allocation of 1954MiB does not leave room for system overhead (total system memory: 1954MiB). You may face stability issues.
💡  Suggestion: Start minikube with less memory allocated: 'minikube start --memory=1954mb'

📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.45 ...
💾  Downloading Kubernetes v1.31.0 preload ...
    > preloaded-images-k8s-v18-v1...:  307.61 MiB / 307.61 MiB  100.00% 5.70 Mi
    > gcr.io/k8s-minikube/kicbase...:  441.45 MiB / 441.45 MiB  100.00% 5.03 Mi
🔥  Creating docker container (CPUs=2, Memory=1954MB) ...
🐳  Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

sudo minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

xaos@Webserver22:~$ sudo kubectl cluster-info --context minikube
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

### Homework Assignment 3: GitHub Actions for KinD Cluster Setup

with yaml

```yaml
name: Create Cluster

on: push

jobs:
  create-cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Kubernetes KinD Cluster
        uses: container-tools/kind-action@v1
        with:
          cluster_name: cluster
      - name: Testing
        run: |
          kubectl cluster-info --context kind-cluster
          kubectl version
          kubectl get pods -n kube-system
          kubectl get nodes
```

Answer of gitactions

```bash
Run kubectl cluster-info --context kind-cluster
Kubernetes control plane is running at https://127.0.0.1:44919
CoreDNS is running at https://127.0.0.1:44919/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
Client Version: version.Info{Major:"1", Minor:"21", GitVersion:"v1.21.1", GitCommit:"5e58841cce77d4bc13713ad2b91fa0d961e69192", GitTreeState:"clean", BuildDate:"2021-05-12T14:18:45Z", GoVersion:"go1.16.4", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"21", GitVersion:"v1.21.1", GitCommit:"5e58841cce77d4bc13713ad2b91fa0d961e69192", GitTreeState:"clean", BuildDate:"2021-05-21T23:01:33Z", GoVersion:"go1.16.4", Compiler:"gc", Platform:"linux/amd64"}
NAME                                            READY   STATUS    RESTARTS   AGE
coredns-558bd4d5db-hj5vt                        0/1     Pending   0          11s
coredns-558bd4d5db-rcq7t                        0/1     Pending   0          11s
etcd-cluster-control-plane                      1/1     Running   0          26s
kindnet-9hf7s                                   1/1     Running   0          11s
kube-apiserver-cluster-control-plane            1/1     Running   0          26s
kube-controller-manager-cluster-control-plane   1/1     Running   0          20s
kube-proxy-l48jg                                1/1     Running   0          11s
kube-scheduler-cluster-control-plane            1/1     Running   0          20s
NAME                    STATUS   ROLES                  AGE   VERSION
cluster-control-plane   Ready    control-plane,master   28s   v1.21.1
```

Run time - 62 seconds

### Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

with yaml

```yaml
name: Setup Minikube Cluster

on:
  push

jobs:
  setup-minikube:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Set up Docker
      uses: docker/setup-buildx-action@v3

    - name: Install Minikube
      run: |
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/>
        sudo chmod +x minikube
        sudo mv minikube /usr/local/bin/

    - name: Install kubectl
      run: |
        curl -LO https://storage.googleapis.com/kubernetes-release/release/>
        chmod +x ./kubectl
        sudo mv ./kubectl /usr/local/bin/

    - name: Start Minikube
      run: |
        minikube start --driver=docker --insecure-registry="localhost:5000"

    - name: Wait for Minikube to be ready
      run: |
        kubectl wait --for=condition=Ready pod --all --namespace=kube-syste>

    - name: Run tests
      run: |
          kubectl cluster-info --context minikube
          kubectl version
          kubectl get pods -n minikube
          kubectl get nodes
```

Answer of gitactions

```bash
Run kubectl cluster-info --context minikube
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
WARNING: This version information is deprecated and will be replaced with the output from kubectl version --short.  Use --output=yaml|json to get the full version.
WARNING: version difference between client (1.24) and server (1.31) exceeds the supported minor version skew of +/-1
Client Version: version.Info{Major:"1", Minor:"24", GitVersion:"v1.24.0", GitCommit:"4ce5a8954017644c5420bae81d72b09b735c21f0", GitTreeState:"clean", BuildDate:"2022-05-03T13:46:05Z", GoVersion:"go1.18.1", Compiler:"gc", Platform:"linux/amd64"}
Kustomize Version: v4.5.4
Server Version: version.Info{Major:"1", Minor:"31", GitVersion:"v1.31.0", GitCommit:"9edcffcde5595e8a5b1a35f88c421764e575afce", GitTreeState:"clean", BuildDate:"2024-08-13T07:28:49Z", GoVersion:"go1.22.5", Compiler:"gc", Platform:"linux/amd64"}
No resources found in minikube namespace.
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   15s   v1.31.0
```

Run time - 57 seconds

[Link to GitHub](https://github.com/xaos613/test_kuber)
