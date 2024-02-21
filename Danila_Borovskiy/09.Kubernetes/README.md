## 08.Docker.Compose

---

### 1. KinD Kubernetes Cluster Setup

```bash
brew install kind
```

```bash
kind create cluster --config kind-config.yaml
```

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: my-cluster
nodes:
  - role: control-plane
```

```bash
kubectl cluster-info
```

```bash
Kubernetes control plane is running at https://127.0.0.1:62307
CoreDNS is running at https://127.0.0.1:62307/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

```bash
kind delete clusters --all
```

### 2. Minikube Kubernetes Cluster Setup

```bash
brew install minikube
```

```bash
minikube start --nodes=1
```

```bash
😄  minikube v1.32.0 на Darwin 13.4.1 (arm64)
✨  Automatically selected the docker driver
📌  Using Docker Desktop driver with root privileges
👍  Запускается control plane узел minikube в кластере minikube
🚜  Скачивается базовый образ ...
💾  Скачивается Kubernetes v1.28.3 ...
    > preloaded-images-k8s-v18-v1...:  341.16 MiB / 341.16 MiB  100.00% 12.51 M
    > gcr.io/k8s-minikube/kicbase...:  410.58 MiB / 410.58 MiB  100.00% 12.65 M
🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
🐳  Подготавливается Kubernetes v1.28.3 на Docker 24.0.7 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Компоненты Kubernetes проверяются ...
    ▪ Используется образ gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Включенные дополнения: storage-provisioner, default-storageclass
🏄  Готово! kubectl настроен для использования кластера "minikube" и "default" пространства имён по умолчанию
```

```bash
kubectl cluster-info
```

```bash
Kubernetes control plane is running at https://127.0.0.1:62975
CoreDNS is running at https://127.0.0.1:62975/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

## 3. GitHub Actions for KinD Cluster Setup

```yaml
name: Setup Kind

on:
  push:
    branches:
      - main

jobs:
  setup_kind_cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Setup Kind
        run: |
          curl -Lo kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
          chmod +x kind
          sudo mv kind /usr/local/bin/kind

      - name: Create Cluster
        run: kind create cluster

      - name: Get Info
        run: |
          kubectl cluster-info
          kubectl get nodes
```

```bash
Run kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:34627
CoreDNS is running at https://127.0.0.1:34627/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                 STATUS     ROLES                  AGE   VERSION
kind-control-plane   NotReady   control-plane,master   7s    v1.21.1
```

## 4. GitHub Actions for Minikube Cluster Setup

```yaml
name: Setup Minikube

on:
  push:
    branches:
      - main

jobs:
  setup_minikube_cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Install Minikube
        run: |
          curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

      - name: Start Cluster
        run: minikube start --driver=docker

      - name: Get Info
        run: |
          kubectl cluster-info
          kubectl get nodes
```

```bash
Run kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   7s    v1.28.3
```
