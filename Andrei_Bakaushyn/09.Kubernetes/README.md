# HA1: KinD Kubernetes Cluster Setup
```bash
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker ${USER}
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
skefil@skefil:~$ kind --version
kind version 0.22.0-alpha+c4cadcab1a64d0
skefil@skefil:~$ docker --version
Docker version 24.0.5, build 24.0.5-0ubuntu1~22.04.1
skefil@skefil:~$ kubectl version --client
Client Version: v1.28.6
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
skefil@skefil:~$ kubectl get nodes
NAME                 STATUS   ROLES           AGE     VERSION
kind-control-plane   Ready    control-plane   2d17h   v1.29.1
skefil@skefil:~$ kind create cluster
ERROR: failed to create cluster: node(s) already exist for a                                                                           cluster with the name "kind"
skefil@skefil:~$ kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:412                                                                          51
CoreDNS is running at https://127.0.0.1:41251/api/v1/namespa                                                                          ces/kube-system/services/kube-dns:dns/proxy
To further debug and diagnose cluster problems, use 'kubectl                                                                           cluster-info dump'.
skefil@skefil:~$
```

# HA2: Minikube Kubernetes Cluster Setup
```bash
skefil@skefil-Swift-SF314-43:~$ minikube start
😄  minikube v1.31.2 на Ubuntu 22.04
✨  Используется драйвер docker на основе существующего профиля
👍  Запускается control plane узел minikube в кластере minikube
🚜  Скачивается базовый образ ...
🔄  Перезагружается существующий docker container для "minikube" ...
🐳  Подготавливается Kubernetes v1.27.4 на Docker 24.0.4 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Компоненты Kubernetes проверяются ...
    ▪ Используется образ docker.io/kubernetesui/dashboard:v2.7.0
    ▪ Используется образ docker.io/kubernetesui/metrics-scraper:v1.0.8
    ▪ Используется образ gcr.io/k8s-minikube/storage-provisioner:v5
💡  Some dashboard features require the metrics-server addon. To enable all features please run:
	minikube addons enable metrics-server	
🌟  Включенные дополнения: default-storageclass, storage-provisioner, dashboard
🏄  Готово! kubectl настроен для использования кластера "minikube" и "default" пространства имён по умолчанию
skefil@skefil-Swift-SF314-43:~$ kubectl get nodes
NAME       STATUS   ROLES           AGE    VERSION
minikube   Ready    control-plane   152d   v1.27.4
skefil@skefil-Swift-SF314-43:~$ minikube stop
✋  Узел "minikube" останавливается ...
🛑  Выключается "minikube" через SSH ...
🛑  Остановлено узлов: 1.
```

# HA3: GitHub Actions for KinD Cluster Setup
```yaml
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

# HA4: GitHub Actions for Minikube Cluster Setup
```yaml
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
