# K8S Start

```
 1738  mkdir 10.K8S
 1739  cd 10.K8S/
 1741  sudo apt-get update
 1744  sudo apt-get update && sudo apt-get install -y apt-transport-https
 1745  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
 1746  sudo apt  install curl
 1747  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
 1748  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
 1749  sudo apt-get update
 1750  sudo apt-get install -y kubectl
 1751  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
 1753  sudo mkdir -p /usr/local/bin/
 1754  sudo install minikube /usr/local/bin/
 1766  minikube start --vm-driver=none
 1769  minikube status
 1770 history

minikube start --memory 6144 --cpus 4
minikube dashboard
minikube addons enable ingress
kubectl get pods -n ingress-nginx

NAME                                        READY   STATUS      RESTARTS   AGE
ingress-nginx-admission-create-c9tkv        0/1     Completed   0          5m32s
ingress-nginx-admission-patch-w744b         0/1     Completed   1          5m32s
ingress-nginx-controller-755dfbfc65-6zbmn   1/1     Running     0          5m32s

migel@migel:~/10.K8S$ minikube addons list
|-----------------------------|----------|--------------|--------------------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
|-----------------------------|----------|--------------|--------------------------------|
| ambassador                  | minikube | disabled     | 3rd party (Ambassador)         |
| auto-pause                  | minikube | disabled     | Google                         |
| csi-hostpath-driver         | minikube | disabled     | Kubernetes                     |
| dashboard                   | minikube | enabled ✅   | Kubernetes                     |
| default-storageclass        | minikube | enabled ✅   | Kubernetes                     |
| efk                         | minikube | disabled     | 3rd party (Elastic)            |
| freshpod                    | minikube | disabled     | Google                         |
| gcp-auth                    | minikube | disabled     | Google                         |
| gvisor                      | minikube | disabled     | Google                         |
| headlamp                    | minikube | disabled     | 3rd party (kinvolk.io)         |
| helm-tiller                 | minikube | disabled     | 3rd party (Helm)               |
| inaccel                     | minikube | disabled     | 3rd party (InAccel             |
|                             |          |              | [info@inaccel.com])            |
| ingress                     | minikube | enabled ✅   | Kubernetes                     |
| ingress-dns                 | minikube | disabled     | Google                         |
| istio                       | minikube | disabled     | 3rd party (Istio)              |
| istio-provisioner           | minikube | disabled     | 3rd party (Istio)              |
| kong                        | minikube | disabled     | 3rd party (Kong HQ)            |
| kubevirt                    | minikube | disabled     | 3rd party (KubeVirt)           |
| logviewer                   | minikube | disabled     | 3rd party (unknown)            |
| metallb                     | minikube | disabled     | 3rd party (MetalLB)            |
| metrics-server              | minikube | disabled     | Kubernetes                     |
| nvidia-driver-installer     | minikube | disabled     | Google                         |
| nvidia-gpu-device-plugin    | minikube | disabled     | 3rd party (Nvidia)             |
| olm                         | minikube | disabled     | 3rd party (Operator Framework) |
| pod-security-policy         | minikube | disabled     | 3rd party (unknown)            |
| portainer                   | minikube | disabled     | 3rd party (Portainer.io)       |
| registry                    | minikube | disabled     | Google                         |
| registry-aliases            | minikube | disabled     | 3rd party (unknown)            |
| registry-creds              | minikube | disabled     | 3rd party (UPMC Enterprises)   |
| storage-provisioner         | minikube | enabled ✅   | Google                         |
| storage-provisioner-gluster | minikube | disabled     | 3rd party (Gluster)            |
| volumesnapshots             | minikube | disabled     | Kubernetes                     |
|-----------------------------|----------|--------------|--------------------------------


git clone git@github.com:kubernetes-sigs/kubespray.git
Клонирование в «kubespray»...
remote: Enumerating objects: 63438, done.
remote: Counting objects: 100% (230/230), done.
remote: Compressing objects: 100% (187/187), done.
remote: Total 63438 (delta 66), reused 149 (delta 30), pack-reused 63208
Получение объектов: 100% (63438/63438), 18.70 МиБ | 8.97 МиБ/с, готово.
Определение изменений: 100% (35683/35683), готово.

cd kubespray/
cp -rfp inventory/sample inventory/migel

declare -a IPS=(192.168.203.31 192.168.203.32)

sudo apt install python3-pip

migel@migel:~/10.K8S/kubespray$ sudo pip3 install ruamel.yaml
Collecting ruamel.yaml
  Downloading ruamel.yaml-0.17.21-py3-none-any.whl (109 kB)
     |████████████████████████████████| 109 kB 1.9 MB/s 
Collecting ruamel.yaml.clib>=0.2.6; platform_python_implementation == "CPython" and python_version < "3.11"
  Downloading ruamel.yaml.clib-0.2.6-cp38-cp38-manylinux1_x86_64.whl (570 kB)
     |████████████████████████████████| 570 kB 1.3 MB/s 
Installing collected packages: ruamel.yaml.clib, ruamel.yaml
Successfully installed ruamel.yaml-0.17.21 ruamel.yaml.clib-0.2.6

migel@migel:~/10.K8S/kubespray$ CONFIG_FILE=inventory/migel/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

migel@migel:~/10.K8S/kubespray$ nano inventory/migel/hosts.yaml

migel@migel:~/10.K8S/kubespray$ nano req.txt
migel@migel:~/10.K8S/kubespray$ sudo pip3 install -r req.txt



migel@migel:~/10.K8S/kubespray$ ansible-playbook -i inventory/migel/hosts.yaml -b cluster.yml --ask-pass
SSH password: 


PLAY RECAP ********************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
node1                      : ok=772  changed=145  unreachable=0    failed=0    skipped=1256 rescued=0    ignored=9   
node2                      : ok=501  changed=92   unreachable=0    failed=0    skipped=734  rescued=0    ignored=2   

Чацвер 18 жніўня 2022  20:12:46 +0300 (0:00:00.078)       0:35:07.021 ********* 
=============================================================================== 
download : download_file | Validate mirrors --------------------------------------- 70.38s
kubernetes/preinstall : Install packages requirements ----------------------------- 70.03s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ------------ 45.08s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ----------------------- 33.82s
download : download_container | Download image if required ------------------------ 31.77s
kubernetes/kubeadm : Join to cluster ---------------------------------------------- 28.94s
download : download_container | Download image if required ------------------------ 28.61s
kubernetes/control-plane : kubeadm | Initialize first master ---------------------- 26.86s
network_plugin/calico : Calico | Create calico manifests -------------------------- 26.79s
download : download_container | Download image if required ------------------------ 25.45s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 23.29s
download : download_file | Download item ------------------------------------------ 20.59s
download : download_container | Download image if required ------------------------ 19.35s
download : download_container | Download image if required ------------------------ 19.24s
download : download_container | Download image if required ------------------------ 19.07s
download : download_container | Download image if required ------------------------ 18.96s
download : download_container | Download image if required ------------------------ 18.78s
download : download_container | Download image if required ------------------------ 18.75s
container-engine/containerd : download_file | Download item ----------------------- 17.11s
network_plugin/calico : Start Calico resources ------------------------------------ 16.98s
```
