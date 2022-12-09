# 09.K8s

## Minikube local deployment

```bash
 4688  minikube start
 4689  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
 4690  sudo install minikube-darwin-amd64 /usr/local/bin/minikube
 4691  minikube start
 4692  minikube start --driver=docker
 4693  minikube delete
 4694  minikube start --driver=docker
 4695* git pull
 4696* cd ../
 4697* mkdir 09.K8s
 4698* cd 09.K8s
 4699* ls
 4700* vim Vagrantfile
 4701* vagrant up
 4702  kubectl cluster-info
 4703  kubectl get pods
 4704  kubectl get ns
 4705  kubectl get nodes
 4706  kubectl proxy --address='0.0.0.0' --disable-filter=true  &
 4707  minikube addons enable dashboard
 4708  minikube addons list
 4709  ps aux | grep proxy
 4710  ps aux | grep kubectl
 4711  kill 90912
 4712  minikube stop
 4713  minikube delete
 4714* vagrant halt && vagrant destroy -f
```

## Links

for localhost: http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/event?namespace=_all

for Vagrant host: http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/cronjob?namespace=_all