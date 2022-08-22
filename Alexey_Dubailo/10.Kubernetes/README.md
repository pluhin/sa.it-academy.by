  # 10.K8s Instalation
  
  ## Install Minikube, check cluster, enable dashboard, inrgess, change ram\cpu
  ```bash
  110  sudo apt install apt-transport-https
  112  wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  113  chmod +x minikube-linux-amd64
  114  sudo mv minikube-linux-amd64 /usr/local/bin/minikube
  115  minikube version
  119  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  120  chmod +x ./kubectl
  121  sudo mv ./kubectl /usr/local/bin/kubectl
  122  kubectl version -o json  --client
  123  minikube start
  124  kubectl cluster-info
  125  kubectl config view
  127  kubectl get nodes
  128  minikube ssh
  129  minikube stop
  130  minikube addons list
  131  minikube dashboard
  133  minikube start
  136  minikube addons enable ingress
  137  minikube addons list
  139  minikube status
  145  minikube stop
  146  minikube delete
  147  minikube start --memory 4096 --cpus
  ```

  ## Dashboard screenshot
  ![Dashboard!](https://github.com/AlexeyAsgard/myfirstrepo/blob/main/10.Kubernetes/Screenshot.png)
  
  ## K8s Ansible playbook deploy results
  ```bash
  LAY RECAP ************************************************************************************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
node1                      : ok=772  changed=145  unreachable=0    failed=0    skipped=1256 rescued=0    ignored=9   
node2                      : ok=501  changed=92   unreachable=0    failed=0    skipped=734  rescued=0    ignored=2   

Пятница 19 августа 2022  17:18:12 +0300 (0:00:00.072)       0:41:06.356 ******* 
=============================================================================== 
kubernetes/preinstall : Install packages requirements --------------------------------------------------------------------------------------------------------------------------------------------- 73.59s
download : download_file | Validate mirrors ------------------------------------------------------------------------------------------------------------------------------------------------------- 73.00s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ---------------------------------------------------------------------------------------------------------------------------- 59.91s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources --------------------------------------------------------------------------------------------------------------------------------------- 43.05s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------------------------------------------------------------------------ 34.82s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 32.15s
kubernetes/control-plane : kubeadm | Initialize first master -------------------------------------------------------------------------------------------------------------------------------------- 29.28s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 28.98s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 25.71s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ------------------------------------------------------------------------- 24.05s
kubernetes/kubeadm : Join to cluster -------------------------------------------------------------------------------------------------------------------------------------------------------------- 23.31s
container-engine/containerd : download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------- 23.02s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 21.81s
download : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------------- 20.59s
network_plugin/calico : Start Calico resources ---------------------------------------------------------------------------------------------------------------------------------------------------- 20.44s
download : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------------- 20.18s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 19.57s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 19.10s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 18.55s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------------- 18.55s

  ```
