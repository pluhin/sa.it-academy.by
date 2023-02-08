# KinD and Minikube yaml

```yaml
name: "Create clusters using KinD and Minikube"
on: [pull_request, push]

jobs:
  kind:
    runs-on: ubuntu-latest
    outputs:
      output1: ${{ steps.info.outputs.info }}
      output2: ${{ steps.time.outputs.time }}
    steps:
      - name: Set start timestamp
        id: time
        run: echo "time=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: KinD Cluster setup
        uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.16.0"
      - name: KinD info
        id: info
        env:
          result_file: result.txt
        run: |
         echo "info<<EOF" >> $GITHUB_OUTPUT
         echo -e "KinD kubernetes version:\n$(kubectl version --short)" >> $GITHUB_OUTPUT
         echo -e "Nodes info:\n$(kubectl get nodes)" >> $GITHUB_OUTPUT
         echo "Count of nodes:$(kubectl get nodes | grep -c 'Ready')" >> $GITHUB_OUTPUT
         echo "The time elapsed:$(($(date '+%s')-${{ steps.time.outputs.time }})) seconds" >> $GITHUB_OUTPUT
         echo "EOF" >> $GITHUB_OUTPUT
  minikube:
    needs: kind
    runs-on: ubuntu-latest
    env:
      report: report.txt
    outputs:
      output3: ${{ steps.time2.outputs.time2 }}
    steps:
    - name: Set start timestamp
      id: time2
      run: echo "time2=$(date '+%s')" >> $GITHUB_OUTPUT
    - name: start minikube
      id: minikube
      uses: medyagh/setup-minikube@latest
    - name: Minikube info
      run: |
        echo -e "${{needs.kind.outputs.output1}}\n" >> ${{ env.report }}
        echo -e "Minikube kubernetes version:\n$(kubectl version --short)" >> ${{ env.report }}
        echo -e "Nodes info:\n$(kubectl get nodes)" >> ${{ env.report }}
        echo "Count of nodes:$(kubectl get nodes | grep -c 'Ready')" >> ${{ env.report }}
        echo "The time elapsed is $(($(date '+%s')-${{ steps.time2.outputs.time2 }})) seconds" >> ${{ env.report }}
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
        path: ${{ env.report }}
```
## Report

```
KinD kubernetes version:
Client Version: v1.26.0
Kustomize Version: v4.5.7
Server Version: v1.25.2
Nodes info:
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   27s   v1.25.2
Count of nodes:1
The time elapsed:60 seconds

Minikube kubernetes version:
Client Version: v1.26.0
Kustomize Version: v4.5.7
Server Version: v1.25.3
Nodes info:
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   21s   v1.25.3
Count of nodes:1
The time elapsed is 84 seconds

```
[GitHub Actions](https://github.com/AliaksandrDub/09.k8s/actions)