### 10.k8s

## Url Github actions
Github actions (https://github.com/Pavel167988/10.K8s/commit/2321fffd116e4051f2e4d5c0cd2b50b35692ebbf/checks);



## pods.yaml
```bash
name: Check pods in SA
on: 
  push:
  schedule:
    - cron: "* */12 * * *"
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Connect to host with proxy with out password
        id: get_pods
        run: |
           mkdir ~/.ssh
           eval `ssh-agent -s`
           ssh-add - <<< "${{secrets.KEY}}" 
           ssh-keyscan -H ${{ secrets.PROXY_HOST }} >> ~/.ssh/known_hosts
           echo 'CONTENT_ENV<<EOF' >> $GITHUB_ENV
           ssh ${{ secrets.USERNAME_HOST }}@${{ secrets.HOST_IP }} -o ProxyCommand="ssh -W %h:%p ${{ secrets.USERNAME_PROXY }}@${{ secrets.PROXY_HOST }}" -o StrictHostKeyChecking=no "kubectl get pods -A" >> $GITHUB_ENV  
           echo 'EOF' >> $GITHUB_ENV
           
      - name: output pods
        id: out_pods    
        run: |
           echo "$CONTENT_ENV" >> pods.log 2>&1
           
      - name: Upload pods
        uses: actions/upload-artifact@v2
        with:
          path: pods.log
          
      - name: output crashed pods
        id: out_pods_failed    
        run: |
           echo "$CONTENT_ENV" > pods.txt           
           echo "$(cat pods.txt | grep -v Running)" >> pods_crashed.log 2>&1
           echo "crashed=$(cat pods.txt | grep -v Running | wc -l)" >> $GITHUB_OUTPUT
          
      - name: Upload report
        if: steps.out_pods_failed.outputs.crashed > 1
        uses: actions/upload-artifact@v2
        with:
          path: pods_crashed.log       
 
      - name: Slack Notification
        if: steps.out_pods_failed.outputs.crashed > 1
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: crashed_pods-from-sa
          SLACK_COLOR: '#FF0000'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'We have crashed pods!!!'
          SLACK_TITLE: 'ALERT! Check pods_crashed.log in artifact'
          SLACK_USERNAME: Kostenko Pavel
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```