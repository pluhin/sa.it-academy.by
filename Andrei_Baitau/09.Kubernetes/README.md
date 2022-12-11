# 09.Kubernetes
## Links

[Kind action](https://github.com/AndreiBaitau/sa2-22-22-git/actions/runs/3669610991)

[Minikube action](https://github.com/AndreiBaitau/sa2-22-22-git/actions/runs/3669610992)


## KinD
### KinD yaml file

```yaml
name: KIND
on: push
jobs:
  kind_deployment:
    env:
      result_file: result.log
    runs-on: ubuntu-latest
    steps:
    - name: Start of deployment
      run: |
        echo -e  "Start of kind deployment:\n$(date '+%T')\n" >> ${{ env.result_file }}
    - name: Create k8s Kind Cluster
      uses: helm/kind-action@v1.4.0
    - name: End of deployment
      run: |
        echo -e "Finish deployment: \n$(date '+%T')\n" >> ${{ env.result_file }}

    - name: kubernetes info
      run: |
        echo -e "K8s version:\n$(kubectl version --short)" >> ${{ env.result_file }}
        echo -e "\nNodes information:" >> ${{ env.result_file }}
        echo "$(kubectl get nodes)" >> ${{ env.result_file }}

    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: ${{ env.result_file}}
```

### artifact
```log
Start of kind deployment:
15:25:43

Finish deployment: 
15:26:45

K8s version:
Client Version: v1.23.12
Server Version: v1.25.2

Nodes information:
NAME                          STATUS   ROLES           AGE   VERSION
chart-testing-control-plane   Ready    control-plane   25s   v1.25.2
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
    runs-on: ubuntu-latest
    steps:
    - name: Start of minikube deployment
      run: |
        echo -e "Start of minikube deployment:\n  $(date '+%T')\n" >> ${{ env.result_file }}
    - name: setup  minikube
      id: minikube
      uses: medyagh/setup-minikube@latest
    - name: End of minikube deploy
      run: |
        echo -e "Finish of minikube deployment:\n $(date '+%T')\n" >> ${{ env.result_file }}
    - name: kubernetes info
      run: |
        echo -e "K8s version:\n$(kubectl version --short)\n" >> ${{ env.result_file }}
        echo -e "Nodes information:" >> ${{ env.result_file }}
        echo "$(kubectl get nodes)" >> ${{ env.result_file }}

    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: ${{ env.result_file}}
```

### artifact
```log
Start of minikube deployment:
  15:25:41

Finish of minikube deployment:
 15:28:14

K8s version:
Client Version: v1.25.4
Kustomize Version: v4.5.7
Server Version: v1.25.3

Nodes information:
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   65s   v1.25.3

```

## Result 

> Kube setup is faster '(~60sec)' then minikube '(~150sec)'