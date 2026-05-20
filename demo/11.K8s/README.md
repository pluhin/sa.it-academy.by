## History

```bash
  524  cd 11.K8s.Start/
  525  ls
  526  vim pod_live.yaml
  527  kubectl apply -f pod_live.yaml
  528  kubectldelete -f pod_live.yaml
  529  kubectl delete -f pod_live.yaml
  530  vim pod_exec.yaml
  531  kubectl apply -f pod_exec.yaml
  532  kubectl delete -f pod_exec.yaml
  533  vim deployment.yaml
  534  k apply -f deployment.yaml
  535  kubectl apply -f deployment.yaml
  536  vim deployment.yaml
  537  kubectl apply -f deployment.yaml
  538  vim deployment.yaml
  539  kubectl apply -f deployment.yaml
  540  vim deployment.yaml
  541  kubectl apply -f deployment.yaml
  542  kubectl delete -f deployment.yaml
  543  vim app.yaml
  544  cd 11.K8s.Start/
  545  ls
  546  kubectl apply -f app.yaml
  547  vim ../10.K8s.Install/pod.yaml
  548  kubectl apply -f ../10.K8s.Install/pod.yaml
  549  curl -L https://istio.io/downloadIstio | sh -
  550  cd istio-*
  551  sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl
  552  istioctl version
  553  istioctl x precheck
  554  kubectl create namespace istio-system 2>/dev/null || true
  555  istioctl install -y --set profile=demo
  556  istioctl verify-install
  557  istioctl helm
  558  istioctl help
  559  istioctl version
  560  kubectl label ns default istio-injection=enabled --overwrite
  561  vim istio.yaml
  562  kubectl apply -f istio.yaml
  563  vim istio.yaml
  564  history
```

---
chrome -> 
    /etc/hosts (178.124.206.53 app.k8s-15.sa app.k8s-16.sa) 
    -> 178.124.206.53:80 
    -> k8s (istio-ingress controller):30001 
    -> Gateway/VirtualService 
    -> service:80 
    -> IstionSideCar -> pod:80


## Bastion nginx config

```
server {
  listen 80;
  listen [::]:80;
  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
        proxy_pass       http://192.168.208.$1:30001;
  }
}
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k3s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30001;
  }
}
```

---
## Install istioctl

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl

istioctl version
Istio is not present in the cluster: no running Istio pods in namespace "istio-system"
client version: 1.29.0
```

## Install istio

```bash
istioctl x precheck
kubectl create namespace istio-system 2>/dev/null || true
istioctl install -y --set profile=demo
```

check 

```bash
kubectl get pods -n istio-system
istioctl verify-install
istioctl version
```
-----

## Enable istio in NS default

```bash
kubectl label ns default istio-injection=enabled --overwrite
kubectl rollout restart deploy -n default
```

## Add Gateway and VS

- you can disable ingress controller or chnage port 30001 -> any another
- need to chnage nodePort for istio ingress controller
  - Namespace: istio-system
  - Service: istio-ingressgateway

```yaml
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
```



```yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: simple-web-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - app.k8s-XX.sa
        - app.k8s-YY.sa
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: simple-web-vs
  namespace: default
spec:
  hosts:
    - app.k8s-XX.sa
    - app.k8s-YY.sa
  gateways:
    - simple-web-gateway
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: simple-web-service
            port:
              number: 80
```

and apply

```bash
kubectl apply -f istio-gw-vs.yaml
```
