### 10.Kubernetes
## Install minikube history:
```bash
   46  minikube start --driver=docker
   47  minikube version
   48  kubectl version
   49  kubectl get nodes
   50  minikube addons enable dashboard
   51  kubectl get services
   52  kubectl proxy --address='0.0.0.0' --disable-filter=true & minikube dashboard --url
   53  minikube status
   54  minikube addons list
   55  ps aux | grep "kubectl proxy"
   56  minikube stop
   59  minikube start
   60  minikube stop
   61  minikube delete
   62  minikube start --memory 2200 --cpus 4 # Run with memory and cpu
   63  minikube addons list
   64  minikube addons enable dashboard
   65  minikube addons enable ingress
   66  minikube stop
   67  minikube start
   68  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
   69  minikube version
   70  kubectl version
   71  history
```
## Addons list
![image](https://github.com/Buharevich/sa.it-academy.by/blob/md-sa2-19-22/Vlad_Buharevich/10.Kubernetes/addons%20list.png?raw=true)
## Dashboard
![image](https://github.com/Buharevich/sa.it-academy.by/blob/md-sa2-19-22/Vlad_Buharevich/10.Kubernetes/Dashboard.png?raw=true)
## IT-ACADEMY environment
![image](https://github.com/Buharevich/sa.it-academy.by/blob/md-sa2-19-22/Vlad_Buharevich/10.Kubernetes/Play%20Recap.png?raw=true)
