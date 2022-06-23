# Kubernetes
## Minikube

### Command deploy minikube
#### kubectl
```bash
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client
```
#### minikube/enable dashboard/enable ingress/run minikube diff options
```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  && chmod +x minikube

sudo mv minikube /usr/local/bin

minikube start --vm-driver=virtualbox

minikube status


minikube addons enable dashboard

minikube addons enable ingress

minikube addons list

kubectl proxy --address='0.0.0.0' --disable-filter=true


minikube stop

minikube delete

minikube start --cpus='2' --memory='2g'
```

#### minikube enable drivers
[Url image](https://drive.google.com/file/d/11-OoiBavgeK7nlqVv6a2pqQVDNmsLcPw/view?usp=sharing)

#### Dashboard
[URL Image](https://drive.google.com/file/d/1qbDUSivWgTFjKK6DOleXmf_-vrJKCwoL/view?usp=sharing)

#### k8s in IT-ACADEMY environment
```bash
PLAY RECAP **********************************************************************************************************************************************************************$
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=80   changed=10   unreachable=1    failed=0    skipped=81   rescued=0    ignored=0
node2                      : ok=61   changed=10   unreachable=1    failed=0    skipped=73   rescued=0    ignored=0

Monday 23 May 2022  07:32:01 +0000 (0:00:30.319)       0:05:43.223 ************
===============================================================================
kubernetes/preinstall : Remove search/domain/nameserver options after block -----------------------------------------------------------------------------------------------------$
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -------------------------------------------------------$
kubernetes/preinstall : Create kubernetes directories ---------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : Remove search/domain/nameserver options before block ----------------------------------------------------------------------------------------------------$
bootstrap-os : Update Apt cache -------------------------------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : Create cni directories ----------------------------------------------------------------------------------------------------------------------------------$
Gather necessary facts (hardware) -----------------------------------------------------------------------------------------------------------------------------------------------$
Gather minimal facts ------------------------------------------------------------------------------------------------------------------------------------------------------------$
Gather necessary facts (network) ------------------------------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : set is_fedora_coreos ------------------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : Remove swapfile from /etc/fstab -------------------------------------------------------------------------------------------------------------------------$
bootstrap-os : Install dbus for the hostname module -----------------------------------------------------------------------------------------------------------------------------$
bootstrap-os : Gather host facts to get ansible_os_family -----------------------------------------------------------------------------------------------------------------------$
adduser : User | Create User ----------------------------------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : check status of /etc/resolv.conf ------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : check if booted with ostree -----------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : Create kubernetes kubeadm compat cert dir (kubernetes/kubeadm issue 1498) -------------------------------------------------------------------------------$
kubernetes/preinstall : Check if kubernetes kubeadm compat cert dir exists ------------------------------------------------------------------------------------------------------$
adduser : User | Create User Group ----------------------------------------------------------------------------------------------------------------------------------------------$
kubernetes/preinstall : get content of /etc/resolv.conf -------------------------------------------------------------------------------------------------------------------------$
```
