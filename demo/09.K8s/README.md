```bash
  526  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  527  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  528  ls
  529  rm minikube-linux-amd64
  530  minikube start
  531  kubectl
  532  minikube status
  533  minikube addons list
  534  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  535  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  536  ls
  537  rm kubectl
  538  kubectl --version
  539  kubectl version
  540  kubectl
  541  kubectl get nodes
  542  minikube addons enable dashboard
  543  minikube addons enable metrics-server
  544  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  545  kubectl get pods -A
  546  ps aux
  547  ps aux | grep kubep
  548  ps aux | grep kube
  549  ps aux | grep "0.0.0.0"
  550  kill -9 9885
  551  ps aux | grep "0.0.0.0"
  552  minikube stop
  553  minikube delete
  554  mkdir 09.K8s
  555  cd 09.K8s/
  556  git clone git@github.com:kubernetes-sigs/kubespray.git
  557  cd kubespray/
  558  ls
  559  cp -rfp inventory/sample inventory/plu
  560  declare -a IPS=(192.168.203.19 192.168.203.20)
  561  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  562  sudo pip3 install ruamel
  563  sudo pip3 install ruamel.yaml==0.17.31
  564  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  565  vim inventory/plu/hosts.yaml
  566  vim inventory/plu/group_vars/all/all.yml
  567  ansible-playbook -i inventory/mycluster/hosts.yaml -u root cluster.yml --ask-pass
  568  sudo pip3 install ansible==7.6.0
  569  ansible-playbook -i inventory/mycluster/hosts.yaml -u root cluster.yml --ask-pass
  570  sudo pip3 install -r requirements.txt
  571  ansible-playbook -i inventory/mycluster/hosts.yaml -u root cluster.yml --ask-pass
  572  ansible-playbook -i inventory/plu/hosts.yaml -u root cluster.yml --ask-pass
  573  history

```

http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default


```yaml
all:
  hosts:
    node1:
      ansible_host: 192.168.203.19
      ip: 192.168.203.19
      access_ip: 192.168.203.19
    node2:
      ansible_host: 192.168.203.20
      ip: 192.168.203.20
      access_ip: 192.168.203.20
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