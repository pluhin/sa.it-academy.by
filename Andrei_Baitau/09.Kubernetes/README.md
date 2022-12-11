# 09.Kubernetes
## Links

[Kind action](https://github.com/AndreiBaitau/sa2-22-22-git/actions/runs/3669834856)

[Minikube action](https://github.com/AndreiBaitau/sa2-22-22-git/actions/runs/3669834847)


## KinD
### KinD yaml file

```yaml
name: KIND
on: push
jobs:
  kind_deployment:
    env:
      result_file: result.log
    outputs:
      output1: ${{ steps.time.outputs.time }}    
    runs-on: ubuntu-latest
    steps:
    - name: Start of deployment
      id: start_time
      run: |
        echo -e  "Start of kind deployment:\n$(date '+%T')\n" >> ${{ env.result_file }}
        echo "start_time=$(date '+%s')" >> $GITHUB_OUTPUT
    - name: Setup KinD
      uses: helm/kind-action@v1.4.0
    - name: End of deployment
      run: |
        echo -e "Finish deployment: \n$(date '+%T')\n" >> ${{ env.result_file }}
       
    - name: KinD info
      run: |
        echo -e "K8s version:\n$(kubectl version --short)" >> ${{ env.result_file }}
        echo -e "\nCount of nodes: $(kubectl get nodes | grep -c 'Ready')\n" >> ${{ env.result_file }}
        echo "Time nedeed for setup: $(($(date '+%s')-${{ steps.start_time.outputs.start_time }})) seconds" >> ${{env.result_file }}
    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: ${{ env.result_file}}
```

### artifact
```
Start of kind deployment:
16:30:09

Finish deployment: 
16:31:05

K8s version:
Client Version: v1.23.12
Server Version: v1.25.2

Count of nodes: 1

Time nedeed for setup: 56 seconds
```

## Minikube

### Minikube yaml file

```yaml
name: MINIKUBE
on: push
jobs:
  minikube_deployment:
    env:
      result_file: result.log
    outputs:
      output1: ${{ steps.time.outputs.time }}
    runs-on: ubuntu-latest
    steps:
    - name: Start of deployment
      id: start_time
      run: |
        echo -e  "Start of minikube deployment:\n$(date '+%T')\n" >> ${{ env.result_file }}
        echo "start_time=$(date '+%s')" >> $GITHUB_OUTPUT
      
    - name: Setup  minikube
      id: minikube
      uses: medyagh/setup-minikube@latest
    - name: End of minikube deploy
      run: |
        echo -e "Finish of minikube deployment:\n$(date '+%T')\n" >> ${{ env.result_file }}
    - name: Minicube info
      run: |
        echo -e "K8s version:\n$(kubectl version --short)\n" >> ${{ env.result_file }}
        echo -e "\nCount of nodes: $(kubectl get nodes | grep -c 'Ready')" >> ${{ env.result_file }}
        echo -e "\n Time nedeed for setup: $(($(date '+%s')-${{ steps.start_time.outputs.start_time }})) seconds" >> ${{env.result_file}}
    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: ${{ env.result_file}}

```

### artifact
```log
SStart of minikube deployment:
16:30:08

Finish of minikube deployment:
16:32:14

K8s version:
Client Version: v1.25.4
Kustomize Version: v4.5.7
Server Version: v1.25.3


Count of nodes: 1

 Time nedeed for setup: 126 seconds

```

## Result 

> Kube setup is faster '(~56sec)' then minikube '(~126sec)'