### 10.Kubernetes
~~~bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
minikube kubectl -- get pods -A

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client
kubectl cluster-info
minikube dashboard --url
kubectl proxy

minikube addons enable ingress

minikube stop
minikube delete
minikube start --memory 8192 --cpus 2
~~~