# Deploy compact k8s cluster in github action

## Link to Github Action
[Github action](https://github.com/OksanaDemidovec/md-sa2-23-23-github/actions/runs/4632864294)

## File yaml for Github action
```yaml
name: Deploy_Minikube_KinD.yaml
on:
  - push
jobs:
  job1:
    runs-on: ubuntu-latest
    name: minikube
    steps:
      - uses: actions/checkout@v2
      - name: start_time_minikube
        id: start_time_minikube
        run: |
          echo "start_time=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Deploy minikube
        uses: medyagh/setup-minikube@latest
      - name: end_time_minikube
        id: end_time_minikube
        run: |
          echo "end_time=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Check minikube
        run: |
          echo "$(kubectl get node)"
          echo "Number of nodes: $(($(kubectl get node | wc -l) - 1))" > minikube.logs
          echo "Version: $(kubectl version --short)" >> minikube.logs
          echo "Time: $((${{steps.end_time_minikube.outputs.end_time}} - ${{steps.start_time_minikube.outputs.start_time}})) seconds"  >> minikube.logs
      - name: Logs for Deploy Minikube
        uses: actions/upload-artifact@v3
        with:
          path: minikube.logs
      - name: start_time_kind
        id: start_time_kind
        run: |
          echo "start_time_k=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Deploy KinD
        uses: container-tools/kind-action@v1
      - name: end_time_kind
        id: end_time_kind
        run: |
          echo "end_time_k=$(date '+%s')" >> $GITHUB_OUTPUT  
      - name: Check KinD   
        run: |
          echo "Number of nodes: $(($(kubectl get node | wc -l) - 1))" > kind.logs
          echo "Version: $(kubectl version --short)" >> kind.logs
          echo "Time: $((${{steps.end_time_kind.outputs.end_time_k}} - ${{steps.start_time_kind.outputs.start_time_k}})) seconds"  >> kind.logs
      - name: Logs for Deploy KinD
        uses: actions/upload-artifact@v3
        with:
          path: kind.logs
```
## Artifacts

### Minikube
```bash
Number of nodes: 1
Version: Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.26.3
Time: 81 seconds
```
### KinD
```bash
Number of nodes: 1
Version: Client Version: v1.21.1
Server Version: v1.21.1
Time: 80 seconds
```
