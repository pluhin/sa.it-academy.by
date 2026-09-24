# https://github.com/aionfiend/12.K8S

# 12.1
```
  502  kubectl apply -f deployment.yaml
  503  kubectl apply -f service.yaml
  504  kubectl apply -f gateway.yaml
  505  kubectl apply -f virtualservice.yaml
 
       curl -L https://istio.io/downloadIstio | sh -
  506  ls -a
  507  cd ~
  509  cd Documents/DevOps_learning/istio-1.31.1/
  510  install -m 0755 bin/istioctl /usr/local/bin/istioctl
  511  istioctl version
  512  export PATH=$PWD/bin:$PATH
  513  istioctl install -f samples/bookinfo/demo-profile-no-gateways.yaml -y
  514  kubectl cluster-info
  515  istioctl x precheck
  518  kubectl create namespace istio-system 2>/dev/null || true
  519  istioctl install -y --set profile=demo
  524  kubectl cluster-info
  525  kubectl config get-contexts
  526  colima start --kubernetes
  528  kubectl cluster-info
  529  istioctl install -f samples/bookinfo/demo-profile-no-gateways.yaml -y
  530  istioctl version
  531  istioctl x precheck
  532  kubectl create namespace istio-system 2>/dev/null || true
  533  istioctl install -y --set profile=demo
  534  kubectl label ns default istio-injection=enabled --overwrite
  535  kubectl rollout restart deploy -n default
  536  k9s
  537  kubectl rollout restart deploy -n default
  538  kubectl label ns default istio-injection=enabled --overwrite
  539  kubectl get pods -l app=nginx -w
  540  kubectl get gateway,virtualservice
  541  kubectl get svc istio-ingressgateway -n istio-system
  542  nano /etc/hosts
  543  sudo nano /etc/hosts
