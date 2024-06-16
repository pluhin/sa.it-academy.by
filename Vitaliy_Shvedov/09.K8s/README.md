## 09.Kubernetes

---

### KinD Kubernetes Cluster Setup

---

1. Install Docker and KinD on your local machine:

```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind --version
``` 
- Output:

```
kind version 0.20.0
```

2. Create a KinD cluster with a single control plane node:

```bash
sudo /home/vshvedov/kind create cluster
```

- Output:

```
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.27.3) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a nice day! 👋
```

3. Verify that the cluster is up and running using `kubectl`.

- Install kubectl:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl /usr/local/bin/kubect
kubectl version --client
```

- Output:

```
Client Version: v1.30.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
```

```bash
docker ps
```

- Output:

```
CONTAINER ID   IMAGE                  COMMAND                  CREATED       STATUS       PORTS                       NAMES
182bf6c14e3b   kindest/node:v1.27.3   "/usr/local/bin/entr…"   2 hours ago   Up 2 hours   127.0.0.1:37081->6443/tcp   kind-control-plane
```

```bash
sudo docker exec 182bf6c14e3b kubectl cluster-info
```

- Output:

```
Kubernetes control plane is running at https://kind-control-plane:6443
CoreDNS is running at https://kind-control-plane:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

---

### Minikube Kubernetes Cluster Setup

---

1. Install Minikube and a hypervisor (e.g., VirtualBox/Docker) on your local machine:

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

2. Start a Minikube cluster with a single node:

```bash
minikube start
```

- Output:

```
* minikube v1.33.1 on Ubuntu 22.04 (vbox/amd64)
* Automatically selected the docker driver. Other choices: none, ssh

X The requested memory allocation of 2200MiB does not leave room for system overhead (total system memory: 2404MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=2200mb'

* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.44 ...
* Downloading Kubernetes v1.30.0 preload ...
    > preloaded-images-k8s-v18-v1...:  342.90 MiB / 342.90 MiB  100.00% 6.22 Mi
    > gcr.io/k8s-minikube/kicbase...:  481.58 MiB / 481.58 MiB  100.00% 5.75 Mi



* Creating docker container (CPUs=2, Memory=2200MB) ...
* Preparing Kubernetes v1.30.0 on Docker 26.1.1 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

```bash
minikube status
```

- Output:

```
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

3. Confirm that the cluster is operational using `kubectl`:

```bash
kubectl get nodes
```

- Output:

```
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   2m38s   v1.30.0
```

---

### GitHub Actions for KinD Cluster Setup

---

1. Create a GitHub repository for your Kubernetes-related assignments:

[HW_09.K8s_GitHub-Actions](https://github.com/Patsa-Vatsa/HW_09.K8s_GitHub-Actions/actions)

2. Write a GitHub Actions workflow that sets up a KinD cluster.

3. Configure the workflow to run on every push to a specific branch.

4. Use a Docker container or GitHub-hosted runner for the workflow execution.

```yml
name: "Create cluster using KinD"
#on: [push]
on:
  workflow_dispatch:
jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository  
        uses: actions/checkout@master
      - name: Setup kind
        uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.11.1"
      - name: Testing
        run: |
          kubectl cluster-info 
          kubectl get pods -n kube-system 
          echo "current-context:" $(kubectl config current-context) 
          echo "environment-kubeconfig:" ${KUBECONFIG} 
          kubectl get nodes
          kubectl get pods -A
          kubectl version
        shell: bash
```

- Output:

```
Run kubectl cluster-info 
Kubernetes control plane is running at https://127.0.0.1:41447
CoreDNS is running at https://127.0.0.1:41447/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                                         READY   STATUS    RESTARTS   AGE
coredns-558bd4d5db-cv9bx                     0/1     Pending   0          13s
coredns-558bd4d5db-sclfh                     0/1     Pending   0          13s
etcd-kind-control-plane                      1/1     Running   0          22s
kindnet-9xqzm                                1/1     Running   0          13s
kube-apiserver-kind-control-plane            1/1     Running   0          22s
kube-controller-manager-kind-control-plane   1/1     Running   0          22s
kube-proxy-lmmpw                             1/1     Running   0          13s
kube-scheduler-kind-control-plane            1/1     Running   0          22s
current-context: kind-kind
environment-kubeconfig:
NAME                 STATUS   ROLES                  AGE   VERSION
kind-control-plane   Ready    control-plane,master   31s   v1.21.1
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-558bd4d5db-cv9bx                     0/1     Pending   0          13s
kube-system          coredns-558bd4d5db-sclfh                     0/1     Pending   0          13s
kube-system          etcd-kind-control-plane                      1/1     Running   0          22s
kube-system          kindnet-9xqzm                                1/1     Running   0          13s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          22s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          22s
kube-system          kube-proxy-lmmpw                             1/1     Running   0          13s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          22s
local-path-storage   local-path-provisioner-547f784dff-zxdmn      0/1     Pending   0          13s
WARNING: version difference between client (1.30) and server (1.21) exceeds the supported minor version skew of +/-1
Client Version: v1.30.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.21.1
```

---

### GitHub Actions for Minikube Cluster Setup

---

1. Enhance the existing GitHub repository with another Actions workflow:

[HW_09.K8s_GitHub-Actions](https://github.com/Patsa-Vatsa/HW_09.K8s_GitHub-Actions/actions)

2. This time, create a workflow that sets up a Minikube cluster.
3. Configure the workflow to run on pull requests to the repository.
4. Utilize appropriate GitHub Actions features to customize the workflow execution environment.

```yml
name: Create cluster using Minikube
on: [push]
jobs:
  minikube:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository  
        uses: actions/checkout@master
      - name: start minikube
        id: minikube
        uses: medyagh/setup-minikube@latest
      # now you can run kubectl to see the pods in the cluster
      - name: kubectl
        run: |
          kubectl cluster-info 
          kubectl get pods -n kube-system 
          echo "current-context:" $(kubectl config current-context) 
          echo "environment-kubeconfig:" ${KUBECONFIG} 
          kubectl get nodes
          kubectl get pods -A
          kubectl version
        shell: bash
```

- Output:

```
Run kubectl cluster-info 
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                               READY   STATUS    RESTARTS   AGE
coredns-7db6d8ff4d-69fsn           1/1     Running   0          27s
etcd-minikube                      1/1     Running   0          41s
kube-apiserver-minikube            1/1     Running   0          41s
kube-controller-manager-minikube   1/1     Running   0          42s
kube-proxy-g25hv                   1/1     Running   0          27s
kube-scheduler-minikube            1/1     Running   0          41s
storage-provisioner                1/1     Running   0          26s
current-context: minikube
environment-kubeconfig:
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   43s   v1.30.0
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-7db6d8ff4d-69fsn           1/1     Running   0          27s
kube-system   etcd-minikube                      1/1     Running   0          41s
kube-system   kube-apiserver-minikube            1/1     Running   0          41s
kube-system   kube-controller-manager-minikube   1/1     Running   0          42s
kube-system   kube-proxy-g25hv                   1/1     Running   0          27s
kube-system   kube-scheduler-minikube            1/1     Running   0          41s
kube-system   storage-provisioner                1/1     Running   0          26s
Client Version: v1.30.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.30.0
```