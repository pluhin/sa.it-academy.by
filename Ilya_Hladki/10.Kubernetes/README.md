## 10.Kubernetes_homework
### minikube: history 
```bash
   49  minikube addons list
   50  minikube addons enable ingress
   51  minikube addons list
   52  minikube stop
   53  minikube start --memory 3072 --cpus 4
   54  minikube status
```
#### output log enable ingress
```bash
minikube addons enable ingress
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
    ▪ Using image k8s.gcr.io/ingress-nginx/controller:v1.1.1
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
🔎  Verifying ingress addon...
🌟  The 'ingress' addon is enabled
```
### output ansible play of my k8s cluster inside IT-ACADEMY
```bash
ansible-playbook -i inventory/hladki/hosts.yaml -b -u root cluster.yml --ask-pass
...
PLAY RECAP *************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=768  changed=149  unreachable=0    failed=0    skipped=1315 rescued=0    ignored=6
node2                      : ok=507  changed=94   unreachable=0    failed=0    skipped=772  rescued=0    ignored=2

Sunday 22 May 2022  09:57:46 +0000 (0:00:00.080)       0:53:35.921 ************
===============================================================================
kubernetes/preinstall : Install packages requirements ---------------------------------------------------------- 95.92s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------- 79.64s
download : download_file | Validate mirrors -------------------------------------------------------------------- 75.71s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------- 57.31s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------- 47.53s
download : download_container | Download image if required ----------------------------------------------------- 39.22s
policy_controller/calico : Create calico-kube-controllers manifests -------------------------------------------- 31.53s
container-engine/containerd : containerd | Remove orphaned binary ---------------------------------------------- 29.88s
download : download_container | Download image if required ----------------------------------------------------- 29.43s
download : download_container | Download image if required ----------------------------------------------------- 28.78s
kubernetes/control-plane : kubeadm | Initialize first master --------------------------------------------------- 28.77s
container-engine/containerd : download_file | Download item ---------------------------------------------------- 28.65s
network_plugin/calico : Start Calico resources ----------------------------------------------------------------- 27.59s
kubernetes/preinstall : Ensure kube-bench parameters are set --------------------------------------------------- 27.41s
download : download_container | Download image if required ----------------------------------------------------- 26.29s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 25.96s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down nodelocaldns Template ------------------------------------- 23.80s
container-engine/runc : download_file | Download item ---------------------------------------------------------- 23.41s
kubernetes/preinstall : Create kubernetes directories ---------------------------------------------------------- 23.13s
etcd : Check certs | Register ca and etcd admin/member certs on etcd hosts ------------------------------------- 21.67s
vagrant@vagrant:~/k8s/kubespray$
```