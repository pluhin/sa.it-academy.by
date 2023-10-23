
Chrome => /etc/hosts (178.124.206.53 app-alias.k8s-15.sa app.k8s-15.sa) =>
=> 178.124.206.53

```conf
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30001;
  }
}
```
=> ingress controller port 3000 => service => pod

```conf
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30001;
  }
}
```

c:\Windows\System32\Drivers\etc\hosts
```
178.124.206.53 app-alias.k8s-XX.sa app.k8s-XX.sa
```

## History

```bash
 704  cd 11.K8s/
  705  ls
  706  vim pod_exec.yaml
  707  kubectl apply -f pod_exec.yaml
  708  vim pod_exec.yaml
  709  kubectl delete -f pod_exec.yaml
  710  vim pod_live.yaml
  711  kubectl apply -f pod_live.yaml
  712  kubectl delete -f pod_live.yaml
  713  vim deploy_rolling.yaml
  714  kubectl delete -f deploy_rolling.yaml
  715  kubectl apply -f deploy_rolling.yaml
  716  vim deploy_rolling.yaml
  717  kubectl apply -f deploy_rolling.yaml
  718  vim deploy_rolling.yaml
  719  kubectl apply -f deploy_rolling.yaml
  720  vim deploy_rolling.yaml
  721  kubectl apply -f deploy_rolling.yaml
  722  vim deploy_rolling.yaml
  723  kubectl apply -f deploy_rolling.yaml
  724  vim deploy_rolling.yaml
  725  kubectl apply -f deploy_rolling.yaml
  726  vim deploy_rolling.yaml
  727  kubectl delete -f deploy_rolling.yaml
  728  kubectl gent namespases
  729  kubectl get namespases
  730  kubectl get namespaces
  731  vim appl.yaml
  732  kubectl apply -f appl.yaml
  733  vim appl.yaml
  734  kubectl apply -f appl.yaml
  735  vim appl.yaml
  736  kubectl apply -f appl.yaml
  737  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.3/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  738  vim ingress-controller.yaml
  739  kubectl apply -f ingress-controller.yaml
  740  vim appl.yaml
  741  kubectl apply -f ingress-controller.yaml
  742  kubectl apply -f appl.yaml
  743  vim appl.yaml
  744  history
```

## Changes in ingress service

```yaml
...
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.6.4
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - appProtocol: http
    name: http
    port: 80
    protocol: TCP
    nodePort: 30001      ### Added line
    targetPort: http
  - appProtocol: https
    name: https
    port: 443
    protocol: TCP
    nodePort: 30002      ### Added line
    targetPort: https
....
```
