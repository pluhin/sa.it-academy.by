## 11. Kubernetes installation HOMEWORK
### merge two config
```bash
kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
preferences: {}
users:
- name: default
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED

export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/config_k9s
echo $KUBECONFIG
:/home/vagrant/.kube/config:/home/vagrant/.kube/config_k9s

kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: cluster.local
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
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
current-context: default
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

kubectl config get-contexts
CURRENT   NAME                             CLUSTER         AUTHINFO           NAMESPACE
*         default                          default         default
          kubernetes-admin@cluster.local   cluster.local   kubernetes-admin

kubectl config use-context kubernetes-admin@cluster.local
Switched to context "kubernetes-admin@cluster.local".

kubectl config get-contexts
CURRENT   NAME                             CLUSTER         AUTHINFO           NAMESPACE
          default                          default         default
*         kubernetes-admin@cluster.local   cluster.local   kubernetes-admin

export KUBECONFIG=$KUBECONFIG_SAVED
```
### Setup aliases
```bash
alias k=kubectl
alias kcu="kubectl config use-context"
```