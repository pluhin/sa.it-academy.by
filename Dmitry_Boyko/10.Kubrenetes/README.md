# 10.Kubernetes

### History commands deployment minikube

```bash
 1  sudo apt-get update
 2  sudo apt-get install ca-certificates curl gnupg lsb-release conntrack iptables arptables ebtables -y
 3  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 4  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 5  apt-get update
 6  apt-get install docker-ce docker-ce-cli containerd.io -y
 7  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
 8  mkdir -p /usr/local/bin/
 9  install minikube /usr/local/bin/
10  sudo usermod -aG docker vagrant && newgrp docker
11  minikube start --driver=docker
12  minikube addons list 
13  minikube addons enable dashboard 
14  minikube addons enable ingress 
15  minikube kubectl -- get pods -A
16  kubectl cluster-info
17  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"   
18  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
19  kubectl cluster-info
20  kubectl proxy --address='0.0.0.0' --disable-filter=true
21  minikube kubectl proxy -- --address='0.0.0.0' --disable-filter=true
22  minikube start --help | grep -E 'cpu|memory'
```


### minikube start --help | grep -E 'cpu|memory'

```bash
      --cpus='2': Number of CPUs allocated to Kubernetes. Use "max" to use the maximum number of CPUs.
      --memory='': Amount of RAM to allocate to Kubernetes (format: <number>[<unit>], where unit = b, k, m or g). Use "max" to use the maximum amount of memory.

 Example: minikube start --cpus='2' --memory='2g'
```

### IT-Academy k8s deployment final stage

```yaml
Saturday 12 February 2022  20:24:37 +0300 (0:00:00.073)       0:51:03.169 *****
===============================================================================
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------- 85.06s
kubernetes/preinstall : Install packages requirements ---------------------------------------------------------- 80.67s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------- 59.56s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------- 50.66s
download : download_container | Download image if required ----------------------------------------------------- 44.29s
download : download_container | Download image if required ----------------------------------------------------- 44.21s
download : download_container | Download image if required ----------------------------------------------------- 40.80s

download : download_container | Download image if required ----------------------------------------------------- 39.08s
kubernetes/control-plane : kubeadm | Initialize first master --------------------------------------------------- 37.42s
policy_controller/calico : Create calico-kube-controllers manifests -------------------------------------------- 34.16s
download : download_container | Download image if required ----------------------------------------------------- 32.70s
network_plugin/calico : Start Calico resources ----------------------------------------------------------------- 29.15s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 26.14s
container-engine/containerd : download_file | Download item ---------------------------------------------------- 25.80s
kubernetes/preinstall : Create kubernetes directories ---------------------------------------------------------- 24.96s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down nodelocaldns Template ------------------------------------- 24.04s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts ------------------------------------- 23.60s
download : download_file | Download item ----------------------------------------------------------------------- 23.31s
download : download_container | Download image if required ----------------------------------------------------- 22.59s
download : download_container | Download image if required ----------------------------------------------------- 21.78s
``` 
