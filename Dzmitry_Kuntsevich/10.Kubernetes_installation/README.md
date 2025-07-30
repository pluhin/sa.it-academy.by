## K8s pods screenshot

![K8s pods sreenshot](https://github.com/2Qic1/04.Github-actions/blob/refs/heads/kind/photo/k8s.jpg)

## K3s pods screenshot

![K3s pods sreenshot](https://github.com/2Qic1/04.Github-actions/blob/refs/heads/kind/photo/k3s.jpg)

'''
name: Check Pods
on:
  push:
    branches: [master]
jobs:
  build:
    name: build
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4
    - name: executing remote ssh commands using password
      id: check-pods
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
          kubectl get pods -A > output.log
          echo "crash-pods=$(kubectl get pods -A --context='k8s' | awk 'NR!=1 {print $4}' | grep -v 'Running' | wc -l)" >> $env:GITHUB_OUTPUT
    

    - name: SLack Notification.
      if: steps.check-pods.outputs.crash-pods != 0
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: qic
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: 'red'
        SLACK_USERNAME: rtCamp
        SLACK_TITLE: "Some pods have crashed"
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
'''


