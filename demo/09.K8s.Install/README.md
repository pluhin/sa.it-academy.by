```bash
 460  mkdir 09.K8s.Install
  461  ls
  462  cd 09.K8s.Install/
  463  ls
  464  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  465  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  466  minikube --help
  467  minikube start
  468  minikube kubectl -- get pods -A
  469  minikube addons list
  470  minikube addons enable dashboard
  471  minikube addons enable metrics-server
  472  minikube addons list
  473  minikube kubectl -- get ns -A
  474  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true
  475  ps aux | grep kubectl
  476  minikube stop
  477  minikube delete
  478  git clone git@github.com:kubernetes-sigs/kubespray.git
  479  cd kubespray/
  480  ls
  481  cat requirements.txt
  482  sudo pip3 install -U -r requirements.txt
  483  sudo pip install -U -r requirements.txt
  484  cat /etc/os-release
  485  sudo apt update
  486  sudo apt install -y software-properties-common
  487  sudo add-apt-repository -y ppa:deadsnakes/ppa
  488  sudo apt update
  489  sudo apt install -y python3.11 python3.11-venv
  490  python3.11 -m venv .venv
  491  source .venv/bin/activate
  492  python -m pip install -U pip setuptools wheel
  493  cp -rfp inventory/sample inventory/plu
  494  vim inventory/plu/inventory.ini
  495  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  496  history
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#


```
 ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```




## Final install

```
PLAY RECAP *****************************************************************************************************
node1                      : ok=637  changed=140  unreachable=0    failed=0    skipped=834  rescued=0    ignored=4
node2                      : ok=431  changed=89   unreachable=0    failed=0    skipped=471  rescued=0    ignored=0

Monday 16 February 2026  18:05:41 +0000 (0:00:00.081)       0:23:02.346 *******
===============================================================================
download : Download_file | Download item -------------------------------------------------------------- 144.69s
download : Download_file | Download item -------------------------------------------------------------- 114.63s
container-engine/containerd : Download_file | Download item -------------------------------------------- 79.30s
container-engine/crictl : Download_file | Download item ------------------------------------------------ 71.75s
system_packages : Manage packages ---------------------------------------------------------------------- 61.55s
container-engine/runc : Download_file | Download item -------------------------------------------------- 58.29s
download : Download_container | Download image if required --------------------------------------------- 51.46s
container-engine/nerdctl : Download_file | Download item ----------------------------------------------- 34.82s
download : Download_container | Download image if required --------------------------------------------- 31.69s
download : Download_container | Download image if required --------------------------------------------- 30.88s
download : Download_container | Download image if required --------------------------------------------- 30.80s
download : Download_file | Download item --------------------------------------------------------------- 29.09s
download : Download_file | Download item --------------------------------------------------------------- 29.08s
download : Download_container | Download image if required --------------------------------------------- 28.18s
download : Download_container | Download image if required --------------------------------------------- 26.55s
download : Download_container | Download image if required --------------------------------------------- 26.07s
download : Download_container | Download image if required --------------------------------------------- 25.16s
download : Download_container | Download image if required --------------------------------------------- 24.18s
download : Download_file | Download item --------------------------------------------------------------- 23.15s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.02s

```