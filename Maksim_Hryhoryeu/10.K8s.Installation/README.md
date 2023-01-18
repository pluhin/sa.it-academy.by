### Links
[Repository](https://github.com/mhryhoryeu/check-k3s-pods)

[Actions](https://github.com/mhryhoryeu/check-k3s-pods/actions)

### Github actions file
```yaml
name: Check pods

on:
  schedule:
    - cron: '*/3 * * * *'

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      report-file: report.log
    steps:
      - name: Connect to k3s host
        id: get-pods
        run: |
          mkdir ~/.ssh
          eval `ssh-agent -s`
          ssh-add - <<< "${{ secrets.SSH_KEY }}" 
          ssh-keyscan -H ${{ secrets.JUMP_IP }} >> ~/.ssh/known_hosts
          ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_IP}} ssh-keyscan ${{ secrets.K3SHOST_IP }} >> ~/.ssh/known_hosts
          sshpass -p ${{ secrets.K3S_PASS }} ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_IP }}" ${{ secrets.K3SHOST_USERNAME }}@${{ secrets.K3SHOST_IP }} "kubectl get pods -A" >> ${{env.report-file}}  

      - name: check-crashed-pods
        id: check-pods
        run: |
          echo "$(cat  ${{env.report-file}} | grep -v Running)" >> ${{env.report-file}} 2>&1
          echo "pods-failed=$(cat ${{env.report-file}} | grep -v Running | wc -l)" >> $GITHUB_OUTPUT

      - name: upload crashed pod's list
        if: steps.check-pods.outputs.pods-failed > 1
        uses: actions/upload-artifact@v3
        with:
          path: ${{ env.report-file }}


      - name: slack Notification
        if: steps.check-pods.outputs.pods-failed > 1
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: notification_channel
          SLACK_COLOR: #FF0000
          SLACK_TITLE: 'Some pods have crashed'
          LACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Some pods have crashed'
          SLACK_USERNAME: GitHub Action
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
```
