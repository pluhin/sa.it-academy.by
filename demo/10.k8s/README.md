## Minikube

Local: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default

Remote (with vagrantfile): http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/cronjob?namespace=default

```bash
 2072  git pull
 2073  clear
 2074  cd demo
 2075  ls
 2076  mkdir 10.k8s
 2077  cd 10.k8s
 2078  mkdir minikube
 2079  cd minikube
 2080  minikube --help
 2081  minikube help
 2082  minikube start --help
 2091  minikube start
 2092  minikube addons list
 2093  minikube status
 2094  minikube stop
 2095  minikube delete
 2096  ls -l ~/.kube/config
 2097  mv ~/.kube/config ~/.kube/config.bk
 2098  minikube start
 2099  ping 192.168.99.104
 2100  sudo vim /etc/vbox/networks.conf
 2101  history| grep networ
 2102  history| grep vagr
 2103  clear
 2104  grep -rn "192.168." /etc
 2105  grep -rn "192" /etc
 2106  minikube start --help
 2107  minikube stop
 2108  minikube delete
 2109  minikube start --driver=docker
 2110  minikube status
 2111  kubectl --version
 2112  kubectl version
 2113  kubectl get nodes
 2114  vim ~/.kube/config
 2115  minikube addons list
 2116  minikube addons dashboard enable
 2117  minikube addons enable dashboard
 2118  kubectl get services
 2119  kubectl proxy --address='0.0.0.0' --disable-filter=true  &
 2120  minikube stop
 2121  ps aux | grep "kubectl proxy"
 2122  kill 72021
 2123  ps aux | grep "kubectl proxy"
 2124  minikube stop
 2125  minikube delete
 2126  vim Vagrantfile
 2127  vagrant up
 2128  vagrant halt && vagrant destroy -f
 2129  vagrant up
 2130  vagrant halt && vagrant destroy -f
 2131  cd ../
 2132  vagrant init bento/ubuntu-20.04
 2133  vagrant up
 2134  vagrant ssh
```

## Deployment k8s in IT-ACADEMY
```bash
    1  sudo apt install git vim mc python3-pip wget curl
    2  sudo apt update
    3  sudo apt install git vim mc python3-pip wget curl
    4  git clone https://github.com/kubernetes-sigs/kubespray.git
    5  cd kubespray/
    6  sudo pip3 install -r requirements.txt
    7  cp -rfp inventory/sample inventory/plu
    8  declare -a IPS=(192.168.203.23 192.168.203.24)
    9  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
   10  vim inventory/plu/hosts.yaml
   11  ssh-keygen
   12  ssh-copy-id jump_sa@178.124.206.53
   13  vim inventory/plu/group_vars/all/all.yml
   14  ansible-playbook -i inventory/plu/hosts.yaml  -b -u root cluster.yml --ask-pass
   15  sudo apt install sshpass
   16  ansible-playbook -i inventory/plu/hosts.yaml  -b -u root cluster.yml --ask-pass
   17  history
```

Inventory file

```yaml
vagrant@vagrant:~/kubespray$ cat inventory/plu/hosts.yaml
all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
  hosts:
    node1:
      ansible_host: 192.168.203.23
      ip: 192.168.203.23
      access_ip: 192.168.203.23
    node2:
      ansible_host: 192.168.203.24
      ip: 192.168.203.24
      access_ip: 192.168.203.24
  children:
    kube_control_plane:
      hosts:
        node1:
    kube_node:
      hosts:
        node1:
        node2:
    etcd:
      hosts:
        node1:
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
```

## Final stage of deployment k8s


```
PLAY RECAP ****************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=705  changed=147  unreachable=0    failed=0    skipped=1175 rescued=0    ignored=3
node2                      : ok=480  changed=96   unreachable=0    failed=0    skipped=663  rescued=0    ignored=1

Thursday 10 February 2022  20:33:18 +0000 (0:00:00.044)       1:59:46.722 *****
===============================================================================
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ------------------------------------------------------- 176.03s
kubernetes/preinstall : Create kubernetes directories ------------------------------------------------------------------------ 157.59s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ------------------------------------------------------------------ 124.50s
kubernetes/preinstall : Remove search/domain/nameserver options after block -------------------------------------------------- 121.98s
kubernetes/preinstall : Remove search/domain/nameserver options before block ------------------------------------------------- 118.13s
network_plugin/calico : Calico | Create calico manifests --------------------------------------------------------------------- 108.48s
kubernetes/preinstall : Install packages requirements ------------------------------------------------------------------------ 103.54s
kubernetes/preinstall : Ensure kube-bench parameters are set ------------------------------------------------------------------ 83.60s
container-engine/containerd : containerd | Remove orphaned binary ------------------------------------------------------------- 83.16s
kubernetes/preinstall : Create cni directories -------------------------------------------------------------------------------- 80.11s
policy_controller/calico : Create calico-kube-controllers manifests ----------------------------------------------------------- 71.86s
download : download_container | Download image if required -------------------------------------------------------------------- 61.69s
kubernetes/preinstall : Get current calico cluster version -------------------------------------------------------------------- 61.48s
container-engine/containerd : containerd | Ensure containerd directories exist ------------------------------------------------ 61.12s
kubernetes/preinstall : Clean previously used sysctl file locations ----------------------------------------------------------- 59.11s
network_plugin/calico : Start Calico resources -------------------------------------------------------------------------------- 57.29s
kubernetes/preinstall : Remove swapfile from /etc/fstab ----------------------------------------------------------------------- 57.18s
kubernetes/preinstall : Hosts | Update (if necessary) hosts file -------------------------------------------------------------- 54.07s
kubernetes/preinstall : Configure dhclient hooks for resolv.conf (non-RH) ----------------------------------------------------- 51.94s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ----- 51.83s
```