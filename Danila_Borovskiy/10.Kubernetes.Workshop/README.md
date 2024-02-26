## 10.Kubernetes.Workshop

```yaml
name: Check k8s pod errors and Notify

on:
  workflow_dispatch:

jobs:
  check-pods-and-notify:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Connect to remote and get pod stats
        id: get-pod-stats
        uses: appleboy/ssh-action@v1.0.3
        with:
          proxy_host: ${{ secrets.SSH_PROXY_HOST }}
          proxy_username: ${{ secrets.SSH_PROXY_USERNAME }}
          proxy_password: ${{ secrets.SSH_PROXY_PASSWORD }}
          proxy_port: ${{ secrets.SSH_PROXY_PORT }}
          host: ${{ secrets.SSH_HOST }}
          username: ${{ secrets.SSH_USERNAME }}
          password: ${{ secrets.SSH_PASSWORD }}
          port: ${{ secrets.SSH_PORT }}
          script: |
            echo "$(kubectl get pods -A --field-selector=status.phase!=Running --no-headers=true --output='custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase')" > error_pods.log

      - name: Copy logs file from remote
        uses: nicklasfrahm/scp-action@main
        with:
          direction: download
          proxy_host: ${{ secrets.SSH_PROXY_HOST }}
          proxy_username: ${{ secrets.SSH_PROXY_USERNAME }}
          proxy_key: ${{ secrets.SSH_PROXY_KEY }}
          proxy_port: ${{ secrets.SSH_PROXY_PORT }}
          host: ${{ secrets.SSH_HOST }}
          username: ${{ secrets.SSH_USERNAME }}
          key: ${{ secrets.SSH_KEY }}
          port: ${{ secrets.SSH_PORT }}
          insecure_ignore_fingerprint: true
          proxy_fingerprint: true
          insecure_proxy_ignore_fingerprint: true
          source: "/root/error_pods.log"
          target: "./error_pods.log"

      - name: Read log File and Save to Environment Variable
        id: read-log-file
        run: |
          echo "error_pods_count=$(cat error_pods.log | wc -l)" >> $GITHUB_OUTPUT
          echo "error_pods_message=$(cat error_pods.log)" >> $GITHUB_OUTPUT

      - name: Slack Error Notification
        if: steps.read-log-file.outputs.error_pods_count != 0
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: md-sa2-27-24-danila-borovskiy-test-notifications
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: ${{ steps.get-pod-stats.outputs.error_pods_message }}
          SLACK_COLOR: 'red'
          SLACK_USERNAME: rtCamp
          SLACK_TITLE: "Pods with error have been detected!"
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

      - name: Slack Success Notification
        if: steps.read-log-file.outputs.error_pods_count == 0
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: md-sa2-27-24-danila-borovskiy-test-notifications
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_COLOR: 'green'
          SLACK_USERNAME: rtCamp
          SLACK_TITLE: "All pods work fine!"
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
