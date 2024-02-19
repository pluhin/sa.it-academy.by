# Homework Assignment 1. K8s Installation

## Localhost:

### Install kubectl for local run

```bash
cat <<EOF | sudo tee /etc/zypp/repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
```

```bash
sudo zypper refresh
sudo zypper install kubectl
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ kubectl version
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

### Install k9s to maintain cluster

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ go version
go version go1.21.6 linux/amd64
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ zypper se k9s
Loading repository data...
Reading installed packages...

S | Name | Summary                                          | Type
--+------+--------------------------------------------------+--------
  | k9s  | Curses based terminal UI for Kubernetes clusters | package
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ sudo zypper in k9s
[sudo] password for root:
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following NEW package is going to be installed:
  k9s

1 new package to install.
Overall download size: 9.8 MiB. Already cached: 0 B. After the operation, additional 47.5 MiB will be used.
Continue? [y/n/v/...? shows all options] (y): y
Retrieving: k9s-0.21.7-bp155.2.18.x86_64 (Main Repository)                                                                                                          (1/1),   9.8 MiB
Retrieving: k9s-0.21.7-bp155.2.18.x86_64.rpm ...................................................................................................................[done (695.7 KiB/s)]

Checking for file conflicts: .................................................................................................................................................[done]
(1/1) Installing: k9s-0.21.7-bp155.2.18.x86_64 ...............................................................................................................................[done]
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ k9s version
 ____  __.________
|    |/ _/   __   \______
|      < \____    /  ___/
|    |  \   /    /\___ \
|____|__ \ /____//____  >
        \/            \/

Version:    v0.31.8
Commit:     90a810ffc2ec5d5460ae4f43325e295f158dec65
Date:       2024-02-07T02:23:50Z
```

### Make print-screen of k9s with pods in all namespaces

![context](<attacments/Pasted image 20240218162927.png>)
![k3s](<attacments/Pasted image 20240218163002.png>)
![k8s](<attacments/Pasted image 20240218163223.png>)

## Kubernetes host

### Finish workshop deployment if it is not done yet

```bash
scp root@192.168.208.5:/root/.kube/config $HOME$/.kube/
ssh -L 6443:127.0.0.1:6443 root@192.168.208.5 -f -N

scp root@192.168.203.3:/etc/rancher/k3s/k3s.yaml $HOME/.kube/config-k3s
ssh -L 6444:127.0.0.1:6443 root@192.168.203.3 -f -N
```

```bash
export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config-k3s
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ kubectl get pods -A --context=k8s
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-648dffd99-cv75z   1/1     Running   0          3d2h
kube-system   calico-node-95f2n                         1/1     Running   0          3d2h
kube-system   calico-node-zxb7f                         1/1     Running   0          3d2h
kube-system   coredns-69db55dd76-6xb5b                  1/1     Running   0          3d2h
kube-system   coredns-69db55dd76-pz7wp                  1/1     Running   0          3d2h
kube-system   dns-autoscaler-6f4b597d8c-7kvqd           1/1     Running   0          3d2h
kube-system   kube-apiserver-node1                      1/1     Running   1          3d2h
kube-system   kube-apiserver-node2                      1/1     Running   1          3d2h
kube-system   kube-controller-manager-node1             1/1     Running   3          3d2h
kube-system   kube-controller-manager-node2             1/1     Running   3          3d2h
kube-system   kube-proxy-rc67x                          1/1     Running   0          2d22h
kube-system   kube-proxy-vcbvc                          1/1     Running   0          2d22h
kube-system   kube-scheduler-node1                      1/1     Running   1          3d2h
kube-system   kube-scheduler-node2                      1/1     Running   1          3d2h
kube-system   nodelocaldns-fdcpw                        1/1     Running   0          3d2h
kube-system   nodelocaldns-kpgtq                        1/1     Running   0          3d2h
```

```bash
╭─a.zhivushko@DESKTOP-NGTG70N /mnt/c/src/my-study ‹ZhivArt-work●›
╰─$ kubectl get pods -A --context=k3s
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-6799fbcd5-4l4gq                   1/1     Running   0          2d19h
kube-system   local-path-provisioner-84db5d44d9-r6l5d   1/1     Running   0          2d19h
kube-system   metrics-server-67c658944b-6mjlt           1/1     Running   0          2d19h
```

### Deploy shell pod in default namespace which you can you use for internal checks inside the cluster

## Monitoring of cluster:

### Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods

```yaml
name: Trace pods

on:
  push:
    branches: k8s

env:
  file_name: artifact_pods.json
  path: ./
  artifact_name: artifact_pods

jobs:
  k8s:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Check SSH_PKEY Secret
        run: |
          echo "Secret SSH_PKEY: ${{ secrets.SSH_PUB_KEY }}"
          echo "${{ secrets.SSH_PUB_KEY }}" > secret.key.pem
          chmod 600 secret.key.pem
          ssh-keygen -l -f secret.key.pem
        continue-on-error: true
  
      - name: Connect to K8s master host
        run: |
          mkdir ~/.ssh
          eval `ssh-agent -s`
          ssh-add - <<< "${{ secrets.SSH_PRIVATE_KEY }}"
          ssh-keyscan -p 32510 ${{ secrets.EC_BASTION_IP }} >> ~/.ssh/known_hosts
          ssh ${{ secrets.EC_BASTION_USERNAME }}@${{ secrets.EC_BASTION_IP }} -p 32510 ssh-keyscan ${{ secrets.K8S_IP }} >> ~/.ssh/known_hosts
          touch ~/.ssh/config
          echo "${{ secrets.SSH_CONFIG }}" > ~/.ssh/config

          ssh -L 6443:127.0.0.1:6443 ${{ secrets.K8S_USERNAME }}@${{ secrets.K8S_IP }} -f -N
          sudo lsof -i -n -P | grep -E '^sshd\>'
          sudo lsof -i -n -P | grep -E '^ssh\>'
  
      - name: Install kubectl
        run: |
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/
          kubectl version --client

      - name: Check K8S Pods
        run: |
          mkdir -p ~/.kube/
          touch ~/.kube/config
          echo "${{ secrets.K8S_CONF }}" > ~/.kube/config
          export KUBECONFIG=$HOME/.kube/config

          echo "k8s all pods: "
          kubectl get pods -A

      - name: Check Crash pods k8s
        id: check-pods-k8s
        run: |
          kubectl get pods -A --field-selector=status.phase!=Running 2>&1 | tee ${{ env.path }}${{ env.file_name }}
          echo "pods-dont-work=$(cat ${{ env.path }}${{ env.file_name }} | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT

      - name: Save Artifact
        if: steps.check-pods-k8s.outputs.pods-dont-work != 1
        uses: actions/upload-artifact@v4
        with:
          name: ${{ env.artifact_name }}
          path: ${{ env.path }}${{ env.file_name }}
  
      - name: Slack Notification k8s (fail pods)
        uses: 8398a7/action-slack@v3
        if: steps.check-pods-k8s.outputs.pods-dont-work != 1
        with:
          status: ${{ job.status }}
          fields: all
          text: "Some k8s pods have crashed: ${{ steps.check-pods-k8s.outputs.pods-dont-work }}"
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}

  k3s:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Check SSH_PKEY Secret
        run: |
          echo "Secret SSH_PKEY: ${{ secrets.SSH_PUB_KEY }}"
          echo "${{ secrets.SSH_PUB_KEY }}" > secret.key.pem
          chmod 600 secret.key.pem
          ssh-keygen -l -f secret.key.pem
        continue-on-error: true
  
      - name: Connect to K3s master host
        run: |
          mkdir ~/.ssh
          eval `ssh-agent -s`
          ssh-add - <<< "${{ secrets.SSH_PRIVATE_KEY }}"
          ssh-keyscan -p 32510 ${{ secrets.EC_BASTION_IP }} >> ~/.ssh/known_hosts
          ssh ${{ secrets.EC_BASTION_USERNAME }}@${{ secrets.EC_BASTION_IP }} -p 32510 ssh-keyscan ${{ secrets.K3S_IP }} >> ~/.ssh/known_hosts
          touch ~/.ssh/config
          echo "${{ secrets.SSH_CONFIG }}" > ~/.ssh/config

          ssh -L 6444:127.0.0.1:6443 ${{ secrets.K8S_USERNAME }}@${{ secrets.K3S_IP }} -f -N
          sudo lsof -i -n -P | grep -E '^sshd\>'
          sudo lsof -i -n -P | grep -E '^ssh\>'
  
      - name: Install kubectl
        run: |
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/
          kubectl version --client

      - name: Check K3S Pods
        run: |
          mkdir -p ~/.kube/
          touch ~/.kube/config
          echo "${{ secrets.K3S_CONF }}" > ~/.kube/config
          export KUBECONFIG=$HOME/.kube/config

          echo "k3s all pods: "
          kubectl get pods -A

      - name: Check Crash pods k3s
        id: check-pods-k3s
        run: |
          kubectl get pods -A --field-selector=status.phase!=Running 2>&1 | tee ${{ env.path }}${{ env.file_name }}
          echo "pods-dont-work=$(cat ${{ env.path }}${{ env.file_name }} | grep -v 'Running\|Completed ' | wc -l)" >> $GITHUB_OUTPUT

      - name: Save Artifact
        if: steps.check-pods-k3s.outputs.pods-dont-work != 1
        uses: actions/upload-artifact@v4
        with:
          name: ${{ env.artifact_name }}
          path: ${{ env.path }}${{ env.file_name }}
  
      - name: Slack Notification k8s (fail pods)
        uses: 8398a7/action-slack@v3
        if: steps.check-pods-k3s.outputs.pods-dont-work != 1
        with:
          status: ${{ job.status }}
          fields: all
          text: "Some k3s pods have crashed: ${{ steps.check-pods-k3s.outputs.pods-dont-work }}"
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}

```
