## Homework Assignment 0: Finish full install k8s
```bash
  184  mkdir 09.K8s
  185  cd 09.K8s
  186  git clone https://github.com/kubernetes-sigs/kubespray.git
  187  cd kubespray/
  188  sudo pip install -U -r requirements.txt
  189  ls
  190  sudo apt install python3-ansible
  191  sudo apt install python3-cryptography
  192  sudo apt install python3-jmespath
  193  sudo apt install python3-netaddr
  194  cp -rfp inventory/sample/ inventory/myclaster
  195  nano inventory/myclaster/inventory.ini
  196  ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml -u root --ask-pass
  197  nano inventory/myclaster/inventory.ini
```
  
## Homework Assignment 1: KinD Kubernetes Cluster Setup
```bash
  199  for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
  200  sudo apt update
  201  sudo apt upgrade -y
  202  sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release git wget
  203  sudo install -m 0755 -d /etc/apt/keyrings
  204  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  205  sudo chmod a+r /etc/apt/keyrings/docker.asc
  206  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  207  sudo apt update
  208  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  209  sudo systemctl status docker
  210  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  211  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  212  kubectl version --client --output=yaml
  213  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
  214  chmod +x ./kind
  215  sudo mv ./kind /usr/local/bin/kind
  217  sudo kind create cluster --name first-cluster
  218  sudo kubectl get nodes
```
  
## Homework Assignment 2: Minikube Kubernetes Cluster Setup
```bash
  219  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  220  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  221  minikube start
  222  sudo kubectl get po -A
  223  sudo kubectl get nodes
```
