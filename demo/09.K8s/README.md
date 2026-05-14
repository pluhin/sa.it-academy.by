```bash
417  mkdir 09.K8s.Install
  418  cd 09.K8s.Install/
  419  ls
  420  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  421  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  422  minikube --help
  423  minikube start --help
  424  minikube start
  425  minikube kubectl -- get pods -A
  426  minikube addons lists
  427  minikube addons list
  428  minikube addons enable dashboard
  429  minikube addons enable metrics-server
  430  minikube kubectl -- get pods -A
  431  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true
  432  minikube stop
  433  minikube delete
  434  git clone git@github.com:kubernetes-sigs/kubespray.git
  435  cd kubespray/
  436  ls
  437  cat requirements.txt
  438  ansible --version
  439  sudo apt install -y software-properties-common
  440  sudo add-apt-repository -y ppa:deadsnakes/ppa
  441  sudo apt update
  442  sudo apt install -y python3.11 python3.11-venv
  443  python3.11 -m venv .venv
  444  source .venv/bin/activate
  445  python -m pip install -U pip setuptools wheel
  446  cp -rfp inventory/sample inventory/plu
  447  vim inventory/plu/inventory.ini
  448  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  449  pip install -U -r requirements.txt
  450  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  451  vim requirements.txt
  452  pip install -U -r requirements.txt
  453  ansible --version
  454  ansible-playbook --version
  455  .venv/bin/ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  456  .venv/bin/ansible-playbook -i inventory/plu/inventory.ini reset.yml -b -u root --ask-pass
  457  .venv/bin/ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  458  history
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#


```
 ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```




## Final install

```
PLAY RECAP *********************************************************************************************************************************************************************************************************************************************************************
node1                      : ok=639  changed=103  unreachable=0    failed=0    skipped=843  rescued=0    ignored=4
node2                      : ok=432  changed=58   unreachable=0    failed=0    skipped=478  rescued=0    ignored=0

Thursday 14 May 2026  19:06:49 +0000 (0:00:00.076)       0:14:00.329 **********
===============================================================================
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 62.59s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 44.27s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 41.38s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 36.26s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 33.13s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 32.77s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 30.27s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 29.12s
kubernetes/control-plane : Kubeadm | Initialize first control plane node (1st try) ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 29.08s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 29.02s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 27.90s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 23.72s
download : Download_container | Download image if required ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 23.66s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ---------------------------------------------------------------------------------------------------------------------------------------------- 18.91s
kubernetes/kubeadm : Join to cluster if needed ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 13.26s
Gather necessary facts (hardware) --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.90s
system_packages : Gather OS information --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.83s
etcd : Refresh Time Fact ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 9.75s
Gather necessary facts (network) ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.48s
Gather minimal facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.45s
(.venv) user@sa2-demo:~/09.K8s.Install/kubespray$

```