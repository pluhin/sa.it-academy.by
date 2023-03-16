# 09.Kubernetes

## cluster.yaml
```
vitali@vitali-VirtualBox:~/Course/09.Kubernetes$ cat .github/workflows/cluster.yaml
name: Deploy minikube and Kind
on:
  - push
  - pull_request
jobs:
  deploy_minikube:
    runs-on: ubuntu-latest
    name: deploy to minikube
    steps:
    - name: Start minikube
      uses: medyagh/setup-minikube@master
    - name: checkinfo
      run: |
       echo -e "Nods:\n$(kubectl get pods -A)" >> output_minikube.log
       echo -e "Minikube version:\n$(kubectl version --short)" >> output_minikube.log
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
          path: output_minikube.log

  deploy_KinD:
    runs-on: ubuntu-latest
    name: deploy to KinD
    steps:
    - name: Start KinD
      uses: engineerd/setup-kind@v0.5.0
      with:
        version: "v0.17.0"
    - name: checkinfo
      run: |
       echo -e "Nods:\n$(kubectl get pods -A)" >> output_kind.log
       echo -e "KinD version:\n$(kubectl version --short)" >> output_kind.log
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
          path: output_kind.log

```
---
## minikube output
```
Nods:
NAMESPACE     NAME                               READY   STATUS        RESTARTS   AGE
kube-system   coredns-787d4945fb-4mhmx           1/1     Running       0          6s
kube-system   coredns-787d4945fb-rphgl           1/1     Terminating   0          6s
kube-system   etcd-minikube                      1/1     Running       0          19s
kube-system   kube-apiserver-minikube            1/1     Running       0          19s
kube-system   kube-controller-manager-minikube   1/1     Running       0          18s
kube-system   kube-proxy-9vqqg                   1/1     Running       0          6s
kube-system   kube-scheduler-minikube            1/1     Running       0          19s
kube-system   storage-provisioner                1/1     Running       0          4s
Minikube version:
Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.26.1
```
---
## KinD output
```
Nods:
NAMESPACE            NAME                                         READY   STATUS              RESTARTS   AGE
kube-system          coredns-565d847f94-cx8mn                     1/1     Running             0          9s
kube-system          coredns-565d847f94-hqqh9                     0/1     ContainerCreating   0          9s
kube-system          etcd-kind-control-plane                      1/1     Running             0          24s
kube-system          kindnet-qcq6x                                1/1     Running             0          9s
kube-system          kube-apiserver-kind-control-plane            1/1     Running             0          24s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running             0          24s
kube-system          kube-proxy-7vbfb                             1/1     Running             0          9s
kube-system          kube-scheduler-kind-control-plane            1/1     Running             0          24s
local-path-storage   local-path-provisioner-684f458cdd-qrwtb      0/1     ContainerCreating   0          9s
KinD version:
Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.25.3
```
---
![Timescreen](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/09.Kubernetes/time.png)

---
