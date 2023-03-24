# 09.Kubernetes

## Links

[Github](https://github.com/igortank/MyRepository)

[Github action](https://github.com/igortank/MyRepository/actions/runs/4454995091)

## Yaml file

```yaml
name: Kubernetes action!

on: workflow_dispatch

jobs:
  deploy_kind:
    runs-on: ubuntu-latest
    name: Deploy KinD
    steps:
      - name: Start
        id: start
        run: echo "START_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Deploy KinD 
        uses: helm/kind-action@v1.4.0

      - name: Stop
        id: stop
        run: echo "END_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Result
        run: |           
          echo "Version:" >> kind.log
          echo "$(kubectl version --short)" >> kind.log
          echo "Node count: $(kubectl get nodes | grep -c 'Ready')" >> kind.log
          difference=$(( ${{ steps.stop.outputs.END_TIME }} - ${{ steps.start.outputs.START_TIME }} ))
          echo "Deployed $difference seconds" >> kind.log
          
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: kind.log
  
  deploy_mnikube:
    runs-on: ubuntu-latest
    name: Deploy minikube
    steps:
      - name: Start
        id: start
        run: echo "START_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Deploy minikube
        uses: medyagh/setup-minikube@master

      - name: Stop
        id: stop
        run: echo "END_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Result
        run: |           
          echo "Version:" >> minikube.log
          echo "$(kubectl version --short)" >> minikube.log
          echo "Node count: $(kubectl get nodes | grep -c 'Ready')" >> minikube.log
          difference=$(( ${{ steps.stop.outputs.END_TIME }} - ${{ steps.start.outputs.START_TIME }} ))
          echo "Deployed $difference seconds" >> minikube.log

      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: minikube.log
```

## kind.log

```log
Version:
Client Version: v1.23.12
Server Version: v1.25.2
Node count: 1
Deployed 61 seconds
```


## minikube.log

```log
Version:
Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.26.1
Node count: 1
Deployed 135 seconds
```
