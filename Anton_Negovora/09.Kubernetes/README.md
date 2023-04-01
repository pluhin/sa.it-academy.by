# 09.Kubernetes

## action.yaml

```yaml
name: Deploying minikube and KinD
on:
  - push
  - pull_request
jobs:
  deploy_minikube:
    runs-on: ubuntu-latest
    name: minikube
    steps:
    - name: Install minikube
      uses: medyagh/setup-minikube@master
    - name: check_info
      run: |
       echo -e "Nods:\n$(kubectl get pods -A)" >> minikube.log
       echo -e "Minikube version:\n$(kubectl version --short)" >> minikube.log
       echo -e "Spintime: $(date '+%s')-${{ steps.start.outputs.start }}" >> minikube.log
    - name: Upload artifact
      uses: actions/upload-artifact@v3
      with:
          path: minikube.log

  deploy_KinD:
    runs-on: ubuntu-latest
    name: KinD
    steps:
    - name: Install KinD
      uses: engineerd/setup-kind@v0.5.0
      with:
        version: "v0.17.0"
    - name: check_info
      run: |
       echo -e "Nods:\n$(kubectl get pods -A)" >> kind.log
       echo -e "KinD version:\n$(kubectl version --short)" >> kind.log
       echo -e "Spintime: $(date '+%s')-${{ steps.start.outputs.start }}" >> Kind.log
    - name: Upload artifact
      uses: actions/upload-artifact@v3
      with:
          path: kind.log
```

## minikube log

```bash
Nods:
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-787d4945fb-djz2s           1/1     Running   0          64s
kube-system   etcd-minikube                      1/1     Running   0          77s
kube-system   kube-apiserver-minikube            1/1     Running   0          77s
kube-system   kube-controller-manager-minikube   1/1     Running   0          77s
kube-system   kube-proxy-qhkfd                   1/1     Running   0          65s
kube-system   kube-scheduler-minikube            1/1     Running   0          77s
kube-system   storage-provisioner                1/1     Running   0          63s
Minikube version:
Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.26.1
Spintime: 1680351288-
```

## KinD log

```bash
Nods:
NAMESPACE            NAME                                         READY   STATUS              RESTARTS   AGE
kube-system          coredns-565d847f94-drdzm                     0/1     ContainerCreating   0          7s
kube-system          coredns-565d847f94-mm2r9                     0/1     ContainerCreating   0          7s
kube-system          etcd-kind-control-plane                      1/1     Running             0          23s
kube-system          kindnet-2x262                                1/1     Running             0          7s
kube-system          kube-apiserver-kind-control-plane            1/1     Running             0          22s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running             0          22s
kube-system          kube-proxy-cbmcf                             1/1     Running             0          7s
kube-system          kube-scheduler-kind-control-plane            1/1     Running             0          22s
local-path-storage   local-path-provisioner-684f458cdd-b5bmw      0/1     ContainerCreating   0          7s
KinD version:
Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.25.3
```
