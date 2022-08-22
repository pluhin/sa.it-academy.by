## Aliases

```bash

alias k=kubectl
alias kgn='kubectl get nodes'
alias ka='kubectl apply'
alias ks='kubectl set'

```

## Nodes and pods

![image](https://user-images.githubusercontent.com/110092772/185947755-798385d9-a597-4e70-b5bf-d782a678bae6.png)

![image](https://user-images.githubusercontent.com/110092772/185947877-3ce80c94-060d-466c-a1ef-c9fc6b4c1b74.png)

## K3s

![image](https://user-images.githubusercontent.com/110092772/185948181-a005c1b9-e596-441d-80df-d74a8307b186.png)

## Config

```bash

apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRW>
    #server: https://127.0.0.1:6443
    server: https://192.168.203.21:6443
  name: cluster.local

- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZR>
    server: https://192.168.207.140:6443
  name: default

contexts:
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local

- context:
    cluster: default
    user: default
  name: default
current-context: kubernetes-admin@cluster.local
kind: Config
preferences: {}

users:
- name: kubernetes-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURJVENDQWdtZ0F3SUJBZ0lJTVpRckFKU0tyWWd3RFFZSktvWklodmNOQVFFTEJRQXdG>
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBK3Naby83VFRTY2JXL01XSTBnWjBRVFhGOEVKS2V4dTVnQmxEMGNE>

- name: default
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrakNDQVRlZ0F3SUJBZ0lJV0YrcnFNZVBSNjh3Q2dZSUtvWkl6ajBFQXdJd0l6RWh>
    client-key-data: LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUlyVFJSZlIxcnRVVFM4MTV1K2tlQUp0dlFGdHV3cGh3T2MzL0hZdTA0WHJvQW9>



```bash
