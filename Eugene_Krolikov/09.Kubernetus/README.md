# 09.Kubernetes

## Links

[Github action](https://github.com/evkenny/09.Kube/actions/runs/4542616406)

## Yaml file

```yaml
name: Kube action

on: workflow_dispatch

jobs:
  deploy_kind:
    runs-on: ubuntu-latest
    name: Install KinD
    steps:
      - name: Start
        id: start
        run: echo "START_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Install KinD 
        uses: helm/kind-action@v1.4.0

      - name: Stop
        id: stop
        run: echo "END_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Result
        run: |           
          echo "Info:" >> KinD.log
          echo "$(kubectl version --short)" >> KinD.log
          echo "Node count: $(kubectl get nodes | grep -c 'Ready')" >> KinD.log
          difference=$(( ${{ steps.stop.outputs.END_TIME }} - ${{ steps.start.outputs.START_TIME }} ))
          echo "Installed in $difference seconds" >> KinD.log
          
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: KinD.log
  
  deploy_mnikube:
    runs-on: ubuntu-latest
    name: Install minikube
    steps:
      - name: Start
        id: start
        run: echo "START_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Install minikube
        uses: medyagh/setup-minikube@master

      - name: Stop
        id: stop
        run: echo "END_TIME=$(date '+%s')" >> $GITHUB_OUTPUT

      - name: Result
        run: |           
          echo "Info:" >> minikube.log
          echo "$(kubectl version --short)" >> minikube.log
          echo "Node count: $(kubectl get nodes | grep -c 'Ready')" >> minikube.log
          difference=$(( ${{ steps.stop.outputs.END_TIME }} - ${{ steps.start.outputs.START_TIME }} ))
          echo "Installed in $difference seconds" >> minikube.log

      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: minikube.log
```

## kind.log

[kind log](KinD.log)


## minikube.log

[kube log](minikube.log)