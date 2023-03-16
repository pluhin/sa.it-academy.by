# K8s

minikube -> virtualbox(10.2.0.15, 127.0.0.1) -> 192.168.1.100 -> macOS

minikube -> virtualbox(10.2.0.15, 192.168.1.201, 127.0.0.1) -> 192.168.1.100 -> macOS

http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#

```bash
  522  top
  523  ip addr
  524  free
  525  minikube start
  526  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  527  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  528  minikube start --driver=docker
  529  kubectl
  530  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  531  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  532  kubectl get pods
  533  kubectl get pods -A
  534  minikube addons list
  535  minikube addons enable dashboard
  536  minikube addons enable metrics-server
  537  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  538  curl http://127.0.0.1:8001/api/v1/
  539  curl http://127.0.0.1:8001/api/v1/namespaces/
  540  curl http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/service/http:kubernetes-dashboard:/proxy/
  541  curl http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/service/http:kubernetes-dashboard:/proxy/#
  542  curl http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#
  543  liks http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#
  544  links http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#
  545  c
  546  kubctl get ns
  547  kubectl get ns
  548  kubectl get pods
  549  kubectl get services
  550  kubectl get services -A
  551  kubectl get nodes
  552  minikube delete
  553  ps aux
  554  ps aux | grep 8001
  555  ps aux | grep proxy
  556  kill -9 127988
  557  ps aux | grep proxy
  558  history
```
