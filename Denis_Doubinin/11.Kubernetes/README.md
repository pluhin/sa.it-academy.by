#Output

```bash
[denis@denis-PC 11.Kubernetes]$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

[denis@denis-PC 11.Kubernetes]$ minikube addons list
|-----------------------------|----------|--------------|-----------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |      MAINTAINER       |
|-----------------------------|----------|--------------|-----------------------|
| ambassador                  | minikube | disabled     | unknown (third-party) |
| auto-pause                  | minikube | disabled     | google                |
| csi-hostpath-driver         | minikube | disabled     | kubernetes            |
| dashboard                   | minikube | enabled ✅   | kubernetes            |
| default-storageclass        | minikube | enabled ✅   | kubernetes            |
| efk                         | minikube | disabled     | unknown (third-party) |
| freshpod                    | minikube | disabled     | google                |
| gcp-auth                    | minikube | disabled     | google                |
| gvisor                      | minikube | disabled     | google                |
| helm-tiller                 | minikube | disabled     | unknown (third-party) |
| ingress                     | minikube | enabled ✅   | unknown (third-party) |
| ingress-dns                 | minikube | disabled     | unknown (third-party) |
| istio                       | minikube | disabled     | unknown (third-party) |
| istio-provisioner           | minikube | disabled     | unknown (third-party) |
| kubevirt                    | minikube | disabled     | unknown (third-party) |
| logviewer                   | minikube | enabled ✅   | google                |
| metallb                     | minikube | disabled     | unknown (third-party) |
| metrics-server              | minikube | enabled ✅   | kubernetes            |
| nvidia-driver-installer     | minikube | disabled     | google                |
| nvidia-gpu-device-plugin    | minikube | disabled     | unknown (third-party) |
| olm                         | minikube | disabled     | unknown (third-party) |
| pod-security-policy         | minikube | disabled     | unknown (third-party) |
| registry                    | minikube | disabled     | google                |
| registry-aliases            | minikube | disabled     | unknown (third-party) |
| registry-creds              | minikube | disabled     | unknown (third-party) |
| storage-provisioner         | minikube | enabled ✅   | kubernetes            |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party) |
| volumesnapshots             | minikube | disabled     | kubernetes            |
|-----------------------------|----------|--------------|-----------------------|
```bash

#Command history

```bash
 2005  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin
 2006  minikube start
 2007  minikube status
 2008  minikube addons list
 2009  minikube addons enable dashboard
 2010  minikube addons enable metrics-server
 2011  minikube addons enable ingress
 2012  minikube addons enable logviewer
 2013  minikube addons list
 2014  kubectl proxy --address='0.0.0.0' --disable-filter=true  &
 2015  kubectl get nodes
 2016  kubectl -n kube-system -l=k8s-app=kube-dns get pods
 2017  kubernetes-dashboard
 2018  kubectl get pods --all-namespaces
 2019  kubectl -n kube-system describe pod kubernetes-dashboard-6fcdf4f6d-bjnst
 2020  kubectl get pods --all-namespaces
 2021  kubectl -n kube-system describe pod kubernetes-dashboard-6fcdf4f6d-bjnst
 2022  kubectl -n kube-system get svc -o wide
 2023  minikube addons list
 2024  kubectl -n kubernetes-dashboard get svc -o wide
 2025  kubectl -n kubernetes-dashboard describe pod kubernetes-dashboard-6fcdf4f6d-bjnst
 2026  kubectl proxy --address='0.0.0.0' --disable-filter=true  &
 2027  netstat
 2028  netstat -npl|grep :111
 2029  sudo netstat -npl|grep :111
 2030  rpcinfo -p localhost
 2031  sudo systemctl stop rpcbind
 2032  sudo systemctl stop rpcbind.socket
 2033  sudo systemctl disable rpcbind
 2034  sudo systemctl disable rpcbind.socket
 2035  netstat -ntlp | grep LISTEN
 2036  kubectl proxy --address='0.0.0.0' --disable-filter=true  &
 2037  netstat -ntlp | grep LISTEN
 2038  ifconfig
 2039  kubectl -n kubernetes-dashboard describe pod kubernetes-dashboard-6fcdf4f6d-bjnst
 2040  kubectl get nodes
 2041  kubectl describe node minikube
```bash

