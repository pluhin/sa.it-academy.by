# Homework 1

## Установка

```
sudo snap install kubectl --classic
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

## Создание кластера

```
kind create cluster --config=config.yaml
```

## config.yaml

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.28.0
```

## Проверка

```
admin@Ubuntu:~/09.Kubernetes$ kubectl get nodes
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   47s   v1.28.0
```

# Homework 2

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
minikube start --vm-driver=docker
```

```
😄  minikube v1.36.0 on Ubuntu 25.04 (vbox/amd64)
✨  Using the docker driver based on user configuration
📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.47 ...
💾  Downloading Kubernetes v1.33.1 preload ...
    > preloaded-images-k8s-v18-v1...:  347.04 MiB / 347.04 MiB  100.00% 17.16 M
    > gcr.io/k8s-minikube/kicbase...:  502.26 MiB / 502.26 MiB  100.00% 20.01 M
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.33.1 on Docker 28.1.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

```
admin@Ubuntu:~/09.Kubernetes$ kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-674b8bbfcf-qgrnz           1/1     Running   0             41s
kube-system   etcd-minikube                      1/1     Running   0             48s
kube-system   kube-apiserver-minikube            1/1     Running   0             48s
kube-system   kube-controller-manager-minikube   1/1     Running   0             46s
kube-system   kube-proxy-kgcsl                   1/1     Running   0             41s
kube-system   kube-scheduler-minikube            1/1     Running   0             48s
kube-system   storage-provisioner                1/1     Running   1 (20s ago)   45s
```



# Homework 3

## .github/workflows/kind.yaml

```
name: Create cluster using KinD
on:
  push:
    branches:
      - kind
jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.11.1"
      - name: Testing
        run: |
          kubectl cluster-info
          kubectl get pods -n kube-system
          echo "current-context:" $(kubectl config current-context)
          echo "environment-kubeconfig:" ${KUBECONFIG}
```


# Homework 4

## .github/workflows/minikube.yaml

```
name: "Create cluster using minikube"
on:
    - pull_request
jobs:
  minikube:
    runs-on: ubuntu-latest
    name: set up minikube
    steps:
    - uses: actions/checkout@v2
    - name: Start minikube
      uses: medyagh/setup-minikube@master
    - name: Try the cluster !
      run: kubectl get pods -A
```



























