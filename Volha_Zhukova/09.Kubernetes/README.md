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
``` bash
PLAY RECAP *************************************************************************************************************
node1                      : ok=639  changed=139  unreachable=0    failed=0    skipped=835  rescued=0    ignored=4
node2                      : ok=432  changed=89   unreachable=0    failed=0    skipped=472  rescued=0    ignored=0

Thursday 05 March 2026  10:44:34 +0300 (0:00:00.078)       0:15:56.505 ********
===============================================================================
system_packages : Manage packages ------------------------------------------------------------------------------ 63.49s
download : Download_container | Download image if required ----------------------------------------------------- 51.40s
download : Download_file | Download item ----------------------------------------------------------------------- 35.86s
download : Download_container | Download image if required ----------------------------------------------------- 31.94s
download : Download_container | Download image if required ----------------------------------------------------- 28.28s
download : Download_file | Download item ----------------------------------------------------------------------- 28.15s
download : Download_file | Download item ----------------------------------------------------------------------- 27.29s
container-engine/runc : Download_file | Download item ---------------------------------------------------------- 24.25s
container-engine/containerd : Download_file | Download item ---------------------------------------------------- 23.28s
download : Download_file | Download item ----------------------------------------------------------------------- 22.12s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.06s
download : Download_container | Download image if required ----------------------------------------------------- 20.25s
download : Download_container | Download image if required ----------------------------------------------------- 19.61s
download : Download_container | Download image if required ----------------------------------------------------- 18.84s
download : Download_container | Download image if required ----------------------------------------------------- 18.52s
container-engine/crictl : Download_file | Download item -------------------------------------------------------- 18.13s
download : Download_container | Download image if required ----------------------------------------------------- 17.46s
download : Download_container | Download image if required ----------------------------------------------------- 17.35s
download : Download_container | Download image if required ----------------------------------------------------- 17.06s
container-engine/nerdctl : Download_file | Download item ------------------------------------------------------- 16.89s
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
  251  minikube stop
```
