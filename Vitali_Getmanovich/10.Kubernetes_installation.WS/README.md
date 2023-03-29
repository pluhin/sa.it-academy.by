# 10. Kubernetes installation (WS)

# yaml file

```yaml
name: Check status pods

on:
  workflow_dispatch

env:
  output: output.log
  report_fail: report_fail.log

jobs:
  check:
    name: Check status pods K3s
    runs-on: ubuntu-latest

    steps:
    - name: Connect to server with K3s
      run: |
        which ssh-agent
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{secrets.SSH_KEY}}"
        ssh-keyscan -H ${{ secrets.JUMP_SERVER }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USER }}@${{ secrets.JUMP_SERVER }} ssh-keyscan ${{ secrets.HOST }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USER }}@${{ secrets.JUMP_SERVER }}" ${{ secrets.HOST_USER }}@${{ secrets.HOST }} \
        kubectl get pods -A >> output

    - name: check status pods
      id: check_status_pods
      run: |
        echo "$(cat output | grep -v Running)" >> report_fail
        echo "pods_failed=$(cat output | grep -v Running | wc -l)" >> $GITHUB_OUTPUT

    - name: Info about failed pods
      uses: actions/upload-artifact@v3
      with:
        path: report_fail

    - name: Slack notification
      if: steps.check_status_pods.outputs.pods_failed > 1
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANEL: kuberreport
        SLACK_COLOR: 'green'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: 'Your pods failed'
        SLACK_TITLE: 'Bad news'
        SLACK_USERNAME: rtCamp
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
---
## [Link to Github Action](https://github.com/VitaliGet/10.K8S.WS/actions/workflows/check_status_pods.yaml)

---

## Print-screen of k9s with pods in all namespaces

![screenK9s](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/10.Kubernetes_installation.WS/screen_K9s.png)

---
## Print-screen slack notification

![slackscreen](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/10.Kubernetes_installation.WS/notification_failed_pods.png)

---
