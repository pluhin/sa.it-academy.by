```bash
    1  vim /etc/ssh/sshd_config
    2  service ssh restart
    3  sudo apt update && apt upgrade
    4  apt update && apt upgrade
    5  for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
    6  for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done
    7  apt-get install ca-certificates curl
    8  install -m 0755 -d /etc/apt/keyrings
    9  curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
   10  chmod a+r /etc/apt/keyrings/docker.asc
   11  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   12  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   tee /etc/apt/sources.list.d/docker.list > /dev/null
   13  sudo apt-get update
   14  apt-get update
   15  clear
   16  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   17  systemctl status docker
   18  docker run hello-world
   19  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
   20  chmod +x ./kind
   21  sudo mv ./kind /usr/local/bin/
   22  mv ./kind /usr/local/bin/
   23  kind --version
   24  curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
   25  chmod +x ./kubectl
   26  mv ./kubectl /usr/local/bin/kubectl
   27  kubectl version --client
   28  kind --version
   29  cat << EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF

   30  cat kind-config.yaml 
   31  kind create cluster --name kind-cluster --config kind-config.yaml
   32  kubectl get nodes
   33  kubectl cluster-info 
   34  apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
   35  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   36  install minikube-linux-amd64 /usr/local/bin/minikube
   37  rm minikube-linux-amd64
   38  minikube version
   39  minikube start --driver=docker
   40  minikube start --driver=docker --force
   41  minikube start --driver=docker --force
   42  minikube status
   43  kubectl get nodes
   44  history >> history.txt
```