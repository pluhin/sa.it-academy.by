## Deployment Minikube and KinD
```bash
name: Deployment Minikube and KinD
on: [push]
jobs:
  deploy_minikube:
    name: Deployment Minikube-Kubernetes Cluster
    runs-on: ubuntu-latest
    outputs:
     output1: ${{ steps.step1.outputs.step1 }}
    steps:
    - uses: actions/checkout@v2
    - name: Start depoloyment
      id: step1
      run: |
           echo "step1=$(date '+%s')" >> $GITHUB_OUTPUT
    - name: Start minikube
      uses: medyagh/setup-minikube@master
    - name: Try the cluster !
      run: |
           echo "Amount of pods: $(kubectl get pods -A)" >> report_minikube.log 
           echo "Version of minikube: $(kubectl version --short)" >> report_minikube.log
    - name: Average time for deployment
      run: |
           echo "Average time of deployment: $(($(date '+%s')-${{ steps.step1.outputs.step1 }})) seconds" >> report_minikube.log
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
          path: report_minikube.log
          
  deploy_kinD:
    needs: deploy_minikube
    runs-on: ubuntu-latest
    outputs:
     output2: ${{ steps.step2.outputs.step2 }}
    steps:
       - name: Start deployment KinD
         id: step2
         run: | 
              echo "step2=$(date '+%s')" >> $GITHUB_OUTPUT
       - name: Start Kind
         uses: engineerd/setup-kind@v0.5.0
         with:
          version: "v0.11.1"
       - name: Testing
         run: |
                echo "Kube version: $(kubectl version --short)" >> report_KinD.log
                echo "Amount of nodes: $(kubectl get nodes -A)" >> report_KinD.log
       - name: Average time for deployment
         run: |
           echo "Average time of deployment: $(($(date '+%s')-${{ steps.step2.outputs.step2 }})) seconds" >> report_KinD.log
    
       - name: Upload report
         uses: actions/upload-artifact@v3
         with:
          path: report_KinD.log
```
## Report files
### Report_minikube.log
```bash
Amount of pods: 
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-787d4945fb-f7rrg           1/1     Running   0          44s
kube-system   etcd-minikube                      1/1     Running   0          56s
kube-system   kube-apiserver-minikube            1/1     Running   0          56s
kube-system   kube-controller-manager-minikube   1/1     Running   0          56s
kube-system   kube-proxy-txzzl                   1/1     Running   0          44s
kube-system   kube-scheduler-minikube            1/1     Running   0          56s
kube-system   storage-provisioner                1/1     Running   0          42s
Version of minikube: 
Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.26.1
Average time of deployment: 117 seconds
```
### Report_KinD.log
```bash
Kube version:
Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.21.1
Amount of nodes: 
NAME                 STATUS   ROLES                  AGE   VERSION
kind-control-plane   Ready    control-plane,master   30s   v1.21.1
Average time of deployment: 75 seconds
```
## [Install.yaml](https://github.com/anton-bartoshevich/minikube_github_actions/blob/main/.github/workflows/minikube_install.yml)