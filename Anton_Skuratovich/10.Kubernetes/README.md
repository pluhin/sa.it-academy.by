# Kubernetes
## Install minikube
----
### History
```powershell
  Id     Duration CommandLine
  --     -------- -----------
   1        0.008 cd D:\Projects\10.Kubernetes\
   2        0.312 choco install minikube
   3        0.030 Get-ExecutionPolicy
   4        0.014  Set-ExecutionPolicy AllSigned
   5       10.749 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol…
   6        0.521 choco -?
   7       36.284 choco install minikube
   8       49.054 minikube start --vm-driver=virtualbox

     Id     Duration CommandLine
  --     -------- -----------
   1        0.008 cd D:\Projects\10.Kubernetes\
   2     1:36.228 minikube start --vm-driver=virtualbox
   3        1.686 minikube status
   4  5:18:17.252 minikube dashboard
   5       43.507 minikube addons enable ingress
   6        0.401 kubectl get pods -n ingress-nginx
   7     4:03.974 minikube dashboard
   8       13.630 minikube stop
   9       59.398 minikube start --cpus=4 --memory=8096MB
  10        3.865 minikube stop
  11        1.957 minikube delete
  12     1:32.534 minikube start --cpus=4 --memory=8096MB --vm-driver=virtualbox
  13        1.687 minikube status
  14       41.851 minikube dashboard
  15       13.503 minikube stop
  16        1.925 minikube delete
```
## Screenshots
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mf7wnc6eKwFFDYsptfJAoA9uchYK87n7QjDbsLGwEXV7HAMuZFYvWxc7fdspxSKIJUdayqXNwBPL4Fm3meyH2QVYdTUrFlqIJ1SehrTN2_nYK21mYn4FcIwlqzUb5izoOyAqiqf53NQOYYoO0zzZO0dHXELHY9I_jg8QVCtzTGGJi4gGGqPll3Kp-y-Kzg_ON?width=2560&height=1983&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4mmKrzvy0joZ9LASwYYgq2AW5v_-Ap5liiUYTqJf9iejnZkH3F9Q5ih-cILjmE6lr1HBfVFdJk8IaioBSHfSYt5G7BD3zVmthPTCroEQ1Dr8kBeXbmSHrlewL6UrN2y-2ckvdQELmgEZlcbAnjO7XaVr29VBRn8VtWN84mQdg45Av3LTv0x5scnVNzQYzrmyBO?width=2562&height=1986&cropmode=none" width="auto" height="auto" />
</dv>


## Install K8s cluster
----
### History
```bash
  308  git clone https://github.com/kubernetes-sigs/kubespray.git
  309  cd kubespray/
  310  cp -rfp inventory/sample inventory/tonyby
  311  declare -a IPS=(192.168.203.25 192.168.203.26)
  312  CONFIG_FILE=inventory/tonyby/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  313  sudo pip3 install ruamel.yaml
  314  CONFIG_FILE=inventory/tonyby/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  315  sudo pip3 install -r requirements-2.12.txt
  316  ansible-playbook -i inventory/tonyby/hosts.yaml -b cluster.yml --ask-pass
```
### Play RECAP
```bash
PLAY RECAP ************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=772  changed=145  unreachable=0    failed=0    skipped=1256 rescued=0    ignored=9
node2                      : ok=501  changed=92   unreachable=0    failed=0    skipped=734  rescued=0    ignored=2

Thursday 18 August 2022  20:55:03 +0300 (0:00:00.056)       0:41:21.718 *******
===============================================================================
download : download_file | Validate mirrors ------------------------------------------------------------------- 87.73s
kubernetes/preinstall : Install packages requirements --------------------------------------------------------- 68.75s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ---------------------------------------- 58.46s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources --------------------------------------------------- 40.46s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------ 34.48s
download : download_file | Download item ---------------------------------------------------------------------- 34.38s
download : download_container | Download image if required ---------------------------------------------------- 31.55s
download : download_container | Download image if required ---------------------------------------------------- 28.80s
kubernetes/control-plane : kubeadm | Initialize first master -------------------------------------------------- 27.92s
container-engine/containerd : download_file | Download item --------------------------------------------------- 27.25s
download : download_file | Validate mirrors ------------------------------------------------------------------- 26.33s
download : download_container | Download image if required ---------------------------------------------------- 25.94s
download : download_file | Download item ---------------------------------------------------------------------- 25.58s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 23.96s
kubernetes/kubeadm : Join to cluster -------------------------------------------------------------------------- 22.87s
network_plugin/calico : Start Calico resources ---------------------------------------------------------------- 21.95s
kubernetes/preinstall : Ensure kube-bench parameters are set -------------------------------------------------- 19.67s
download : download_container | Download image if required ---------------------------------------------------- 19.23s
download : download_container | Download image if required ---------------------------------------------------- 19.20s
download : download_container | Download image if required ---------------------------------------------------- 18.68s
```