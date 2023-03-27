# 11. Kubernetes. Basic objects
1. Create file [nginx-service.yaml](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/11.Kubernetes.Basic_objects/nginx-service.yaml)
2. Upload and make changes to file ingress-controller.yaml
3. edit file /etc/hosts
```
yulia@ubuntuserver:~/Gitlab_repo/11.K8s.Basic_objects$ sudo vim /etc/hosts
[sudo] password for yulia: 
127.0.0.1 localhost
127.0.1.1 ubuntu_server
192.168.201.16 julia-site1.by
192.168.201.16 julia-site2.by
178.124.206.53 app.k8s-16.sa app-alias.k8s-16.sa
```

Apply:
```
kubectl apply -f nginx-service.yaml
wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
vim ingress-controller.yaml 
kubectl apply -f ingress-controller.yaml
```
Test on ubuntu:

curl http://app-alias.k8s-16.sa

curl http://simple-web-service

curl --header "Host:app-alias.k8s-16.sa" 192.168.203.16:30001


```
kubectl exec -it ubuntu -- bash
root@ubuntu:/# curl http://app-alias.k8s-16.sa
curl: (6) Could not resolve host: app-alias.k8s-16.sa
root@ubuntu:/# curl --header "Host:app-alias.k8s-16.sa" 192.168.203.16:30001
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
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
root@ubuntu:/# exit
root@ubuntu:/# curl http://simple-web-service
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
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
root@ubuntu:/# curl http://simple-web-service.default
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
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
root@ubuntu:/# 

```
Test on localhost:

curl http://app.k8s-16.sa
```
yulia@ubuntuserver:~/Gitlab_repo/11.K8s.Basic_objects$ curl http://app.k8s-16.sa
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
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
