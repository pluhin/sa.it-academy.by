### Homework 09.Kubernetes by Karabanovich Pavel

#### Create workflow file  action.Kind.Minikube.yml 

```bash

name: Deploy KinD and Minikube clusters and get clusters info
on: [push]

jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: engineerd/setup-kind@v0.5.0
        with:
         version: "v0.11.1"
      - name: Show cluster info
        run: |
          echo "You successfuly deploy Kind claster with $(kubectl get nodes -->
          kubectl get nodes --no-headers
  minikube:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: medyagh/setup-minikube@latest
        with:
          minikube_version: "v1.23.2"
      - name: Start Minikube
        run: |
          minikube start
      - name: Show cluster info
        run: |
          echo "You successfuly deploy Minikube claster with $(kubectl get nodes -->
          kubectl get nodes --no-headers

```

#### GitHub action output

```bash
Show claster info
Run echo "You successfuly deploy Kind claster with $(kubectl get nodes --no-headers | wc -l) nodes"
You successfuly deploy Kind claster with 1 nodes
kind-control-plane   Ready   control-plane,master   33s   v1.21.1

Show claster info
Run echo "You successfuly deploy Kind claster with $(kubectl get nodes --no-headers | wc -l) nodes"
You successfuly deploy Kind claster with 1 nodes
minikube   Ready   control-plane   76s   v1.26.3

```
