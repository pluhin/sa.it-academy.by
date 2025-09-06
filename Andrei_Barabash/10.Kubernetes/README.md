## 1: K3s 

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/10.Kubernetes/k3s.png "k3s")

## 2: k8s-cluster

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/10.Kubernetes/k8s-cluster.png "k8s-cluster")

## 3: Check pods 

```
name: Check Pods

on:
  push:
    branches: [main]

jobs:
  check_pods:
    name: Check remote pods
    runs-on: ubuntu-latest
    outputs:
      crashed_pods_count: ${{ steps.check_crashed_pods.outputs.crashed_pods_count }}

    steps:
     - name: Check out the repopository
       uses: actions/checkout@v4
       
    - name: Executing remote ssh commands using password
      id: check_pods
      uses: appleboy/ssh-action@v1.2.2
      with:
        proxy_host: ${{ secrets.BASTION_IP }}
        proxy_port: ${{ secrets.BASTION_PORT }}
        proxy_username: ${{ secrets.BASTION_USER }}
        proxy_password: ${{ secrets.BASTION_PASS }}
        host: ${{ secrets.SERVER_IP }}
        port: ${{ secrets.SERVER_PORT }}
        username: ${{ secrets.SERVER_USER }}
        password: ${{ secrets.SERVER_PASS }}
        script: |
          echo "crashed_pods_count=$(kubectl get pods -A | awk 'NR!=1 {print $4}' | grep -v 'Running' | wc -l)" >> "$GITHUB_OUTPUT"
          
    - name: Print crashed pods number
      run: |
        echo "Number of crashed pods: ${{ steps.check_crashed_pods.outputs.crashed_pods_count }}"

    - name: SLack Notification.
      if: steps.check_crashed_pods.outputs.crashed_pods_count > 0
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: test-notification
        SLACK_COLOR: 'red'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: Some of pods have crashed
        SLACK_TITLE: Pods issue
        SLACK_USERNAME: test
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
```
