# Homework Assignment 1. K8s Installation
## Localhost:

1. Install kubectl for local run
```bash
fadeev@kirill:~$ kubectl version
Client Version: v1.31.1
Kustomize Version: v5.4.2
Server Version: v1.31.0
```
2. Install k9s to maintain cluster
```bash
wget https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz
tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
```
3. Make print-screen of k9s with pods in all namespaces
  * K8s    
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/1.jpg)  
  * K3s  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/2.jpg)  
## Kubernetes host

1. Finish workshop deployment if it is not done yet  
Deployments finished on academy VMs:  
  * K8s installed on k8s VMs:  
192.168.208.21  
192.168.208.22  
  * K3s installed on k3s VM:  
192.168.203.11  
2. Deploy shell pod in default namespace which you can you use for internal checks inside the cluster.
  * Pod configuration
```yaml
root@kirill:~/kubernetes# cat test_pod.yaml
kind: Pod
apiVersion: v1
metadata:
  name: good-pod
  labels:
    app: fubuntu
spec:
  containers:
  - image: ghcr.io/pro100chok91/fubuntu:latest
    command:
      - "sleep"
      - "604800"
    name: fubuntu
```
  * Image based on Dockerfile and push to GH repository
```bash
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
apt-get install -y traceroute wget curl python3 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

CMD ["bash"]
```
  * kubectl apply -f test_pod.yaml  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/3.jpg)  

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/4.jpg)  

## Monitoring of cluster:

1. Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods
  * In Git repository go to Settings -> Secrets and variables -> Actions and create Repository secrets for SSH connection.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/5.jpg)  

  * Create one more pod "bad-pod" for fail check (without command sleep)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/6.jpg)  

  * Workflow  
```yaml
name: Check Kubernetes Pod Status

on: [push , workflow_dispatch]

jobs:
 check-pod-status:
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v2
    - name: connect via proxy and execute commands
      id: connect
      uses: appleboy/ssh-action@v1.1.0
      with:
        proxy_host: ${{ secrets.PROXY_IP }}
        proxy_port: ${{ secrets.PROXY_PORT }}
        proxy_username: ${{ secrets.PROXY_USER }}
        proxy_password: ${{ secrets.PROXY_PASS }}
        host: ${{ secrets.CLUSTER_IP }}
        port: ${{ secrets.CLUSTER_PORT }}
        username: ${{ secrets.CLUSTER_USER }}
        password: ${{ secrets.CLUSTER_PASS }}
        script: |
         kubectl get pods -A > output.log
         bad="$(kubectl get pods -A | awk 'NR!=1 {print $4}' | grep -v 'Running' | wc -l)"
         echo $bad > bad.log

 check:
    needs: check-pod-status
    name: Check result
    runs-on: ubuntu-latest
    outputs:
      bads: ${{ steps.check.outputs.FAILED }}
    steps:
      - name: Check out repository
        uses: actions/checkout@master

      - name: Download file via SSH
        uses: nicklasfrahm/scp-action@main
        with:
          direction: download
          host:  ${{ secrets.CLUSTER_IP }}
          port: ${{ secrets.CLUSTER_PORT }}
          username: ${{ secrets.CLUSTER_USER }}
          insecure_password: ${{ secrets.CLUSTER_PASS }}
          insecure_ignore_fingerprint: true
          proxy_host: ${{ secrets.PROXY_IP }}
          proxy_port: ${{ secrets.PROXY_PORT }}
          proxy_fingerprint: true
          proxy_username: ${{ secrets.PROXY_USER }}
          insecure_proxy_password: ${{ secrets.PROXY_PASS }}
          insecure_proxy_ignore_fingerprint: true
          source: "/root/bad.log"
          target: "./bad.log"
      - name: Check file
        id: check
        run: |
          bad=$(cat "./bad.log")
          if [[ $bad -eq 0 ]]
          then
            echo "FAILED=FALSE" >> $GITHUB_OUTPUT
          else
            echo "FAILED=TRUE" >> $GITHUB_OUTPUT
          fi

 notification:
    needs: check
    runs-on: ubuntu-latest
    if: needs.check.outputs.bads == 'TRUE'
    steps:
    - name: Slack Notification
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: project
        SLACK_COLOR: ${{ job.status }}
        SLACK_MESSAGE: "Cluster has bad pod"
        SLACK_TITLE: K8s status
        SLACK_USERNAME: GitHub
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

  * Result with bad pod  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/7.jpg)  

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/9.jpg)

  * Result without bad pod  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/10.Kubernetes.installation/img/8.jpg)