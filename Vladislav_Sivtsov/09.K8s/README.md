# K8s full instalation output
```bash
PLAY RECAP ******************************************************************************************************************
node1                      : ok=670  changed=23   unreachable=0    failed=0    skipped=1090 rescued=0    ignored=1   
node2                      : ok=446  changed=6    unreachable=0    failed=0    skipped=681  rescued=0    ignored=1   


TASKS RECAP *****************************************************************************************************************
Thursday 17 April 2025  13:46:14 +0000 (0:00:00.061)       0:13:35.057 ********
===============================================================================
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------ 24.77s
policy_controller/calico : Create calico-kube-controllers manifests ------------------------------------------------- 20.79s
kubernetes/control-plane : Backup old certs and keys ---------------------------------------------------------------- 19.46s
kubernetes/control-plane : Backup old confs ------------------------------------------------------------------------- 12.41s
kubernetes-apps/ansible : Kubernetes Apps | CoreDNS ----------------------------------------------------------------- 10.20s
bootstrap-os : Update Apt cache -------------------------------------------------------------------------------------- 8.25s
etcdctl_etcdutl : Copy etcd binary ----------------------------------------------------------------------------------- 8.13s
kubernetes/control-plane : Kubeadm | Check apiserver.crt SAN hosts --------------------------------------------------- 8.05s
kubernetes/preinstall : Update package management cache (APT) -------------------------------------------------------- 7.93s
container-engine/nerdctl : Extract_file | Unpacking archive ---------------------------------------------------------- 7.75s
container-engine/crictl : Extract_file | Unpacking archive ----------------------------------------------------------- 7.52s
etcdctl_etcdutl : Extract_file | Unpacking archive ------------------------------------------------------------------- 7.39s
network_plugin/cni : CNI | Copy cni plugins -------------------------------------------------------------------------- 6.87s
container-engine/containerd : Containerd | Unpack containerd archive ------------------------------------------------- 6.76s
network_plugin/calico : Start Calico resources ----------------------------------------------------------------------- 6.72s
etcdctl_etcdutl : Copy etcdctl and etcdutl binary from download dir -------------------------------------------------- 6.27s
bootstrap-os : Gather facts ------------------------------------------------------------------------------------------ 6.26s
kubernetes/node : Modprobe Kernel Module for IPVS -------------------------------------------------------------------- 6.20s
kubernetes/preinstall : Ensure kubelet expected parameters are set --------------------------------------------------- 6.19s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) --- 5.90s
```
### MINIKUBE
```bash
(venv)  vlad@testserv  ~/09.K8s  minikube start                           
😄  minikube v1.35.0 on Ubuntu 24.04 (vbox/amd64)
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
🔄  Restarting existing docker container for "minikube" ...

🧯  Docker is nearly out of disk space, which may cause deployments to fail! (86% of capacity). You can pass '--force' to skip this check.
💡  Suggestion: 


    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally with "-a")
    2. Increase the storage allocated to Docker for Desktop by clicking on:
    Docker icon > Preferences > Resources > Disk Image Size
    3. Run "minikube ssh -- docker system prune" if using the Docker container runtime
🍿  Related issue: https://github.com/kubernetes/minikube/issues/9024

🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
🔎  Verifying Kubernetes components...

    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally with "-a")
    2. Increase the storage allocated to Docker for Desktop by clicking on:
    Docker icon > Preferences > Resources > Disk Image Size
    3. Run "minikube ssh -- docker system prune" if using the Docker container runtime
🍿  Related issue: https://github.com/kubernetes/minikube/issues/9024

🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
🔎  Verifying Kubernetes components...

    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally with "-a")
    2. Increase the storage allocated to Docker for Desktop by clicking on:
    Docker icon > Preferences > Resources > Disk Image Size
    3. Run "minikube ssh -- docker system prune" if using the Docker container runtime
🍿  Related issue: https://github.com/kubernetes/minikube/issues/9024

🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
🔎  Verifying Kubernetes components...

    Try one or more of the following to free up space on the device:

    Try one or more of the following to free up space on the device:

    Try one or more of the following to free up space on the device:

    Try one or more of the following to free up space on the device:


    Try one or more of the following to free up space on the device:

    Try one or more of the following to free up space on the device:


    Try one or more of the following to free up space on the device:


    Try one or more of the following to free up space on the device:



    Try one or more of the following to free up space on the device:


    Try one or more of the following to free up space on the device:

    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally w

    Try one or more of the following to free up space on the device:       

    Try one or more of the following to free up space on the device:      

    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally with "-a")
    2. Increase the storage allocated to Docker for Desktop by clicking on:       
    Docker icon > Preferences > Resources > Disk Image Size
    3. Run "minikube ssh -- docker system prune" if using the Docker container runtime
🍿  Related issue: https://github.com/kubernetes/minikube/issues/9024

🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
🔎  Verifying Kubernetes components...
    ▪ Using image docker.io/kubernetesui/dashboard:v2.7.0
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
    ▪ Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
💡  Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

🌟  Enabled addons: metrics-server, storage-provisioner, dashboard, default-storageclass
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'     
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
(venv)  vlad@testserv  ~/09.K8s  deactivate
 vlad@testserv  ~/09.K8s  minikube kubectl -- get pods -A
NAMESPACE              NAME                                         READY   STATUS    RESTARTS        AGE
kube-system            coredns-668d6bf9bc-gv4v6                     1/1     Running   3 (4m26s ago)   44h
kube-system            etcd-minikube                                1/1     Running   3 (4m26s ago)   44h
kube-system            kube-apiserver-minikube                      1/1     Running   3 (4m26s ago)   44h
kube-system            kube-controller-manager-minikube             1/1     Running   3 (4m26s ago)   44h
kube-system            kube-proxy-7zvwj                             1/1     Running   3 (4m26s ago)   44h
kube-system            kube-scheduler-minikube                      1/1     Running   3 (4m26s ago)   44h
kube-system            metrics-server-7fbb699795-hdmht              1/1     A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
(venv)  vlad@testserv  ~/09.K8s  deactivate
 vlad@testserv  ~/09.K8s  minikube kubectl -- get pods -A
NAMESPACE              NAME                                         READY   STATUS    RESTARTS        AGE
kube-system            coredns-668d6bf9bc-gv4v6                     1/1     Running   3 (4m26s ago)   44h
kube-system            etcd-minikube                                1/1     Running   3 (4m26s ago)   44h
kube-system            kube-apiserver-minikube                      1/1     Running   3 (4m26s ago)   44h
minikube                      1/1     Running   3 (4m26s ago)   44h        
kube-system            metrics-server-7fbb699795-hdmht              1/1     Running   1 (4m26s ago)   44h
kube-system            storage-provisioner                          1/1     Running   6 (3m46s ago)   44h
kubernetes-dashboard   dashboard-metrics-scraper-5d59dccf9b-mzb8w   1/1     Running   1 (4m26s ago)   44h
kubernetes-dashboard   kubernetes-dashboard-7779f9b69b-8nmj7        1/1     Running   2 (3m45s ago)   44h
 vlad@testserv  ~/09.K8s  kubectl proxy --address='0.0.0.0' --disable-filter=true
zsh: command not found: kubectl
 ✘ vlad@testserv  ~/09.K8s  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    695      0 --:--:-- --:--:-- --:--:--   696
100 54.6M  100 54.6M    0     0  9248k      0  0:00:06  0:00:06 --:--:-- 11.1M
 vlad@testserv  ~/09.K8s  chmod +x kubectl
 vlad@testserv  ~/09.K8s  sudo mv kubectl /usr/local/bin/
[sudo] password for vlad:
 vlad@testserv  ~/09.K8s  kubectl version --client
Client Version: v1.32.3
Kustomize Version: v5.5.0
 vlad@testserv  ~/09.K8s  kubectl proxy --address='0.0.0.0' --disable-filter=true
W0417 14:43:17.504037   51054 proxy.go:177] Request filter disabled, your proxy is vulnerable to XSRF attacks, please be cautious
Starting to serve on [::]:8001

 minikube stop                                
✋  Stopping node "minikube"  ...
🛑  Powering off "minikube" via SSH ...
🛑  1 node stopped.
```

# KinD 

```bash
kubectl get nodes
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   65s   v1.29.2

ubectl get pods -A
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-76f75df574-tkscx                     1/1     Running   0          81s
kube-system          coredns-76f75df574-z6mvc                     1/1     Running   0          81s
kube-system          etcd-kind-control-plane                      1/1     Running   0          94s
kube-system          kindnet-64h7s                                1/1     Running   0          81s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          94s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          97s
kube-system          kube-proxy-4wzhx                             1/1     Running   0          81s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          94s
local-path-storage   local-path-provisioner-7577fdbbfb-ttnnc      1/1     Running   0          81s
```