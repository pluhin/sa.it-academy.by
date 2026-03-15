# 09. Kubernetes
## 0. Install k8s
``` bash
   15  git clone https://github.com/kubernetes-sigs/kubespray.git
   16  cd kubespray
   17  python3 -m venv .venv
   18  apt install python3.11-venv
   19  python3 -m venv .venv
   20  source .venv/bin/activate
   21  python -m pip install -U pip setuptools wheel
   22  pip install -r requirements.txt
   23  cd home/09.Kubernetes/
   24  cd kubespray/
   25  cp -rfp inventory/sample inventory/myclaster
   26  nano inventory/myclaster/inventory.ini
   27  ansible-playbook -i inventory/myclaster/inventory.ini cluster.yml -u root --ask-pass
   28  deactivate
```
## 1. KinD Kubernetes Cluster Setup
```bash
  226  mkdir 09.Kubernetes
  227  cd 09.Kubernetes/
  228  curl -Lo ./kind https://kind.sigs.k8s.io
  229  curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
  233  sudo curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
  234  sudo chmod +x /usr/local/bin/kind
  235  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  236  install -m 0755 kubectl /usr/local/bin/kubectl
  237  sudo install -m 0755 kubectl /usr/local/bin/kubectl
  238  kind create cluster --name homework1
  239  sudo service docker start
  240  kind create cluster --name homework1
  241  kubectl cluster-info --context kind-homework1
  242  kubectl get nodes
  243  kubectl get pods -A
  244  kind delete cluster --name homework1
```
## 2. Minikube Kubernetes Cluster Setup
```bash
  245  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  246  install -m 0755 minikube-linux-amd64 /usr/local/bin/minikube
  247  sudo install -m 0755 minikube-linux-amd64 /usr/local/bin/minikube
  248  minikube start
  249  kubectl get nodes
  250  kubectl get pods -A
<<<<<<< HEAD
=======
  251  minikube stop
>>>>>>> 7d8936c (Cleanup)
```