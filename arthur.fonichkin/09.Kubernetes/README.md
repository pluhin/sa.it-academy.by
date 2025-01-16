# 09.Kubernetes

## Task1

### Scripts:
```bash
  275  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
  276  chmod +x ./kind
  277  sudo mv ./kind /usr/local/bin/kind
  278  kind create cluster --name kind-cluster
  282  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  283  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  284  kubectl get nodes
  285  kubectl get nodes -A
  286  history
```

### Output:
```bash
miks@WIN-KBLDUJCBN93:~$ kubectl get nodes -A
NAME                         STATUS   ROLES           AGE    VERSION
kind-cluster-control-plane   Ready    control-plane   3m1s   v1.32.0
```


## Task2

### Script:
```bash
  288  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  289  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  290  minikube help
  291  clear
  292  minikube start
  293  minikube kubectl -- get po -A
  294  minikube addons enable dashboard
  295  minikube addons enable metrics-server
  296  minikube kubectl -- get po -A
  297  history
```

### Output:
```bash
miks@WIN-KBLDUJCBN93:~$ minikube kubectl -- get po -A
NAMESPACE              NAME                                        READY   STATUS              RESTARTS      AGE
kube-system            coredns-6f6b679f8f-cqhlm                    1/1     Running             0             59s
kube-system            etcd-minikube                               1/1     Running             0             64s
kube-system            kube-apiserver-minikube                     1/1     Running             0             64s
kube-system            kube-controller-manager-minikube            1/1     Running             0             64s
kube-system            kube-proxy-nhvwh                            1/1     Running             0             59s
kube-system            kube-scheduler-minikube                     1/1     Running             0             64s
kube-system            metrics-server-84c5f94fbc-bcskk             0/1     ContainerCreating   0             4s
kube-system            storage-provisioner                         1/1     Running             1 (56s ago)   62s
kubernetes-dashboard   dashboard-metrics-scraper-c5db448b4-fgjxd   0/1     ContainerCreating   0             15s
kubernetes-dashboard   kubernetes-dashboard-695b96c756-x5d2c       1/1     Running             0             15s
miks@WIN-KBLDUJCBN93:~$
```


## Task3   

#### Start time: 24 seconds

### Deployment.yml:
```yaml
name: Setup KinD Cluster

on:
  workflow_dispatch:
    inputs:
      button_name:
        description: 'Setup KinD'

jobs:
  setup-kind:
    runs-on: ubuntu-latest

    steps:
      - name: Install KinD
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind

      - name: Create KinD cluster
        run: |
          start=$(date +%s)
          kind create cluster --name kind-cluster
          end=$(date +%s)
          proccess_time=$((end - start))
          echo "KinD setup time: $proccess_time seconds"
          sleep 100

      - name: Check cluster
        run: kubectl cluster-info --context kind-kind-cluster

      - name: Get nodes
        run: kubectl get nodes

      - name: Get Kubernetes version
        run: kubectl version
```

### Output.step.Create KinD cluster:
```bash
Creating cluster "kind-cluster" ...
 • Ensuring node image (kindest/node:v1.27.3) 🖼  ...
 ✓ Ensuring node image (kindest/node:v1.27.3) 🖼
 • Preparing nodes 📦   ...
 ✓ Preparing nodes 📦 
 • Writing configuration 📜  ...
 ✓ Writing configuration 📜
 • Starting control-plane 🕹️  ...
 ✓ Starting control-plane 🕹️
 • Installing CNI 🔌  ...
 ✓ Installing CNI 🔌
 • Installing StorageClass 💾  ...
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind-cluster"
You can now use your cluster with:
kubectl cluster-info --context kind-kind-cluster
Thanks for using kind! 😊
KinD setup time: 24 seconds
```

### Output.step.Get nodes:
```bash
NAME                         STATUS   ROLES           AGE    VERSION
kind-cluster-control-plane   Ready    control-plane   105s   v1.27.3
```

## Task4

#### Start time: 34 seconds

### Deployment.yml:
```yaml
name: Setup Minikube Cluster

on:
  workflow_dispatch:
    inputs:
      button_name:
        description: 'Setup Minikube'

jobs:
  setup-kind:
    runs-on: ubuntu-latest

    steps:
      - name: Install Minikube
        run: |
          curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
          sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

      - name: Create Minikube cluster
        run: |
          start=$(date +%s)
          minikube start
          end=$(date +%s)
          proccess_time=$((end - start))
          echo "Minikube setup time: $proccess_time seconds"
          sleep 20

      - name: Get nodes
        run: minikube kubectl -- get po -A

      - name: Get Kubernetes version
        run: minikube kubectl version
```

### Output.step.Create Minikube cluster:
```bash
* minikube v1.34.0 on Ubuntu 24.04
* Automatically selected the docker driver. Other choices: podman, none, ssh
* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.45 ...
* Downloading Kubernetes v1.31.0 preload ...
* Creating docker container (CPUs=2, Memory=3900MB) ...
* Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
    > gcr.io/k8s-minikube/kicbase...:  1.61 KiB / 487.90 MiB [>_] 0.00% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  15.35 MiB / 487.90 MiB [>] 3.15% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  69.69 MiB / 487.90 MiB [] 14.28% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  120.00 MiB / 487.90 MiB  24.60% 200.05 M    > gcr.io/k8s-minikube/kicbase...:  163.74 MiB / 487.90 MiB  33.56% 200.05 M    > gcr.io/k8s-minikube/kicbase...:  219.06 MiB / 487.90 MiB  44.90% 200.05 M    > gcr.io/k8s-minikube/kicbase...:  271.81 MiB / 487.90 MiB  55.71% 203.47 M    > gcr.io/k8s-minikube/kicbase...:  319.56 MiB / 487.90 MiB  65.50% 203.47 M    > gcr.io/k8s-minikube/kicbase...:  374.83 MiB / 487.90 MiB  76.83% 203.47 M    > gcr.io/k8s-minikube/kicbase...:  435.44 MiB / 487.90 MiB  89.25% 207.92 M    > gcr.io/k8s-minikube/kicbase...:  487.89 MiB / 487.90 MiB  100.00% 245.96 
Minikube setup time: 34 seconds
```

### Output.step.Get nodes:
```bash
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-6f6b679f8f-5lx87           0/1     Running   0          21s
kube-system   etcd-minikube                      1/1     Running   0          27s
kube-system   kube-apiserver-minikube            1/1     Running   0          27s
kube-system   kube-controller-manager-minikube   1/1     Running   0          27s
kube-system   kube-proxy-x6wbn                   1/1     Running   0          21s
kube-system   kube-scheduler-minikube            1/1     Running   0          27s
kube-system   storage-provisioner                1/1     Running   0          26s
```