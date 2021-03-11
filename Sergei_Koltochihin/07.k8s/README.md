# 07.k8s
### history
```sh 
 1060  mkdir vebinar7
 1061  cd vebinar
 1062  cd vebinar7
 1063  mkdir minikube
 1064  cd minikube/
 1065  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \ && chmod +x minikube
 1066  sudo mkdir -p /usr/local/bin/
 1067  sudo install minikube /usr/local/bin/
 1068  minikube 
 1069  minikube start
 1070  minikube status
 1071  minikube
 1072  minikube ssh
 1073  minikube addons list
 1074  minikube addons enable dashboard
 1075  minikube addons enable ingress
 1076  minikube addons list
 1077  kubectl 
 1078  sudo snap install kubectl
 1079  sudo snap install kubectl --classic
 1080  kubectl get nodes
 1081  kubectl get pods
 1082  kubectl proxy --adress='0.0.0.0' --disable-filter=true &
 1083  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 1084  minikube stop
 1085  ps aux | grep "kubectl proxy"
 1086  kill 10037
 1087  minikube stop
 1088  minikube start --cpus=2 --memory=4096
 1089  minikube stop
 1090  minikube delete
```
