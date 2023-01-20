### Links
[Repository](https://github.com/mhryhoryeu/kind-vs-minikube)

[Actions](https://github.com/mhryhoryeu/kind-vs-minikube/actions)

[Report](https://github.com/mhryhoryeu/kind-vs-minikube/suites/10374117866/artifacts/511735483)


### Github actions file
```yaml
name: Kind vs Minikube

on:
  push:
    branches:
      - master

jobs:
  minikube:
    runs-on: ubuntu-latest
    outputs:
      output1: ${{ steps.time.outputs.time }}
    env:
      report-file: minikube-report.log
    steps:
      - name: Set start time
        id: start-time
        run: |
          echo "start-time=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Install minikube
        id: minikube
        uses: medyagh/setup-minikube@latest
      - name: Minicube info
        run: |
          echo -e "The deployment of minicube took $(($(date '+%s')-${{ steps.start-time.outputs.start-time }})) seconds\n" >> ${{env.report-file}}
          echo -e "K8s version:\n$(kubectl version --short)\n" >> ${{ env.report-file }}
          echo -e "Count of nodes: $(kubectl get nodes | grep -c 'Ready')" >> ${{ env.report-file }}
      - name: Upload report
        uses: actions/upload-artifact@3
        with:
          path: ${{ env.report-file}}
  kind:
    runs-on: ubuntu-latest
    outputs:
      output1: ${{ steps.time.outputs.time }}
    env:
      report-file: kind-report.log
    steps:
      - name: Set start time
        id: start-time
        run: |
          echo "start-time=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Install KinD
        uses: helm/kind-action@v1.4.0
      - name: KinD info
        run: |
          echo -e "The deployment of KinD took $(($(date '+%s')-${{ steps.start-time.outputs.start-time }})) seconds\n" >> ${{env.report-file}}
          echo -e "K8s version:\n$(kubectl version --short)\n" >> ${{ env.report-file }}
          echo -e "Count of nodes: $(kubectl get nodes | grep -c 'Ready')" >> ${{ env.report-file }}
      - name: Upload report
        uses: actions/upload-artifact@3
        with:
          path: ${{ env.report-file}}
```

### Result
#### KinD
```
The deployment of KinD took 56 seconds

K8s version:
Client Version: v1.23.12
Server Version: v1.25.2

Count of nodes: 1
```
#### Minikube
```
The deployment of minicube took 132 seconds

K8s version:
Client Version: v1.26.0
Kustomize Version: v4.5.7
Server Version: v1.25.3

Count of nodes: 1

```
