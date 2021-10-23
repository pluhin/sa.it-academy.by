## Minikube

Local: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default

Remote: http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/node?namespace=default

```bash
  952  cp ../10.Docker-compose/Vagrantfile ./
  953  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
  954  sudo install minikube-darwin-amd64 /usr/local/bin/minikube
  955  minikube start
  956  top
  957  cd git_repos/sa.it-academy.by/demo/11.K8s
  958  ls
  959  mv Vagrantfile minikube
  960  cd minikube
  961  vim Vagrantfile
  962* ifconfig
  963* minikube ssh
  964* minikube kubectl -- get po -A
  965  kubectl get pods
  966  kubectl get nodes
  967  ls
  968  vagrant up
  969* minikube addons list
  970* minikube addons dashboard enable
  971* minikube addons enable dashboard
  972* minikube addons enable metrics-server
  973* minikube addons list
  974* kubectl proxy --address='0.0.0.0' --disable-filter=true  &
  975* minikube stop
  976* minikube delete
  977* cd ../
  978* cd 10
  979* cd 10.Docker-compose
  980* cd ../11.K8s
  981* ls
  982* mkdir k8s_deployment
  983* cd k8s_deployment
  984* ps aux | grep proxy
  985* kill 11415
  986* kill -9 11415
  987* ps aux | grep proxy
  988* clear
  989  vagrant halt && vagrant destroy -f
  990* ssh root@192.168.202.22
  991* ssh root@192.168.202.22 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
```

## K8s full deployment

```bash
root@sa-ubuntu-22:~/kubespray# history
    1  clear
    2  git clone https://github.com/kubernetes-sigs/kubespray.git
    3  apt update
    4  apt install python3-pip
    5  cd kubespray/
    6  pip3 install -r requirements.txt
    7  cp -rfp inventory/sample inventory/plu
    8  declare -a IPS=(192.168.203.5 192.168.203.6)
    9  echo $IPS
    10  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
    11  vim inventory/plu/hosts.yaml
    12  ansible-playbook -i inventory/plu/hosts.yaml  -b -u root cluster.yml --ask-pass
    13  apt install sshpass
    14  ansible-playbook -i inventory/plu/hosts.yaml  -b -u root cluster.yml --ask-pass
    15  history
```

Result of deployment:

```bash
PLAY RECAP *****************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=588  changed=125  unreachable=0    failed=0    skipped=1148 rescued=0    ignored=2
node2                      : ok=369  changed=76   unreachable=0    failed=0    skipped=639  rescued=0    ignored=1

Monday 18 October 2021  18:14:54 +0000 (0:00:00.088)       0:32:41.614 ********
===============================================================================
download : download_container | Download image if required -------------------------------------------------------------------------------------------------------- 235.16s
kubernetes/preinstall : Install packages requirements ------------------------------------------------------------------------------------------------------------- 150.68s
download : download_file | Download item -------------------------------------------------------------------------------------------------------------------------- 115.93s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 82.37s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 81.21s
kubernetes/control-plane : kubeadm | Initialize first master ------------------------------------------------------------------------------------------------------- 68.47s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 64.67s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 62.51s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 62.35s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 61.87s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 61.14s
download : download_file | Download item --------------------------------------------------------------------------------------------------------------------------- 61.11s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 59.23s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 59.14s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 57.34s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 56.75s
container-engine/docker : ensure docker packages are installed ----------------------------------------------------------------------------------------------------- 54.54s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------- 53.26s
bootstrap-os : Update Apt cache ------------------------------------------------------------------------------------------------------------------------------------ 37.69s
download : download_file | Download item --------------------------------------------------------------------------------------------------------------------------- 33.54s
```