# Homework for 09.Kubernetes
---
## Deploy
```bash
name: Kubernetes

on:
  push:

jobs:
  deploy:
    env:
      result_kind: kind.log
      result_minikube: minikube.log
    outputs:
      output1: ${{ steps.time.outputs.time }}    
    runs-on: ubuntu-latest

    steps:

    - name: Start time Kind
      id: start_time
      run: |
        echo -e  "Start time Kind:\n$(date '+%T')\n" >> ${{ env.result_kind }}
        echo "start_time=$(date '+%s')" >> $GITHUB_OUTPUT
    - name: Create k8s Kind Cluster
      uses: helm/kind-action@v1.4.0

    - name: End time Kind
      run: |
        echo -e "End time Kind: \n$(date '+%T')\n" >> ${{ env.result_kind }}
    - name: result generation
      run: |
        echo -e "Version Kind:\n$(kubectl version --short)" >> ${{ env.result_kind }}
        echo -e "\nCount of nodes Kind: $(kubectl get nodes | grep -c 'Ready')\n" >> ${{ env.result_kind }}
        echo "Time install Kind: $(($(date '+%s')-${{ steps.start_time.outputs.start_time }})) seconds" >> ${{env.result_kind }}
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
        path: ${{ env.result_kind}}
  
    - name: Start time minikube
      run: |
        echo -e  "Start time minikube:\n$(date '+%T')\n" >> ${{ env.result_minikube }}
        echo "start_time=$(date '+%s')" >> $GITHUB_OUTPUT
    - name: start minikube
      uses: medyagh/setup-minikube@latest

    - name: End time minikube
      run: |
        echo -e "End time minikube: \n$(date '+%T')\n" >> ${{ env.result_minikube }}
    - name: result generation
      run: |
        echo -e "Version:\n$(kubectl version --short)" >> ${{ env.result_minikube }}
        echo -e "\nCount of nodes minikube: $(kubectl get nodes | grep -c 'Ready')\n" >> ${{ env.result_minikube }}
        echo "Time install minikube: $(($(date '+%s')-${{ steps.start_time.outputs.start_time }})) seconds" >> ${{env.result_minikube }}
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
        path: ${{ env.result_minikube}}   
```
## kind.log
```bash
Start time Kind:
14:01:05

End time Kind: 
14:02:07

Version Kind:
Client Version: v1.23.12
Server Version: v1.25.2

Count of nodes Kind: 1

Time install Kind: 62 seconds
```
## minikube.log
```bash
Start time minikube:
14:02:07

End time minikube: 
14:03:34

Version:
Client Version: v1.23.12
Server Version: v1.26.1

Count of nodes minikube: 1

Time install minikube: 149 seconds
```

[>> GitHub Action <<](https://github.com/svvsvv/09.Kubernetes/actions/runs/4461051981)