## History

```bash
  492  mkdir 10.K8s
  493  cd 10.K8s/
  494  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  495  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  496  ls -l /usr/local/bin/minikube
  497  minikube start --help
  498  minikube start
  499  minikube kubectl -- get pods -A
  500  minikube addons list
  501  minikube addons enable dashboard
  502  minikube addons enable metrics-server
  503  minikube kubectl -- get pods -A
  504  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true
  505  ps aux | grep 8001
  506  minikube stop
  507  minikube delete
  508  ls
  509  python3 --version
  510  git clone git@github.com:kubernetes-sigs/kubespray.git
  511  cd kubespray/
  512  ls
  513  cat requirements.txt
  514  ansible --version
  515  sudo apt install -y software-properties-common
  516  sudo add-apt-repository -y ppa:deadsnakes/ppa
  517  sudo apt update
  518  sudo apt install -y python3.11 python3.11-venv
  519  python3.11 -m venv .venv
  520  source .venv/bin/activate
  521  pip install -r requirements.txt
  522  cp -rfp inventory/sample inventory/plu
  523  vim inventory/plu/inventory.ini
  524  ansible
  525  ansible --version
  526  ansible -i inventory/plu/inventory.ini all -m ping -u student
  527  vim inventory/plu/inventory.ini
  528  ansible -i inventory/plu/inventory.ini all -m ping -u student
  529  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u student -b
  530  history
```
---

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#


```
 ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```

## Final deploy

```

PLAY RECAP *****************************************************************************************
node1                      : ok=639  changed=109  unreachable=0    failed=0    skipped=844  rescued=0    ignored=4
node2                      : ok=434  changed=64   unreachable=0    failed=0    skipped=480  rescued=0    ignored=0

Monday 14 September 2026  18:33:23 +0000 (0:00:00.108)       0:19:30.390 ******
===============================================================================
download : Download_container | Download image if required -------------------------------- 150.38s
download : Download_container | Download image if required -------------------------------- 133.64s
download : Download_container | Download image if required -------------------------------- 113.99s
download : Download_container | Download image if required -------------------------------- 108.69s
download : Download_container | Download image if required --------------------------------- 73.04s
download : Download_container | Download image if required --------------------------------- 64.11s
download : Download_container | Download image if required --------------------------------- 51.70s
download : Download_container | Download image if required --------------------------------- 32.94s
download : Download_container | Download image if required --------------------------------- 19.45s
download : Download_container | Download image if required --------------------------------- 16.13s
kubernetes/control-plane : Kubeadm | Initialize first control plane node (1st try) --------- 11.25s
download : Download_container | Download image if required --------------------------------- 10.58s
container-engine/crictl : Download_file | Download item ------------------------------------- 6.83s
container-engine/runc : Download_file | Download item --------------------------------------- 6.75s
container-engine/nerdctl : Download_file | Download item ------------------------------------ 6.62s
container-engine/containerd : Download_file | Download item --------------------------------- 6.61s
download : Download_file | Download item ---------------------------------------------------- 6.60s
etcdctl_etcdutl : Download_file | Download item --------------------------------------------- 6.29s
kubernetes/preinstall : Preinstall | wait for the apiserver to be running ------------------- 5.86s
kubernetes-apps/ansible : Kubernetes Apps | CoreDNS ----------------------------------------- 5.52s
(.venv) user@sa2-demo:~/10.K8s/kubespray$
```