#
# 10. Kubernetes installation (WS)
#

### k9s screen k3s

![k3s](https://github.com/YauheniKastsevich/my_pictures/blob/master/k3s.png)

### k9s screen k8s

![k8s](https://github.com/YauheniKastsevich/my_pictures/blob/master/k8s.png)

### Workflow for check crashed pods:
``` yaml
name: Check Pods
on: [push , workflow_dispatch ]
jobs:
  build:
    name: build
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: executing remote ssh commands using password
      id: check-pods
      uses: appleboy/ssh-action@v1.0.3
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
          kubectl get pods -A > output.log
          echo "crash-pods=$(kubectl get pods -A --context='k8s' | awk 'NR!=1 {print $4}' | grep -v 'Running' | wc -l)" >> $env:GITHUB_OUTPUT
    
    - name: SLack Notification.
      if: steps.check-pods.outputs.crash-pods != 0
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: tests
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: 'red'
        SLACK_USERNAME: rtCamp
        SLACK_TITLE: "Some pods have crashed"
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
