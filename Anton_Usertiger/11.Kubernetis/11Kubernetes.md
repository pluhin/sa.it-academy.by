# 11.Kubernetes

## bash ubuntu vmware
```bash
minikube start
minikube status
kubectl get nodes
minikube addons enable dashboard
minikube addons enable metrics-server

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

begin
  set -x; set temp_dir (mktemp -d); cd "$temp_dir" &&
  set OS (uname | tr '[:upper:]' '[:lower:]') &&
  set ARCH (uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/') &&
  set KREW krew-$OS"_"$ARCH &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/$KREW.tar.gz" &&
  tar zxvf $KREW.tar.gz &&
  ./$KREW install krew &&
  set -e KREW; set -e temp_dir
end

set -gx PATH $PATH $HOME/.krew/bin

kubectl krew update
kubectl krew install ingress-nginx
kubectl apply -f https://k8s.io/examples/application/mongodb/mongo-deployment.yaml
kubectl apply -f https://k8s.io/examples/application/mongodb/mongo-service.yaml
kubectl get pod mongo-75f59d57f4-4nd6q --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
minikube addons list
minikube dashboard
minikube stop
minikube delete
minikube start --disk-size='10000mb' --cpus='2' --memory='1000mb'
kubectl proxy --address='0.0.0.0' --disable-filter=true
ssh root@192.168.202.13 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
```


## minikube status
```bash
usertiger@server:~/demo$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

usertiger@server:~/demo$ kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
minikube   Ready    control-plane,master   11h   v1.22.2

usertiger@server:~/demo$ kubectl get ingresses --all-namespaces
No resources found

usertiger@server:~/demo$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
mongo-75f59d57f4-7qb4f   1/1     Running   0          6h57m
usertiger@server:~/demo$ kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
mongo   1/1     1            1           6h57m
usertiger@server:~/demo$ kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
mongo   1/1     1            1           6h57m
usertiger@server:~/demo$ kubectl get service mongo
NAME    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)     AGE
mongo   ClusterIP   10.111.10.119   <none>        27017/TCP   6h58m
usertiger@server:~/demo$ kubectl get pod mongo-75f59d57f4-7qb4f --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
27017
kubectl port-forward mongo-75f59d57f4-7qb4f 8001:27017

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
| ingress                     | minikube | disabled     | unknown (third-party) |
| ingress-dns                 | minikube | disabled     | unknown (third-party) |
| istio                       | minikube | disabled     | unknown (third-party) |
| istio-provisioner           | minikube | disabled     | unknown (third-party) |
| kubevirt                    | minikube | disabled     | unknown (third-party) |
| logviewer                   | minikube | disabled     | google                |
| metallb                     | minikube | disabled     | unknown (third-party) |
| metrics-server              | minikube | enabled ✅   | kubernetes            |
| nvidia-driver-installer     | minikube | disabled     | google                |
| nvidia-gpu-device-plugin    | minikube | disabled     | unknown (third-party) |
| olm                         | minikube | disabled     | unknown (third-party) |
| pod-security-policy         | minikube | disabled     | unknown (third-party) |
| portainer                   | minikube | disabled     | portainer.io          |
| registry                    | minikube | disabled     | google                |
| registry-aliases            | minikube | disabled     | unknown (third-party) |
| registry-creds              | minikube | disabled     | unknown (third-party) |
| storage-provisioner         | minikube | enabled ✅   | kubernetes            |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party) |
| volumesnapshots             | minikube | disabled     | kubernetes            |
|-----------------------------|----------|--------------|-----------------------|

PLAY [k8s_cluster] ****************************************************************************************************************************************************************************************
Wednesday 27 October 2021  20:02:08 +0000 (0:00:00.560)       0:25:41.268 ***** 
Wednesday 27 October 2021  20:02:08 +0000 (0:00:00.087)       0:25:41.356 ***** 
Wednesday 27 October 2021  20:02:08 +0000 (0:00:00.093)       0:25:41.449 ***** 
Wednesday 27 October 2021  20:02:08 +0000 (0:00:00.099)       0:25:41.549 ***** 
Wednesday 27 October 2021  20:02:08 +0000 (0:00:00.106)       0:25:41.655 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.097)       0:25:41.752 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.045)       0:25:41.798 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.051)       0:25:41.849 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.055)       0:25:41.905 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.085)       0:25:41.990 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.097)       0:25:42.088 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.105)       0:25:42.193 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.063)       0:25:42.257 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.091)       0:25:42.349 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.055)       0:25:42.404 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.091)       0:25:42.495 ***** 
Wednesday 27 October 2021  20:02:09 +0000 (0:00:00.101)       0:25:42.596 ***** 
Wednesday 27 October 2021  20:02:13 +0000 (0:00:03.914)       0:25:46.511 ***** 
```

## Links:
1. [Img](https://github.com/usertiger/sa.it-academy.by/blob/md-sa2-18-21/Anton_Usertiger/11.Kubernetis/demo/5.png)