# k9s homework_11

## Alias
```bash
alias k=kubectl
alias kgn='kubectl get nodes'
alias ka='kubectl apply'
alias ks='kubectl set'
```

## conf
```bass
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWT
   # server: https://127.0.0.1:6443
     server: https://192.168.203.27:6443
  name: cluster.local
contexts:
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local
current-context: kubernetes-admin@cluster.local
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURJVENDQWdtZ0F3SUJBZ0lJQmJQbnNqYS9FOTR3RFFZSktvWklodmNOQ
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb2dJQkFBS0NBUUVBbnRoS0cyWmU2U3l6S1M0M0x5QUxzWSs4V
```

## Nodes and pods
