# 09.Kubernetes

## Action file
 
### action.yaml

```bash
---
name: deployment KinD and minikube
on: [push]
jobs:
  job1_deploy_kind:
    runs-on: ubuntu-latest
    outputs:
      output1: ${{ steps.step1.outputs.time }}
    steps:
      - name: start time      
        id: step1
        run: echo "time=$(date '+%s')" >> "$GITHUB_OUTPUT"
      - name: install kind
        uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.17.0"
      - name: check info
        run: |
          echo "count of nodes: $(kubectl get nodes | grep -c 'NAME')" >> kind_report.log
          echo "kind version: $(kubectl version --short)" >> kind_report.log
          echo "time spent on deployment: $(($(date '+%s')-${{ steps.step1.outputs.time }}))" >> kind_report.log
      - name: upload report
        uses: actions/upload-artifact@v2
        with:
          path: kind_report.log

  job2_deploy_minikube:
    runs-on: ubuntu-latest
    outputs:
      output1: ${{ steps.step1.outputs.time }}
    steps:
      - name: start time
        id: step1
        run: echo "time=$(date '+%s')" >> "$GITHUB_OUTPUT"
      - name: install minikube
        uses: medyagh/setup-minikube@latest
        with:
          minikube-version: latest
      - name: check info
        run: |
          echo "count of nodes: $(kubectl get nodes | grep -c 'NAME')" >> minikube_report.log
          echo "minikube version: $(minikube version --short)" >> minikube_report.log
          echo "time spent on deployment: $(($(date '+%s')-${{ steps.step1.outputs.time }}))" >> minikube_report.log
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: minikube_report.log

```

## Output files

### kind_report.log

```bash
count of nodes: 1
kind version: Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.25.3
time spent on deployment: 58
```

### minikube_report.log

```bash
count of nodes: 1
minikube version: v1.29.0
time spent on deployment: 129
``` 
