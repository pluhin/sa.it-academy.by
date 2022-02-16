### 11.K8s.Installation

## Switch between contexts 

```bash
Use "kubectl options" for a list of global command-line options (applies to all commands).
vagrant@ubuntu-bionic:~$ kubectl config use-context k3s@cluster.k3s
Switched to context "k3s@cluster.k3s".
vagrant@ubuntu-bionic:~$ kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
debian10   Ready    control-plane,master   22h   v1.22.6+k3s1
vagrant@ubuntu-bionic:~$ nano .kube/config
vagrant@ubuntu-bionic:~$ kubectl config use-context kubernetes-admin@cluster.local
Switched to context "kubernetes-admin@cluster.local".
vagrant@ubuntu-bionic:~$ kubectl get nodes
NAME    STATUS   ROLES                  AGE     VERSION
node1   Ready    <none>                 4d20h   v1.23.3
node2   Ready    control-plane,master   4d20h   v1.23.3
vagrant@ubuntu-bionic:~$

```
