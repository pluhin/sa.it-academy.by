### 09.k8s


### Deploy minikube

## Log file after deploy
```bash
Current date and time before deploy is:
12:48:26-2022-12-12

Current date and time after deploy is:
12:50:12-2022-12-12

nodes: 1
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   29s   v1.25.3

Versions of k8s:
Client Version: v1.25.4
Kustomize Version: v4.5.7
Server Version: v1.25.3
  ```

## minikube.yaml
```bash
name: deploy minikube in github action

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    name: deploy minikube
    steps:
    - name: Get current date and time before deploy
      id: current_time_bd
      run: |
        echo -e "Current date and time before deploy is:\n$(date +'%T-%Y-%m-%d')\n" >> report.log 2>&1
      
    - name: Setup  minikube
      uses: medyagh/setup-minikube@latest
      
    - name: Get current date and time after deploy
      id: current_time_ad
      run: |
        echo -e "Current date and time after deploy is:\n$(date +'%T-%Y-%m-%d')\n" >> report.log 2>&1
        
    - name: Get info from minikube
      run: |
        echo -e "nodes: $(kubectl get nodes | grep -c 'Ready')" >> report.log 2>&1
        echo -e "$(kubectl get nodes)\n" >> report.log 2>&1
        echo -e "Versions of k8s:\n$(kubectl version --short)\n" >> report.log 2>&1      
        
    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: report.log
```


### Deploy KinD

## Log file after deploy
```bash
Current date and time before deploy is:
12:41:11-2022-12-12

Current date and time after deploy is:
12:42:07-2022-12-12

nodes: 1
NAME                          STATUS   ROLES           AGE   VERSION
chart-testing-control-plane   Ready    control-plane   24s   v1.25.2

Versions of k8s:
Client Version: v1.23.12
Server Version: v1.25.2
```

## KinD.yaml
```bash
name: deploy KinD in github action

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    name: deploy KinD
    steps:
    - name: Get current date and time before deploy
      id: current_time_bd
      run: |
        echo -e "Current date and time before deploy is:\n$(date +'%T-%Y-%m-%d')\n" >> report.log 2>&1
        echo "ct=$(date +'%T-%Y-%m-%d')"
   
    - name: Setup KinD
      uses: helm/kind-action@v1.4.0
      
    - name: Get current date and time after deploy
      id: current_time_ad
      run: |
        echo -e "Current date and time after deploy is:\n$(date +'%T-%Y-%m-%d')\n" >> report.log 2>&1
        
    - name: Get info from KinD
      run: |
        echo -e "nodes: $(kubectl get nodes | grep -c 'Ready')" >> report.log 2>&1
        echo -e "$(kubectl get nodes)\n" >> report.log 2>&1
        echo -e "Versions of k8s:\n$(kubectl version --short)\n" >> report.log 2>&1      
        
    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: report.log
```

### Url Github actions
Github actions (https://github.com/Pavel167988/k8sdeploytest/actions);



