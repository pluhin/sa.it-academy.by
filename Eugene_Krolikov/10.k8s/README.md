# 10.Kubernetes install

## localhost instalations

```bush
root@05lesson:/home/devops/10.k8s# kubectl version --short
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.
Client Version: v1.26.3
Kustomize Version: v4.5.7
Server Version: v1.25.7+k3s1
root@05lesson:/home/devops/10.k8s#
root@05lesson:/home/devops/10.k8s# k9s version
 ____  __.________
|    |/ _/   __   \______
|      < \____    /  ___/
|    |  \   /    /\___ \
|____|__ \ /____//____  >
        \/            \/

Version:    v0.27.3
Commit:     7c76691c389e4e7de29516932a304f7029307c6d
Date:       2023-02-12T15:19:22Z
```

## k9s with default

![Screen1](k9s_1.PNG)

## Yaml file

```yaml
name: check status of pods

on: workflow_dispatch

jobs:
  build:
    name: check status of pods
    runs-on: ubuntu-latest
    env:
      report-file: status.log
      report-text:
    steps:
    - name: Connect to k3s host
      run: |
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.HOST_KEY }}" 
        ssh-keyscan -H ${{ secrets.JUMP_HOST }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST}} ssh-keyscan ${{ secrets.HOST }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }}" ${{ secrets.USERNAME }}@${{ secrets.HOST }} \
        kubectl get pods -A > ${{ env.report-file }} 

    - name: check-crashed-pods
      id: check-pods
      run: |
        echo "pods-failed-count=$(cat ${{ env.report-file }} | grep -v Running | wc -l)" >> $GITHUB_OUTPUT

    - name: upload crashed pod's list
      if: steps.check-pods.outputs.pods-failed-count > 1
      uses: actions/upload-artifact@v3
      with:
        path: ${{ env.report-file }}

    - name: Slack notification
      uses: rtCamp/action-slack-notify@v2
      if: steps.check-pods.outputs.pods-failed-count > 1
      env:
        SLACK_CHANNEL: devopscourse
        SLACK_COLOR: '#2EB67D'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_TITLE: 'Some pods have crashed!'
        SLACK_USERNAME: rtCamp
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

## Screen of k9s after

![Screen2](k9s_2.PNG)

## Slack

![Slack](slack.PNG)

## status.log

[File](status.log)

## Links

[Github action](https://github.com/evkenny/09.Kube/actions/runs/4553440251)

## github action

[File](k9s_action.yaml)