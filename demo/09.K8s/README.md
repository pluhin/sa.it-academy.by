## 09.K8s

```
 473  cd 09.K8s/
  474  ls
  475  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  476  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  477  ls -l /usr/local/bin/minikube
  478  minikube --help
  479  minikube start --help
  480  minikube start
  481  minikube kubectl -- get pods -A
  482  kubectl -- get pods -A
  483  minikube kubectl -- get svc -A
  484  minikube addons list
  485  minikube enable dashboard
  486  minikube addon enable dashboard
  487  minikube addons enable dashboard
  488  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  489  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  490  ls
  491  rm kubectl
  492  kubectl
  493  kubectl get pods
  494  kubectl get pods -A
  495  kubectl proxy --address='0.0.0.0' --disable-filter=true &
```

```bash
ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#

```bash
  496  minikube kubectl -- get svc -A
  497  minikube stop
  498  ps aux | grep proxy
  499  kill -9 144415
  500  sudo kill -9 144415
  501  ps aux | grep proxy
  502  sudo kill -9 155459
  503  ps aux | grep proxy
  504  minikube stop
  505  minikube delete
  506  git clone git@github.com:kubernetes-sigs/kubespray.git
  507  cd kubespray/
  508  ls
  509  sudo pip3 -U -r requirements.txt
  510  pip3
  511  pip3 -U -r requirements.txt
  512  sudo pip3 -r requirements.txt
  513  sudo pip3 install -U -r requirements.txt
  514  declare -a IPS=(192.168.202.25 192.168.202.26)
  515  cp -rfp inventory/sample/ inventory/plu
  516  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  517  sudo pip3 install ruamel_yaml
  518  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  519  vim inventory/plu/hosts.yaml
  520  ansible-playbook -i inventory/plu/hosts.yaml -u root cluster.yml --ask-pass
  521  history
  522  declare -a IPS=(192.168.208.25 192.168.208.26)
  523  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  524  vim inventory/plu/hosts.yaml
  525  ansible-playbook -i inventory/plu/hosts.yaml -u root cluster.yml --ask-pass
  526  history
  ```


user@sa2-demo:~/09.K8s/kubespray$ cat inventory/plu/hosts.yaml

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

Final output:
```
PLAY RECAP ***********************************************************************************************
node1                      : ok=657  changed=143  unreachable=0    failed=0    skipped=1094 rescued=0    ignored=6
node2                      : ok=421  changed=86   unreachable=0    failed=0    skipped=644  rescued=0    ignored=1

Monday 14 October 2024  19:04:33 +0000 (0:00:00.130)       0:18:04.042 ********
===============================================================================
kubernetes/control-plane : Kubeadm | Initialize first control plane node ------------------------ 119.52s
kubernetes/preinstall : Install packages requirements -------------------------------------------- 78.60s
download : Download_file | Download item --------------------------------------------------------- 53.76s
download : Download_file | Download item --------------------------------------------------------- 37.94s
download : Download_file | Download item --------------------------------------------------------- 34.45s
download : Download_container | Download image if required --------------------------------------- 32.47s
download : Download_container | Download image if required --------------------------------------- 28.65s
download : Download_file | Download item --------------------------------------------------------- 26.56s
container-engine/containerd : Download_file | Download item -------------------------------------- 25.52s
download : Download_container | Download image if required --------------------------------------- 25.12s
download : Download_file | Download item --------------------------------------------------------- 22.31s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.20s
download : Download_container | Download image if required --------------------------------------- 20.73s
download : Download_container | Download image if required --------------------------------------- 20.21s
download : Download_container | Download image if required --------------------------------------- 18.19s
download : Download_container | Download image if required --------------------------------------- 17.15s
bootstrap-os : Update Apt cache ------------------------------------------------------------------ 17.07s
download : Download_file | Download item --------------------------------------------------------- 16.46s
download : Download_container | Download image if required --------------------------------------- 16.27s
container-engine/crictl : Download_file | Download item ------------------------------------------ 16.25s
user@sa2-demo:~/09.K8s/kubespray$
```