#11.2
```
users-MacBook-Pro$ kubectl config use-context k8s
Switched to context "k8s".
user@users-MacBook-Pro$ kubectl run cluster-debug --image=curlimages/curl --namespace=default -it --rm -- /bin/sh
All commands and output from this session will be recorded in container logs, including credentials and sensitive information passed through the command prompt.
If you don't see a command prompt, try pressing enter.
~ $ 
~ $ nslookup kubernetes.default.svc.cluster.local
Server:         169.254.25.10
Address:        169.254.25.10:53

Name:   kubernetes.default.svc.cluster.local
Address: 10.233.0.1

~ $ curl https://onliner.by
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>
```
#11.3
1. Создаем ряд секретов в Git Action для прохода через Bastion/tunnel и cluster (бесконечные правки).
2. Создаем Webhook URLs Slack и secret для GitHub Action

