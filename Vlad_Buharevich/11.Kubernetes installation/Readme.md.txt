### 11. Kubernetes installation
## k9s
## kubectl config
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.203.28:6443
  name: cluster.k3s
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.203.28:6443
  name: cluster.local
contexts:
- context:
    cluster: cluster.k3s
    user: k3s
  name: k3s@cluster.k3s
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local
current-context: kubernetes-admin@cluster.local
kind: Config
preferences: {}
users:
- name: k3s
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
## Kubectl config use-context
Use "kubectl options" for a list of global command-line options (applies to all commands).
root@STG-UB:~$ kubectl config use-context k3s@cluster.k3s
Switched to context "k3s@cluster.k3s".
root@STG-UB:~$ kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
debian10   Ready    control-plane,master   22h   v1.22.6+k3s1
root@STG-UB:~$ nano .kube/config
root@STG-UB:~$ kubectl config use-context kubernetes-admin@cluster.local
Switched to context "kubernetes-admin@cluster.local".
root@STG-UB:~$ kubectl get nodes
NAME    STATUS   ROLES                  AGE     VERSION
node1   Ready    <none>                 4d20h   v1.23.3
node2   Ready    control-plane,master   4d20h   v1.23.3