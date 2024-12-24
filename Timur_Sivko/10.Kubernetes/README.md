## Homework Assignment 1. K8s Installation

Install kubectl for local run

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
```

Install k9s

```bash
brew install derailed/k9s/k9s
```

![Снимок экрана_2024-12-23_15-15-35.png](Снимок%20экрана_2024-12-23_15-15-35.png)

## Kubernetes host

```bash
minikube start
```

## Monitoring of cluster

Failed pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: failed-pod
spec:
  containers:
  - name: invalid-container
    image: invalid-image:latest
    command: ["sh", "-c", "exit 1"]f
```

Github action

[CI · Workflow runs · ostia27/10.Kubernetes · GitHub](https://github.com/ostia27/10.Kubernetes/actions/workflows/blank.yml)

```yaml
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the workflow will run
on:
  schedule:
  - cron: "0/30 * * * *"

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  check_pods:
    runs-on: self-hosted
    outputs:
      pod_status: ${{ steps.check.outputs.pod_status }}
    steps:
      - name: Check Kubernetes Pods
        id: check
        run: |
          pod=$(kubectl get pods -A --field-selector=status.phase!=Running -o json | jq '.items | length')
          echo "${pod}"
          echo "pod_status=${pod}" >> "$GITHUB_OUTPUT"
  notification:
    runs-on: ubuntu-latest
    needs: check_pods
    if: ${{ needs.check_pods.outputs.pod_status != '0'}}
    steps:
    - name: Post text to a Slack channel
      uses: slackapi/slack-github-action@v2.0.0
      with:
        method: chat.postMessage
        token: ${{ secrets.SLACK_BOT_TOKEN }}
        payload: |
          channel: ${{ secrets.SLACK_CHANNEL_ID }}
          text: "${{ needs.check_pods.outputs.pod_status }} crashed pods"
```

![Снимок экрана_2024-12-24_15-04-21.png](Снимок%20экрана_2024-12-24_15-04-21.png)
