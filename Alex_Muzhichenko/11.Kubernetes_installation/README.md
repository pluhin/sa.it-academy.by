
## 11. Kubernetes installation Alex Muzhichenko

---

### k9s screenshot

![k9s](k9s.jpg)

### kubectl config view

```bash

alex@ubntukab:~/k8s$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: cluster.local
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.2.147:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local
current-context: kubernetes-admin@cluster.local
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

### kubectl config use-context

```bash

alex@ubntukab:~/k8s$ kubectl config get-contexts
CURRENT   NAME                             CLUSTER         AUTHINFO           NAMESPACE
          default                          default         default
*         kubernetes-admin@cluster.local   cluster.local   kubernetes-admin
alex@ubntukab:~/k8s$ kubectl config use-context kubernetes-admin@cluster.local
Switched to context "kubernetes-admin@cluster.local".
alex@ubntukab:~/k8s$ kubectl get nodes
NAME    STATUS   ROLES                  AGE   VERSION
node1   Ready    control-plane,master   3d    v1.23.6
node2   Ready    <none>                 3d    v1.23.6

alex@ubntukab:~/k8s$ kubectl config use-context default
Switched to context "default".
alex@ubntukab:~/k8s$ kubectl get nodes
NAME    STATUS   ROLES                  AGE   VERSION
test2   Ready    control-plane,master   25h   v1.23.6+k3s1



```
