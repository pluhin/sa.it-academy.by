# Homework report for 10.Kubernetes by Siarhei Kaliuha

---

## Minikube commands history:

```bash
   91  minikube version
   92  sudo minikube start --driver none
   93  sudo sysctl fs.protected_regular=0
   94  sudo minikube start --driver none
   95  sudo minikube status
   96  sudo kubectl cluster-info
   97  sudo kubectl proxy --address='0.0.0.0' --disable-filter=true  &
   98  sudo minikube dashboard --url
   99  history
  100  minikube addons list
  101  sudo minikube addons enable ingress
  102  sudo minikube addons list
  103  history

```

## List of Minikube addons:

```bash
vagrant@vagrant:~$ sudo minikube addons list
|-----------------------------|----------|--------------|--------------------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
|-----------------------------|----------|--------------|--------------------------------|
| ambassador                  | minikube | disabled     | third-party (ambassador)       |
| auto-pause                  | minikube | disabled     | google                         |
| csi-hostpath-driver         | minikube | disabled     | kubernetes                     |
| dashboard                   | minikube | enabled ✅   | kubernetes                     |
| default-storageclass        | minikube | enabled ✅   | kubernetes                     |
| efk                         | minikube | disabled     | third-party (elastic)          |
| freshpod                    | minikube | disabled     | google                         |
| gcp-auth                    | minikube | disabled     | google                         |
| gvisor                      | minikube | disabled     | google                         |
| helm-tiller                 | minikube | disabled     | third-party (helm)             |
| ingress                     | minikube | enabled ✅   | unknown (third-party)          |
| ingress-dns                 | minikube | disabled     | google                         |
| istio                       | minikube | disabled     | third-party (istio)            |
| istio-provisioner           | minikube | disabled     | third-party (istio)            |
| kong                        | minikube | disabled     | third-party (Kong HQ)          |
| kubevirt                    | minikube | disabled     | third-party (kubevirt)         |
| logviewer                   | minikube | disabled     | unknown (third-party)          |
| metallb                     | minikube | disabled     | third-party (metallb)          |
| metrics-server              | minikube | disabled     | kubernetes                     |
| nvidia-driver-installer     | minikube | disabled     | google                         |
| nvidia-gpu-device-plugin    | minikube | disabled     | third-party (nvidia)           |
| olm                         | minikube | disabled     | third-party (operator          |
|                             |          |              | framework)                     |
| pod-security-policy         | minikube | disabled     | unknown (third-party)          |
| portainer                   | minikube | disabled     | portainer.io                   |
| registry                    | minikube | disabled     | google                         |
| registry-aliases            | minikube | disabled     | unknown (third-party)          |
| registry-creds              | minikube | disabled     | third-party (upmc enterprises) |
| storage-provisioner         | minikube | enabled ✅   | google                         |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party)          |
| volumesnapshots             | minikube | disabled     | kubernetes                     |
|-----------------------------|----------|--------------|--------------------------------|

```

## Run Minikube with different CPU/RAM/DISK parameters:

```bash
minikube start --cpus='3' --memory='2g' --disk-size='7000mb'
```

## Minikube dashboard:

![Minikube dashboard](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/10.Kubernetes/dashboard.jpg)


## k8s cluster deployment inside IT-ACADEMY environment:

Hosts:  
node1: 192.168.203.21,  
node2: 192.168.203.22.


![Final summary of ansible play](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/10.Kubernetes/deploy.jpg)