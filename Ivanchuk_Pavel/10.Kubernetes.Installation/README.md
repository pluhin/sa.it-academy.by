# 10. Kubernetes installation (WS)

## K8s Installation

### Localhost

**Installed  kubectl for local run:** (in HW 09)
```bash
  56  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  57  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

```bash
kubectl version
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.27.6+k3s1
```
I already installed Go on the previous Homework 09. Kubernetes during the installation of KinD
```bash
 wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz
    4  mkdir -p $HOME/go/{bin,src}
    5  cd
    6  ls -la
    7  nano .profile
    8  cd /home
    9  tar -xvf go1.21.3.linux-amd64.tar.gz
   10  mv go /usr/local/
   11  cd
   12  . ~/.profile
   13  go version
```
```
cat ~/.profile
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

```bsah
  go version
  go version go1.21.3 linux/amd64
```

**Install k9s to maintain cluster**
```bash
  214* wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
  215* sudo tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
  216* k9s
```
---
![using_k9s_on_local_host](https://github.com/IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps/assets/145698867/48edee75-bfec-41bb-a27a-9efdfa430c2e)
---

### Add test pod deployment 

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
  labels:
    app: ubuntu
spec:
  containers:
  - image: ghcr.io/pluhin/busy-box:latest
    command:
      - "sleep"
      - "604800"
    imagePullPolicy: IfNotPresent
    name: ubuntu
  restartPolicy: Always
```

```bash
   251  kubectl apply -f test.yaml
```
---
![add_pod](https://github.com/IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps/assets/145698867/71c670fd-6d7f-486c-9d60-d8349aefe1a7)
---


### Created GitHub action to check status of pods and create slack notification if I have crashed/failed pods

**_[->Click here <-](https://github.com/IPaul32/10.Kubernetes.Installation "GITHUB ACTION Ivanchuk 10.k8s Install")_**

_Workflow action file:_
```yaml
name: create and test Kubernetes cluster

on: workflow_dispatch

jobs:
  check-pods:
    runs-on: ubuntu-latest
    steps:
    - name: Check SSH_PKEY Secret
      run: |
        echo "Secret SSH_PKEY: ${{ secrets.SSH_PKEY }}"
        echo "${{ secrets.SSH_PKEY }}" > secret.key.pem
        chmod 600 secret.key.pem
        ssh-keygen -l -f secret.key.pem
      continue-on-error: true

    - name: Connect to Kubernetes Host
      run: |
        set -x
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.SSH_PKEY }}" 
        ssh-keyscan -p 32510 ${{ secrets.BASTION_IP_JUMP }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.BASTION_USER_JUMP }}@${{ secrets.BASTION_IP_JUMP }} -p 32510 ssh-keyscan ${{ secrets.VHOST_IP }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.BASTION_USER_JUMP }}@${{ secrets.BASTION_IP_JUMP }} -p 32510" ${{ secrets.VHOST_USER }}@${{ secrets.VHOST_IP }} "kubectl get pods -A" >> output-pods.log  
    - name: Check Crash pods
      id: check-pods
      run: |
        echo "$(cat  output-pods.log | grep -v Running)" >> crash_report 2>&1
        echo "pods-dont-work=$(cat output-pods.log | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT
    - name: Upload Crashed Pods List
      if: steps.check-pods.outputs.pods-dont-work != 1
      uses: actions/upload-artifact@v3
      with:
        name: Dead pods
        path: output-pods.log

    - name: Slack notification about FAlL POD
      uses: rtCamp/action-slack-notify@v2
      if: steps.check-pods.outputs.pods-dont-work != 1
      env:
        SLACK_CHANNEL: github_action
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: #b62e2e
        SLACK_MESSAGE: 'Some pods have problems: ${{ steps.check-pods.outputs.pods-dont-work }}'
        SLACK_TITLE: Post Title
        SLACK_USERNAME: rtCamp
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
---
![Action succes](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/588a09cc-9fe7-4a5e-ac0a-ee7ade9f1d1f)
---
![Slack_notification](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/9c94b8bf-72c8-49e2-b04a-d135e8381a21)

**_Artifact_**

```bash
NAMESPACE     NAME                                     READY   STATUS             RESTARTS          AGE
kube-system   coredns-77ccd57875-whp5c                 1/1     Running            0                 5d14h
kube-system   local-path-provisioner-957fdf8bc-jrc5x   1/1     Running            0                 5d14h
kube-system   metrics-server-648b5df564-nzf5p          1/1     Running            0                 5d14h
default       ubuntu                                   1/1     Running            0                 3d12h
default       ubuntu-dontwork                          0/1     CrashLoopBackOff   122 (5m10s ago)   10h
```

