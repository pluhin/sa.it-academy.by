### 09. Kubernetes
#### Homework Assignment 0: Finish full install k8s
For my homework assignment, I created an additional two local virtual machines.
1.Cloned Kubespray.
```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip install -r requirements.txt
```
2.Created a config for the cluster:
```bash
cp -rfp inventory/sample inventory/mycluster
```
3.Edited inventory/mycluster/inventory.ini
```bash
[all]
master ansible_host=192.168.56.112 ip=192.168.56.112 ansible_user=root
worker ansible_host=192.168.56.113 ip=192.168.56.113 ansible_user=root

[kube_control_plane]
master

[etcd]
master

[kube_node]
worker

[k8s_cluster:children]
kube_control_plane
kube_node
```
Checked the access of my VMs with the command:
```bash
ansible -i inventory/mycluster/inventory.ini all -m ping -k
```
Result:
```bash
[WARNING]: Skipping callback plugin 'ara_default', unable to load
worker | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
master | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

```
I'm running the installation through the command:
```bash
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml -b -k -v
```
Result:
```bash
PLAY RECAP ******************************************************************************************************************************************
master                     : ok=669  changed=139  unreachable=0    failed=0    skipped=1085 rescued=0    ignored=6   
worker                     : ok=462  changed=86   unreachable=0    failed=0    skipped=683  rescued=0    ignored=1   

Thursday 17 April 2025  13:02:06 +0000 (0:00:00.084)       0:11:00.896 ******** 
=============================================================================== 
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 31.91s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 25.18s
download : Check_pull_required |  Generate a list of information about the images on a node ------------------------------------------------- 23.51s
download : Download_file | Download item ---------------------------------------------------------------------------------------------------- 20.58s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 18.92s
download : Download_file | Download item ---------------------------------------------------------------------------------------------------- 18.86s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 18.54s
kubernetes/kubeadm : Join to cluster if needed ---------------------------------------------------------------------------------------------- 16.92s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 13.74s
download : Download_file | Download item ---------------------------------------------------------------------------------------------------- 12.75s
download : Download_file | Download item ---------------------------------------------------------------------------------------------------- 11.97s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 11.90s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 11.46s
download : Download_container | Download image if required ---------------------------------------------------------------------------------- 11.07s
container-engine/containerd : Download_file | Download item --------------------------------------------------------------------------------- 11.03s
bootstrap-os : Ensure iproute2 is installed ------------------------------------------------------------------------------------------------- 10.18s
kubernetes/control-plane : Kubeadm | Initialize first control plane node --------------------------------------------------------------------- 9.25s
container-engine/nerdctl : Download_file | Download item ------------------------------------------------------------------------------------- 9.18s
download : Download_container | Download image if required ----------------------------------------------------------------------------------- 8.79s
download : Download_file | Download item ----------------------------------------------------------------------------------------------------- 8.71s
```
I'll check the clusters on the master node:
```bash
kubectl get nodes
```
Result:
```bash
NAME      STATUS   ROLES           AGE   VERSION
master    Ready    control-plane   5m    v1.28.0
worker    Ready    <none>          4m    v1.28.0
```
#### Homework Assignment 1: KinD Kubernetes Cluster Setup
1.Installing kinD
```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/
kind --version (kind version 0.20.0)
```
2.Created a configuration file for the cluster
```bash
cat > kind-config.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF
```
3.Started the cluster
```bash
sudo kind create cluster --name my-cluster --config kind-config.yaml
```
Result:
```bash
Creating cluster "my-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.28.0) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-my-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-my-cluster
```
Also with the command kubectl get nodes
```bash
NAME                       STATUS   ROLES           AGE     VERSION
my-cluster-control-plane   Ready    control-plane   9m27s   v1.28.0
```
Also with the command kubectl get pods -A
```bash
NAMESPACE            NAME                                               READY   STATUS    RESTARTS   AGE
kube-system          coredns-5dd5756b68-gnwgm                           1/1     Running   0          9m34s
kube-system          coredns-5dd5756b68-mzqrs                           1/1     Running   0          9m34s
kube-system          etcd-my-cluster-control-plane                      1/1     Running   0          9m51s
kube-system          kindnet-hzkh6                                      1/1     Running   0          9m34s
kube-system          kube-apiserver-my-cluster-control-plane            1/1     Running   0          9m45s
kube-system          kube-controller-manager-my-cluster-control-plane   1/1     Running   0          9m50s
kube-system          kube-proxy-pj6nn                                   1/1     Running   0          9m34s
kube-system          kube-scheduler-my-cluster-control-plane            1/1     Running   0          9m45s
local-path-storage   local-path-provisioner-6f8956fb48-h6rpp            1/1     Running   0          9m34s
```
#### Homework Assignment 2: Minikube Kubernetes Cluster Setup
1.Install Minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version: v1.35.0
```
2.Launch Minikube cluster
```bash
minikube start --driver=docker
minikube status
```
Result:
```bash
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
3.Check cluster
View nodes:
```bash
kubectl get nodes
```
```bash
NAME       STATUS   ROLES           AGE    VERSION
minikube   Ready    control-plane   8m4s   v1.32.0
```
Checking system pods:
```bash
kubectl get pods -A
```
```bash
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-668d6bf9bc-mb8fw           1/1     Running   0               8m18s
kube-system   etcd-minikube                      1/1     Running   0               8m27s
kube-system   kube-apiserver-minikube            1/1     Running   0               8m27s
kube-system   kube-controller-manager-minikube   1/1     Running   0               8m27s
kube-system   kube-proxy-llkvc                   1/1     Running   0               8m18s
kube-system   kube-scheduler-minikube            1/1     Running   0               8m27s
kube-system   storage-provisioner                1/1     Running   1 (7m53s ago)   8m18s
```
#### Homework Assignment 3: GitHub Actions for KinD Cluster Setup
Created a new repository in GitHub kubernetes-assignments
Created the file kind-cluster.yml (provided separately).
Results of the work: [google drive image 1](http://https://drive.google.com/file/d/1-Ap_mreY3gPjbXDQ7L1xHzhmA_Jev4sE/view?usp=sharing "google drive image 1") and [google drive image 2](http://https://drive.google.com/file/d/12tzWbVn8sWuuIqj4bAD-21CtXM2rQjtl/view?usp=sharing "google drive image 2").
The result is in the logs:
```bash
NAME                           STATUS   ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION     CONTAINER-RUNTIME
github-cluster-control-plane   Ready    control-plane   21s   v1.27.3   172.18.0.2    <none>        Debian GNU/Linux 11 (bullseye)   6.8.0-1026-azure   containerd://1.7.1
NAMESPACE            NAME                                                   READY   STATUS              RESTARTS   AGE
kube-system          coredns-5d78c9869d-qrhw6                               0/1     ContainerCreating   0          3s
kube-system          coredns-5d78c9869d-x2vww                               0/1     ContainerCreating   0          3s
kube-system          etcd-github-cluster-control-plane                      1/1     Running             0          19s
kube-system          kindnet-7m79l                                          1/1     Running             0          3s
kube-system          kube-apiserver-github-cluster-control-plane            1/1     Running             0          18s
kube-system          kube-controller-manager-github-cluster-control-plane   1/1     Running             0          18s
kube-system          kube-proxy-8hfrc                                       1/1     Running             0          3s
kube-system          kube-scheduler-github-cluster-control-plane            1/1     Running             0          18s
local-path-storage   local-path-provisioner-6bc4bddd6b-tsvcp                0/1     ContainerCreating   0          3s
```
Version: kind v0.20.0 go1.20.4 linux/amd64
#### Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
Added another .github/workflows/minikube-cluster.yml file to the repository (provided separately).
Results of the work: [google drive image 3](https://drive.google.com/file/d/1tOufWCbirwBBDWvWgVzT29JdCw5lgf-v/view?usp=sharing "google drive image 3")

```bash
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   etcd-minikube                      0/1     Running   0          3s
kube-system   kube-apiserver-minikube            0/1     Running   0          3s
kube-system   kube-controller-manager-minikube   0/1     Running   0          2s
kube-system   kube-scheduler-minikube            0/1     Running   0          2s
kube-system   storage-provisioner                0/1     Pending   0          1s
```
k8s version v1.32.0
