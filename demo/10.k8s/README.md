
## Minikube

Remote (with vagrantfile): http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/cronjob?namespace=default

## History

```bash
355  mkdir k8s
  356  cd k8s/
  357  ls
  358  git clone https://github.com/kubernetes-sigs/kubespray.git
  359  cd kubespray/
  360  ls
  361  vim requirements.txt
  362  sudo pip3 install -r requirements.txt
  363  cp -rfp inventory/sample inventory/plu
  364  declare -a IPS=(192.168.203.57 192.168.203.58)
  365  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  366  vim inventory/plu/hosts.yaml
  367  cat inventory/plu/group_vars/all/all.yml
  368  vim ~/.ssh/config
  369  vim ../../ansible_ws/inventory.yaml
  370  vim inventory/plu/hosts.yaml
  371  ansible-playbook -i inventory/plu/hosts.yaml -b -u root cluster.yml --ask-pass
  372  history
```

## Inventory file

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

## K8s deploy result 

```
PLAY RECAP **************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=767  changed=149  unreachable=0    failed=0    skipped=1313 rescued=0    ignored=6
node2                      : ok=507  changed=94   unreachable=0    failed=0    skipped=771  rescued=0    ignored=2

Thursday 19 May 2022  18:46:41 +0000 (0:00:00.054)       1:46:33.989 **********
===============================================================================
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------------------------------- 196.85s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------------------------------- 132.71s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------------- 126.57s
download : download_file | Validate mirrors --------------------------------------------------------------------------------------------- 99.25s
policy_controller/calico : Create calico-kube-controllers manifests --------------------------------------------------------------------- 82.20s
kubernetes/preinstall : Install packages requirements ----------------------------------------------------------------------------------- 80.73s
network_plugin/calico : Start Calico resources ------------------------------------------------------------------------------------------ 65.95s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts -------------------------------------------------------------- 61.93s
kubernetes/preinstall : Ensure kube-bench parameters are set ---------------------------------------------------------------------------- 58.59s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down nodelocaldns Template -------------------------------------------------------------- 57.33s
kubernetes/control-plane : Update server field in component kubeconfigs ----------------------------------------------------------------- 55.75s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts -------------------------------------------------------------- 51.14s
kubernetes/node : Modprobe Kernel Module for IPVS --------------------------------------------------------------------------------------- 48.76s
container-engine/containerd : containerd | Remove orphaned binary ----------------------------------------------------------------------- 48.70s
kubernetes/preinstall : Create kubernetes directories ----------------------------------------------------------------------------------- 48.41s
download : download_file | Download item ------------------------------------------------------------------------------------------------ 47.10s
policy_controller/calico : Start of Calico kube controllers ----------------------------------------------------------------------------- 44.27s
kubernetes/control-plane : Pre-upgrade | Delete master manifests if etcd secrets changed ------------------------------------------------ 41.88s
kubernetes/preinstall : Remove search/domain/nameserver options before block ------------------------------------------------------------ 40.59s
kubernetes/preinstall : Remove search/domain/nameserver options after block ------------------------------------------------------------- 40.43s
vagrant@vagrant:~/k8s/kubespray$
```