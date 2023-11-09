# 10. Kubernetes installation (WS)

* Install Kubectl  xxx.19  [https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/]
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
```

* Configuring ssh on k3s server xxx.8
```bash
ssh-copy-id root@xxx.8
# Check
ssh root@xxx.8
```

* Install k3s xxx.8
```bash
curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
service k3s status
```

* Copy the access config file from xxx.8 to xxx.19
```bash
ssh root@xxx.19
# If .kube is missing, creating it
scp root@xxx.xxx.xxx.8:/etc/rancher/k3s/k3s.yaml ~/.kube/config
# If you need to download to your home machine
scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@'adres_bastion_server' -p 'port_BS'" root@xxx.8:/etc/rancher/k3s/k3s.yaml ~/.kube/config
# Open the config and change the server: https://127.0.0.1:6443 on ip k3s servers (xxx.8)
#Check
kubectl get pods -A
```

* Install k9s to xxx.19           

Go installation [https://go.dev/doc/install]    
```bash
wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
nano .profile
# adding at the end    export PATH=$PATH:/usr/local/go/bin
source ~/.profile
#Check
go version
```

[https://github.com/derailed/k9s/releases]
```bash
wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
# Start
k9s
```
* Test pod deployment

test.yaml
```yaml
---
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
kubectl apply -f test.yaml
```



## Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods
[https://github.com/YMazurau/10.Kubernetes-installation]

check.yaml
```yaml
name: Check Pod Status v01

on: workflow_dispatch

jobs:
  check-pods:
    runs-on: ubuntu-latest
    steps:
    - name: ssh proxy command
      id: p_c
      uses: appleboy/ssh-action@v1.0.0
      with:
        host: ${{ secrets.HOST }}
        username: ${{ secrets.HOST_USER }}
        # password: ${{ secrets.PASS }}
        key: ${{ secrets.KEY }}
        port: ${{ secrets.PORT }}
        proxy_host: ${{ secrets.BASTION_HOST }}
        proxy_username: ${{ secrets.BASTION_USERNAME }}
        proxy_key: ${{ secrets.PROXY_KEY }}
        proxy_port: ${{ secrets.BASTION_PORT }}
        script: |
          # kubectl get pods -A
          kubectl get pods -A >> output.log
          echo "::set-output name=output_log::$(cat output.log)"
    - name: Check Crash pods
      id: check-pods
      run: |
        echo "steps.p_c.outputs.output_log" > output.log
        echo "pods-failed=$(cat output.log | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT
    - name: Upload Crashed Pods List
      if: steps.check-pods.outputs.pods-failed == 1
      uses: actions/upload-artifact@v3
      with:
        path: output.log
        

    - name: Slack notification
      uses: rtCamp/action-slack-notify@v2
      if: steps.check-pods.outputs.pods-failed == 1
      env:
        SLACK_CHANNEL: 'general'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_COLOR: ${{ job.status }}
        SLACK_USERNAME: rtBot
        SLACK_TITLE: "Failed Pods Alert"
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

```
NOTE:
In the repository settings, create secrets ( Settings -> Secrets and variables -> Action ), where:
HOST  address k3s or k9s ( both there and there via kubectl outputs )
HOST_USER  the name of the user under which the ssh connection will be made
KEY  private key (cat .ssh/id_rsa). In my case, the key is generated on my home PC, the public ones are copied to bastion and training servers
PORT   22 port ( port ssh )
BASTION_HOST   bastion server address
BASTION_USERNAME   the name of the user under which the ssh connection will be made
PROXY_KEY  private key ( as in KEY )
BASTION_PORT  port for ssh connection with bastion server ( usually not 22 )
SLACK_WEBHOOK  instructions below
```

* SLACK_WEBHOOK   [https://github.com/rtCamp/action-slack-notify]

Create SLACK_WEBHOOK secret using GitHub Action's Secret. You can generate a Slack incoming webhook token from here.
[https://brosersstorage.slack.com/apps/A0F7XDUAZ-incoming-webhooks?tab=more_info]

! WARNING ! In the upper corner, be sure to check which chat the alert is configured in.
