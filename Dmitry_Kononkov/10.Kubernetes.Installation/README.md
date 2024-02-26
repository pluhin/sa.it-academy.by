# Homework Assignment 1. K8s Installation
## k9s screen - k3s:
![k3s](https://raw.githubusercontent.com/ussnorma/Git.Hosting.03/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-21%20%D0%B2%2022.06.01.png)

## k9s screen - k8s:
![k8s](https://raw.githubusercontent.com/ussnorma/Git.Hosting.03/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-02-21%20%D0%B2%2022.07.08.png)

## Github action to check crashed pods:
```yaml
name: Check Pods
on:
  push:
    branches: [main]
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