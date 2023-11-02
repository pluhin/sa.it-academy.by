# 10. Kubernetes installation (WS)

## Screen k9s with pod ubuntu
![Alt text](https://github.com/jankalep/10.-Kubernetes-installation-WS-/blob/master/k9s-n-pod.png)

## Github action for checking nodes in server

[![.github/workflows/check-pods.yaml](https://github.com/jankalep/10.-Kubernetes-installation-WS-/actions/workflows/check-pods.yaml/badge.svg)](https://github.com/jankalep/10.-Kubernetes-installation-WS-/actions/workflows/check-pods.yaml)

```yaml
on: workflow_dispatch

jobs:
  check-pods:
    runs-on: ubuntu-latest
    steps:
    - name: Connect to K3s host
      run: |
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.SSH_KEY }}"
        ssh-keyscan -p 32510 ${{ secrets.JUMP_HOST }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510 ssh-keyscan ${{ secrets.HOST_IP }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510" ${{ secrets.HOST_USER }}@${{ secrets.HOST_IP }} "kubectl get pods -A" >> init_pods.log
    - name: Get status pods
      id: status-pods
      run:
         echo "pods-crashed=$(cat init_pods.log | grep -v 'Running\|Completed ' | wc -l)"
         echo "pods-crashed=$pods_crashed"
    
    - name: Uplod status pods
      if: steps.check-pods.outputs.pods-crashed != 1
      uses: actions/upload-artifact@v3
      with:
        name: Status Pods
        path: init_pods.log

    - name: Notify Slack on failure
      if: steps.check-pods.outputs.pods-crashed != 1
      uses: rtCamp/action-slack-notify@v2
      env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          SLACK_COLOR: 'red'
          SLACK_CHANNEL: test
          SLACK_MESSAGE: "WARNING! Pods crashed or Unruning!"

```

Screen of successfull Slack notification on pods failure
![Alt text](https://github.com/jankalep/10.-Kubernetes-installation-WS-/blob/master/Work_Action.png)

