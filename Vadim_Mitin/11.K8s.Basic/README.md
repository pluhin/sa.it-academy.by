# HA 1.
```bash
ssh -L 6443:127.0.0.1:6443 root@192.168.208.5 -f -N
export KUBECONFIG=$HOME/.kube/config-k8s:$HOME/.kube/config-k3s
kubectl apply -f nginx-config.yaml --context k8s
kubectl --context k8s port-forward svc/nginx 8080:80
curl http://localhost:8080

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
