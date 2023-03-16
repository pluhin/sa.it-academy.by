# Homework for 09.Kubernetes
## Slack notification screenshot

## GitHub Action for kinD
```bash
name: "Create cluster using KinD"
on: 
  push:

jobs:
  kind:
    runs-on: ubuntu-latest
    name: KinD
    steps:
      - name: Start time
        run: echo "start=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: KinD install
        uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.17.0"
      - name: how many nodes it have
        run: |
          echo -e "It have: $(kubectl get nodes | grep -c 'Ready') nodes" >> Kind.log
      - name: which latest version of Kubernetes it is using
        run: |
          echo -e "Kubernetes version of this cluster: $(kubectl version)" >> Kind.log
      - name: how long it spin up
        run: |
          echo -e "Spintime: $(date '+%s')-${{ steps.start.outputs.start }}" >> Kind.log
      - name: Upload artifact
        uses: actions/upload-artifact@v3
        with:
          path: Kind.log
```
## GitHub Action for minikube
```bash
name: "Create cluster using Minikube"
on: 
  push:

jobs:
  minikube:
    runs-on: ubuntu-latest
    name: Minikube
    steps:
      - name: Start time
        run: echo "start=$(date '+%s')" >> $GITHUB_OUTPUT
      - name: Minikube install
        uses: medyagh/setup-minikube@master
      - name: how many nodes it have
        run: |
          echo -e "It have: $(kubectl get nodes | grep -c 'Ready') nodes" >> minikube.log
      - name: which latest version of Kubernetes it is using
        run: |
          echo -e "Kubernetes version of this cluster: $(kubectl version)" >> minikube.log
      - name: how long it spin up
        run: |
          echo -e "Spintime: $(date '+%s')-${{ steps.start.outputs.start }}" >> minikube.log
      - name: Upload artifact
        uses: actions/upload-artifact@v3
        with:
          path: minikube.log
```
## Artifact for kinD
```bash
It have: 1 nodes
Kubernetes version of this cluster: Client Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.2", GitCommit:"fc04e732bb3e7198d2fa44efa5457c7c6f8c0f5b", GitTreeState:"clean", BuildDate:"2023-02-22T13:39:03Z", GoVersion:"go1.19.6", Compiler:"gc", Platform:"linux/amd64"}
Kustomize Version: v4.5.7
Server Version: version.Info{Major:"1", Minor:"25", GitVersion:"v1.25.3", GitCommit:"434bfd82814af038ad94d62ebe59b133fcb50506", GitTreeState:"clean", BuildDate:"2022-10-25T19:35:11Z", GoVersion:"go1.19.2", Compiler:"gc", Platform:"linux/amd64"}
Spintime: 1678965570-
```
## Artifact for minikube
```bash
It have: 1 nodes
Kubernetes version of this cluster: Client Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.2", GitCommit:"fc04e732bb3e7198d2fa44efa5457c7c6f8c0f5b", GitTreeState:"clean", BuildDate:"2023-02-22T13:39:03Z", GoVersion:"go1.19.6", Compiler:"gc", Platform:"linux/amd64"}
Kustomize Version: v4.5.7
Server Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.1", GitCommit:"8f94681cd294aa8cfd3407b8191f6c70214973a4", GitTreeState:"clean", BuildDate:"2023-01-18T15:51:25Z", GoVersion:"go1.19.5", Compiler:"gc", Platform:"linux/amd64"}
Spintime: 1678967374-
```