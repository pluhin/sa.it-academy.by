# Homework report for 11.Kubernetes.Installation by Siarhei Kaliuha

---
Cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment, cluster `cluster.home.k3s` deployed at local home VM.


## Setup kubectl aliases for local run:

Add in `~/.bashrc` file

```bash
alias k='kubectl'
alias kcuc='kubectl config use-context'
alias kccc='kubectl config current-context'
alias kcgc='kubectl config get-contexts'
alias kgno='kubectl get nodes'
```

## Screenshots of k9s:

![with both k8s and k3s contexts](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/11.Kubernetes.Installation/k8s_k3s_contexts.jpg)

![with k8s pods in kube-system namespace](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/11.Kubernetes.Installation/k8s_pods.jpg)


## Merged `~/.kube/config` : 
```
vagrant@vagrant-ubuntu-20:~$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.56.22:6466
  name: cluster.home.k3s
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: cluster.remote.k8s
contexts:
- context:
    cluster: cluster.home.k3s
    user: default
  name: k3s
- context:
    cluster: cluster.remote.k8s
    user: kubernetes-admin
  name: k8s
current-context: k8s
kind: Config
preferences: {}
users:
- name: default
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```

## Aliases and `use-context` check:

```bash
vagrant@vagrant-ubuntu-20:~$ kcgc
CURRENT   NAME   CLUSTER              AUTHINFO           NAMESPACE
          k3s    cluster.home.k3s     default
*         k8s    cluster.remote.k8s   kubernetes-admin

vagrant@vagrant-ubuntu-20:~$ kgno
NAME    STATUS   ROLES                  AGE   VERSION
node1   Ready    control-plane,master   44d   v1.24.2
node2   Ready    <none>                 44d   v1.24.2

vagrant@vagrant-ubuntu-20:~$ kcuc k3s
Switched to context "k3s".

vagrant@vagrant-ubuntu-20:~$ kubectl config get-contexts
CURRENT   NAME   CLUSTER              AUTHINFO           NAMESPACE
*         k3s    cluster.home.k3s     default
          k8s    cluster.remote.k8s   kubernetes-admin

vagrant@vagrant-ubuntu-20:~$ kubectl get nodes
NAME                STATUS   ROLES                  AGE   VERSION
vagrant-ubuntu-20   Ready    control-plane,master   73m   v1.23.8+k3s1

vagrant@vagrant-ubuntu-20:~$ kubectl config use-context k8s
Switched to context "k8s".
```