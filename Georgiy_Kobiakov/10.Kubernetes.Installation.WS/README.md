# 10.Kubernetes.Installation.WS
---

## Repo for Kubernetes
[Github repo for Kubernetes](https://github.com/Goshaker/K8s)

## K8s pods screenshot
![K8s pods sreenshot](https://github.com/Goshaker/DevOpsCourse/blob/master/10.Kubernetes.Installation.WS/k8s.png)

## K3s pods screenshot
![K3s pods sreenshot](https://github.com/Goshaker/DevOpsCourse/blob/master/10.Kubernetes.Installation.WS/k3s.png)

## check_pods.yaml

```yaml
name: Check Status of Pods

on: workflow_dispatch

jobs:
  check-pods:
    runs-on: ubuntu-latest
    steps:
    - name: Check SSH_PKEY Secret
      run: |
        echo "Secret SSH_PKEY: ${{ secrets.SSH_KEY }}"
        echo "${{ secrets.SSH_KEY }}" > secret.key.pem
        chmod 600 secret.key.pem
        ssh-keygen -l -f secret.key.pem
      continue-on-error: true

    - name: Connect to K8s master host
      run: |
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.SSH_KEY }}"
        ssh-keyscan -p 32510 ${{ secrets.JUMP_HOST }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510 ssh-keyscan ${{ secrets.HOST_K8S }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510" ${{ secrets.HOST_USER_K8S }}@${{ secrets.HOST_K8S }} "kubectl get pods -A" >> output_k8s.log

    - name: Check Crash pods k8s
      id: check-pods-k8s
      run: |
        echo "$(cat output_k8s.log)" >> crash_report 2>&1
        echo "pods-dont-work=$(cat output_k8s.log | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT

    - name: Upload Crashed Pods List k8s
      if: steps.check-pods-k8s.outputs.pods-dont-work != 1
      uses: actions/upload-artifact@v4
      with:
        name: Dead pods k8s
        path: output_k8s.log

    - name: Connect to K3s host
      run: |
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.SSH_KEY }}"
        ssh-keyscan -p 32510 ${{ secrets.JUMP_HOST }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510 ssh-keyscan ${{ secrets.HOST_K3S }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510" ${{ secrets.HOST_USER_K3S }}@${{ secrets.HOST_K3S }} "kubectl get pods -A" >> output_k3s.log

    - name: Check Crash pods k3s
      id: check-pods-k3s
      run: |
        echo "$(cat output_k3s.log)" >> crash_report 2>&1
        echo "pods-dont-work=$(cat output_k3s.log | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT

    - name: Upload Crashed Pods List k3s
      if: steps.check-pods-k3s.outputs.pods-dont-work != 1
      uses: actions/upload-artifact@v4
      with:
        name: Dead pods k3s
        path: output_k3s.log

    - name: Slack notification k8s
      uses: rtCamp/action-slack-notify@v2
      if: steps.check-pods-k8s.outputs.pods-failed == 1
      env:
        SLACK_CHANNEL: k8s-pods-check
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: 'red'
        SLACK_USERNAME: rtCamp
        SLACK_TITLE: "Some pods have crashed: ${{ steps.check-pods-k8s.outputs.pods-dont-work }}"
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_K8S }}

    - name: Slack notification k3s
      uses: rtCamp/action-slack-notify@v2
      if: steps.check-pods-k3s.outputs.pods-failed == 1
      env:
        SLACK_CHANNEL: k3s-check-pods
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: 'red'
        SLACK_USERNAME: rtCamp
        SLACK_TITLE: "Some pods have crashed: ${{ steps.check-pods-k3s.outputs.pods-dont-work }}"
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_K3S }}
```