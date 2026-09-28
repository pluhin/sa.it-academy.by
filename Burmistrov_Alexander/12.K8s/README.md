# 12. Kubernetes. Basic objects. First deployment

Для доступа к нашему Deployment надо поправить istio-ingressgateway, так как он слушает не тот порт. Для этого мы берем текущую конфигурация этого Service, выводим ее в файл, меняем что нам надо и просим К8с заменить этот Service правленным. 

```bash
kubectl --context k8s -n istio-system get svc istio-ingressgateway -o yaml >> istio-ingressgateway-fix.yaml
  ports:
  - name: status-port
    nodePort: 31081
    port: 15021
    protocol: TCP
    targetPort: 15021
  - name: http2
    nodePort: 30001    #<---- here
    port: 80
    protocol: TCP
    targetPort: 8080
  - name: https
    nodePort: 31178
    port: 443
    protocol: TCP
kubectl --context k8s -n istio-system apply -f istio-ingressgateway-fix.yaml
```

```bash
[user ~] % curl -L nginx-test.k8s-6.sa
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

[user ~] % curl -L nginx-test.k8s-5.sa
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