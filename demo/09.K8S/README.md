## History

```bash
  490  mkdir 09.K8s
  491  cd 09.K8s/
  492  ls
  493  free
  494  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  495  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  496  ls -l /usr/local/bin/minikube
  497  minikube --help
  498  minikube start --help
  499  minikube start
  500  minikube status
  501  minikube addon list
  502  minikube addons list
  503  minikube addons enable dashboard
  504  minikube addons enable metrics-server
  505  c
  506  kubectl
  507  minikube kubectl -- get pods -A
  508  minikube kubectl -- get svc -A
  509  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  510  ps aux
  511  ps aux | grep proxy
  512  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true &
```

## Minikube dashboard

http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default

```bash
  513  minikube kubectl -- get pods -A
  514  ps aux | grep proxy
  515  kill -9 138165
  516  ps aux | grep proxy
  517  minikube kubectl -- info-cluster
  518  minikube kubectl -- help
  519  minikube kubectl -- cluster-info
  520  minikube kubectl -- get nodes
  521  minikube kubectl -- cluster-info
  522  minikube kubectl -- get nodes
  523  ls
```

---

## Please finish the following part before next lesson

```bash
  524  git clone git@github.com:kubernetes-sigs/kubespray.git
  525  cd kubespray/
  526  ls
  527  cp -rfp inventory/sample inventory/plu
  528  ls -l inventory/plu/
  529  vim inventory/plu/group_vars/all/all.yml
  530  declare -a IPS=(192.168.208.XX 192.168.208.XX)
  531  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  532  sudo pip3 install -U -r requirements.txt
  533  minikube stop
  534  minikube delete
  535  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  536  sudo pip3 install -U -r requirements.txt
  537  sudo pip3 install ruamel
  538  sudo pip3 install ruamel_yaml
  539  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  540  vim inventory/plu/hosts.yaml
  541  history
  542  ansible-playbook -i inventory/plu/hosts.yaml -u root cluster.yml --ask-pass
```

## K8s deployment

`user@sa2-demo:~$ cat 09.K8s/kubespray/inventory/plu/hosts.yaml`

```yaml
all:
  hosts:
    node1:
      ansible_host: 192.168.208.XX
      ip: 192.168.208.XX
      access_ip: 192.168.208.XX
    node2:
      ansible_host: 192.168.208.YY
      ip: 192.168.208.YY
      access_ip: 192.168.208.YY
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

## In the end of deploy

```
PLAY RECAP ****************************************************************************************************************
node1                      : ok=652  changed=140  unreachable=0    failed=0    skipped=1124 rescued=0    ignored=6
node2                      : ok=418  changed=85   unreachable=0    failed=0    skipped=663  rescued=0    ignored=1

Thursday 13 June 2024  17:52:21 +0000 (0:00:00.144)       0:16:07.894 *********
===============================================================================
kubernetes/control-plane : Kubeadm | Initialize first master ------------------------------------------------------------------ 81.26s
kubernetes/preinstall : Install packages requirements ------------------------------------------------------------------------- 66.32s
download : Download_file | Download item -------------------------------------------------------------------------------------- 43.15s
download : Download_container | Download image if required -------------------------------------------------------------------- 32.36s
download : Download_container | Download image if required -------------------------------------------------------------------- 27.95s
container-engine/containerd : Download_file | Download item ------------------------------------------------------------------- 24.43s
download : Download_file | Download item -------------------------------------------------------------------------------------- 23.64s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ----- 21.10s
container-engine/crictl : Download_file | Download item ----------------------------------------------------------------------- 20.47s
download : Download_container | Download image if required -------------------------------------------------------------------- 20.39s
kubernetes/kubeadm : Join to cluster ------------------------------------------------------------------------------------------ 20.32s
download : Download_container | Download image if required -------------------------------------------------------------------- 20.08s
download : Download_container | Download image if required -------------------------------------------------------------------- 18.84s
download : Download_file | Download item -------------------------------------------------------------------------------------- 18.78s
container-engine/runc : Download_file | Download item ------------------------------------------------------------------------- 18.34s
download : Download_container | Download image if required -------------------------------------------------------------------- 18.31s
download : Download_file | Download item -------------------------------------------------------------------------------------- 17.76s
download : Download_container | Download image if required -------------------------------------------------------------------- 17.55s
container-engine/nerdctl : Download_file | Download item ---------------------------------------------------------------------- 17.00s
bootstrap-os : Update Apt cache ----------------------------------------------------------------------------------------------- 16.86s
user@sa2-demo:~/09.K8s/kubespray$
```
