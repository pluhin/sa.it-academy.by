## K8s deployment

### minikube

http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/cronjob?namespace=default

```bash
4217  clear
 4218  minikube
 4219  minikube start
 4220  cd Documents/git_repos
 4221  cd git_repos
 4222  cd sa.it-academy.by/demo/
 4223  git pull
 4224  mkdir 10.k8s
 4225  ls
 4226  cd 10.k8s
 4227  vim Vagrantfile
 4228  vagrant up && vagrant ssh
 4229  vagrant ssh
 4230  vagrant halt && vagrant destroy -f
 4231  vagrant up
 4232  vagrant halt && vagrant destroy -f
```

### Full k8s

#### History

```bash
 426  cd 10.K8s/
  427  ls
  428  git clone git@github.com:kubernetes-sigs/kubespray.git
  429  git clone https://github.com/kubernetes-sigs/kubespray.git
  430  cd kubespray/
  431  ls
  432  cp -rfp inventory/sample inventory/plu
  433  declare -a IPS=(192.168.203.35 192.168.203.36)
  434  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  435  sudo pip3 install ruamel
  436  sudo pip3 install ruamel.yaml
  437  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  438  vim inventory/plu/hosts.yaml
  439  ansible-playbook -i inventory/plu/hosts.yaml -b cluster.yml --ask-pass
  440  ansible --version
  441  vim req.txt
  442  sudo pip3 install -r req.txt
  443  ansible-playbook -i inventory/plu/hosts.yaml -b cluster.yml --ask-pass
  444  history
```

#### Ansible result

```bash
PLAY RECAP **************************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=772  changed=145  unreachable=0    failed=0    skipped=1259 rescued=0    ignored=9
node2                      : ok=501  changed=92   unreachable=0    failed=0    skipped=737  rescued=0    ignored=2

Wednesday 17 August 2022  19:01:38 +0000 (0:00:00.055)       1:37:37.007 ******
===============================================================================
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------------------------------- 198.90s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------------------------------- 134.81s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------------- 119.93s
download : download_file | Validate mirrors --------------------------------------------------------------------------------------------- 97.66s
kubernetes/preinstall : Install packages requirements ----------------------------------------------------------------------------------- 78.16s
network_plugin/calico : Start Calico resources ------------------------------------------------------------------------------------------ 61.77s
kubernetes/preinstall : Ensure kube-bench parameters are set ---------------------------------------------------------------------------- 60.62s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts -------------------------------------------------------------- 56.59s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down nodelocaldns Template -------------------------------------------------------------- 54.21s
container-engine/containerd : containerd | Remove orphaned binary ----------------------------------------------------------------------- 53.16s
kubernetes/preinstall : Create kubernetes directories ----------------------------------------------------------------------------------- 49.36s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts -------------------------------------------------------------- 48.87s
kubernetes/preinstall : Remove search/domain/nameserver options after block ------------------------------------------------------------- 44.13s
kubernetes/control-plane : Update server field in component kubeconfigs ----------------------------------------------------------------- 44.07s
kubernetes/node : Modprobe Kernel Module for IPVS --------------------------------------------------------------------------------------- 40.28s
kubernetes/preinstall : Remove search/domain/nameserver options after block ------------------------------------------------------------- 40.24s
kubernetes/preinstall : Remove search/domain/nameserver options before block ------------------------------------------------------------ 40.01s
kubernetes/preinstall : Remove search/domain/nameserver options before block ------------------------------------------------------------ 39.22s
container-engine/containerd : containerd | Ensure containerd directories exist ---------------------------------------------------------- 38.23s
etcd : Check certs | Register ca and etcd node certs on kubernetes hosts ---------------------------------------------------------------- 36.81s

```

##### Inventory file

```yaml
all:
  vars:
    ansible_user: root
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
  hosts:
    node1:
      ansible_host: 192.168.203.XX
      ip: 192.168.203.XX
      access_ip: 192.168.203.XX
    node2:
      ansible_host: 192.168.203.YY
      ip: 192.168.203.YY
      access_ip: 192.168.203.YY
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