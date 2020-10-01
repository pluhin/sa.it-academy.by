## kubectl installation
```
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```

## minikube installation
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube
sudo mv minikube /usr/local/bin
minikube status
minikube start
minikube addons list
minikube addons enable dashboard
minikube addons enable ingress
kubectl proxy --address='0.0.0.0' --disable-filter=true &
minikube stop
minikube delete
netstat -tulp | grep kubectl
sudo kill -9 9356
```
### to run minikube with specific 2 CPU and 2Gb RAM:
```
minikube start --cpus=2 --memory='2g'
```

