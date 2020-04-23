#!/bin/bash
echo "Installing kubectl"
apt-get -y -qq update && apt-get -y install -qqy apt-transport-https conntrack
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubectl.list
apt-get -y update -qq
apt-get -y install -qqy kubectl



apt-get -y remove docker docker-engine docker.io
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
apt-get -y update -qq
apt-get -y install -yqq docker-ce
usermod -aG docker vagrant
docker run hello-world


echo "Downloading minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin

echo "Setting up and starting K8S"
minikube start --vm-driver none
kubectl cluster-info
kubectl proxy --address='0.0.0.0' --disable-filter=true  &
minikube dashboard --url
