# 11. Kubernetes installation

## Print-screen of k9s with pods in kube-system namespace added for k3s & k8s respectively

## Config & commands with aliases examples

```bash
   ~ kcgc
CURRENT   NAME                             CLUSTER         AUTHINFO           NAMESPACE
          default                          default         default
*         kubernetes-admin@cluster.local   cluster.local   kubernetes-admin
   ~ k9s
   ~ kcuc default
Switched to context "default".
   ~ k9s
   ~ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:8443
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
```
