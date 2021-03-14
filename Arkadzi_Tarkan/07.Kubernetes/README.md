## minikube v1.17.1 (installed from repository)

```
minikube start

kubectl get node

    NAME       STATUS   ROLES                  AGE   VERSION
    minikube   Ready    control-plane,master   35m   v1.20.2

minikube addons enable dashboard

kubectl proxy --address='0.0.0.0' --disable-filter=true &

minikube addons enable ingress

minikube addons list

    |-----------------------------|----------|--------------|
    |         ADDON NAME          | PROFILE  |    STATUS    |
    |-----------------------------|----------|--------------|
    | ambassador                  | minikube | disabled     |
    | csi-hostpath-driver         | minikube | disabled     |
    | dashboard                   | minikube | enabled ✅    |
    | default-storageclass        | minikube | enabled ✅    |
    | efk                         | minikube | disabled     |
    | freshpod                    | minikube | disabled     |
    | gcp-auth                    | minikube | disabled     |
    | gvisor                      | minikube | disabled     |
    | helm-tiller                 | minikube | disabled     |
    | ingress                     | minikube | enabled ✅    |
    | ingress-dns                 | minikube | disabled     |
    | istio                       | minikube | disabled     |
    | istio-provisioner           | minikube | disabled     |
    | kubevirt                    | minikube | disabled     |
    | logviewer                   | minikube | disabled     |
    | metallb                     | minikube | disabled     |
    | metrics-server              | minikube | disabled     |
    | nvidia-driver-installer     | minikube | disabled     |
    | nvidia-gpu-device-plugin    | minikube | disabled     |
    | olm                         | minikube | disabled     |
    | pod-security-policy         | minikube | disabled     |
    | registry                    | minikube | disabled     |
    | registry-aliases            | minikube | disabled     |
    | registry-creds              | minikube | disabled     |
    | storage-provisioner         | minikube | enabled ✅    |
    | storage-provisioner-gluster | minikube | disabled     |
    | volumesnapshots             | minikube | disabled     |
    |-----------------------------|----------|--------------|

minikube stop

minikube delete

minikube start --memory=2048 --cpus=2 --disk-size=10g

    😄  minikube v1.17.1 on Arch 20.2.1
    ✨  Automatically selected the docker driver. Other choices: virtualbox, ssh
    👍  Starting control plane node minikube in cluster minikube
    🔥  Creating docker container (CPUs=2, Memory=2048MB) ...
    🐳  Preparing Kubernetes v1.20.2 on Docker 20.10.2 ...
        ▪ Generating certificates and keys ...
        ▪ Booting up control plane ...
        ▪ Configuring RBAC rules ...
    🔎  Verifying Kubernetes components...
    🌟  Enabled addons: storage-provisioner, default-storageclass
    🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

```