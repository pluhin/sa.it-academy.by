## 09.Kubernetes
#9ks.yaml
```bash
name: Deploy minikube and Kind
on:
  - push
concurrency: deploy   # This will run the jobs concurrently
jobs:
  deploy_minikube:
    runs-on: ubuntu-latest
    name: deploy to minikube
    steps:
    - name: Start minikube
      uses: medyagh/setup-minikube@master    # Switch to latest release instead of master
    - name: checkinfo
      run: |
       echo -e "Nods:\n$(kubectl get pods -A)" >> output_minikube.log
       echo -e "Minikube version:\n$(kubectl version --short)" >> output_minikube.log
    - name: Upload report
      uses: actions/upload-artifact@v2   # Use v2 as v3 is not available
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
      uses: actions/upload-artifact@v2   # Use v2 as v3 is not available
      with:
          path: output_kind.log
```
## Minikube
```
Nods:
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-787d4945fb-c5nrz           1/1     Running   0          53s
kube-system   etcd-minikube                      1/1     Running   0          65s
kube-system   kube-apiserver-minikube            1/1     Running   0          65s
kube-system   kube-controller-manager-minikube   1/1     Running   0          65s
kube-system   kube-proxy-zrg49                   1/1     Running   0          53s
kube-system   kube-scheduler-minikube            1/1     Running   0          67s
kube-system   storage-provisioner                1/1     Running   0          51s
Minikube version:
Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.26.1
```
## Kind
```
Nods:
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-565d847f94-6rr9t                     1/1     Running   0          10s
kube-system          coredns-565d847f94-v7zpq                     1/1     Running   0          10s
kube-system          etcd-kind-control-plane                      1/1     Running   0          27s
kube-system          kindnet-qqz64                                1/1     Running   0          10s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          25s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          25s
kube-system          kube-proxy-zgbgv                             1/1     Running   0          10s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          26s
local-path-storage   local-path-provisioner-684f458cdd-l4mrp      1/1     Running   0          10s
KinD version:
Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.25.3
```