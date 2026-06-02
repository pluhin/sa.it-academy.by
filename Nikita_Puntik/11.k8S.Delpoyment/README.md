```bash
HOSTS
178.124.206.53 app.k8s-11.sa app.k8s-12.sa
178.124.206.53 nginx-test.k8s-11.sa nginx-test.k8s-12.sa

kubectl get pods -l app=nginx
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-f6fd8bcb5-7kkzm   2/2     Running   0          15m
nginx-deployment-f6fd8bcb5-jjbr7   2/2     Running   0          15m
nginx-deployment-f6fd8bcb5-kwdxs   2/2     Running   0          15m
nginx-deployment-f6fd8bcb5-zv2kj   2/2     Running   0          15m

kubectl get deployment nginx-deployment
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   4/4     4            4           2m53s

kubectl get svc nginx-service
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
nginx-service   ClusterIP   10.233.26.133   <none>        80/TCP    3m13s

 kubectl get gateway
NAME                 AGE
nginx-gateway        3m20s
simple-web-gateway   18h

 kubectl get svc -n istio-system istio-ingressgateway
NAME                   TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)                                                                      AGE
istio-ingressgateway   LoadBalancer   10.233.47.0   <pending>     15021:31864/TCP,80:30001/TCP,443:30656/TCP,31400:30197/TCP,15443:31009/TCP   18h


curl http://nginx-test.k8s-11.sa/
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
<p>If you see this page, nginx is successfully installed and working.
Further configuration is required for the web server, reverse proxy,
API gateway, load balancer, content cache, or other features.</p>

<p>For online documentation and support please refer to
<a href="https://nginx.org/">nginx.org</a>.<br/>
To engage with the community please visit
<a href="https://community.nginx.org/">community.nginx.org</a>.<br/>
For enterprise grade support, professional services, additional
security features and capabilities please refer to
<a href="https://f5.com/nginx">f5.com/nginx</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
```

<img width="1916" height="972" alt="image" src="https://github.com/user-attachments/assets/5b366009-4c39-45e4-a9e4-1e22c1a63c4a" />
