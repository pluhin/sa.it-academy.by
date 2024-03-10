```yaml
name: Check pods
on: [push , workflow_dispatch ]
jobs:
  pods:
    runs-on: ubuntu-latest    
    steps:
      - name: SSH connect to remoute host
        id: kube_pod
        uses: appleboy/ssh-action@v1.0.3
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          port: ${{ secrets.PORT }}
          proxy_host: ${{ secrets.PROXY_HOST }}
          proxy_username: ${{ secrets.PROXY_USERNAME }}
          proxy_key: ${{ secrets.PROXY_KEY }}
          proxy_port: ${{ secrets.PROXY_PORT }} #-v          
          script: |
            kubectl get pods -A --context="k8s" | grep -E 'Running|Completed' > k8s.log   
            kubectl get pods -A --context="k3s" | grep -E 'Running|Completed' >> k8s.log
            
      - name: Download file via SSH
        uses: nicklasfrahm/scp-action@main
        with:
          direction: download
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          insecure_ignore_fingerprint: true
          port: ${{ secrets.PORT }}
          proxy_host: ${{ secrets.PROXY_HOST }}
          proxy_fingerprint: true
          proxy_username: ${{ secrets.PROXY_USERNAME }}
          proxy_key: ${{ secrets.PROXY_KEY }}
          proxy_port: ${{ secrets.PROXY_PORT }}
          insecure_proxy_ignore_fingerprint: true
          source: "/root/k8s.log"
          target: "./k8s.log"

      - name: copy file via ssh
        id: count_fails_pods 
        run: |
          echo "fails_pods=$(cat ./k8s.log | wc -l)" >> $GITHUB_OUTPUT
          cat ./k8s.log
        shell: bash
   
      - name: Upload Crashed Pods List k3s 
        if:  steps.count_fails_pods.outputs.fails_pods !=0 
        uses: actions/upload-artifact@v4
        with:
            name: Failed pods 
            path: ./k8s.log

      - name: Slack notification 
        uses: rtCamp/action-slack-notify@v2
        if: steps.count_fails_pods.outputs.fails_pods !=0
        env:
          SLACK_CHANNEL: alarm_channel
          SLACK_COLOR: 'red'
          SLACK_USERNAME: k8s
          SLACK_TITLE: "Pods crashed!"
          SLACK_WEBHOOK: ${{ secrets.WEBHOOK_SLACK}}

```