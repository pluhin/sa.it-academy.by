# HA1: K8s Installation

## Install kubectl

```bash
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl

curl -LO https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client

Client Version: v1.33.3
Kustomize Version: v5.6.0
```

## Install k9s

```bash
wget https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_linux_amd64.deb

sudo apt install ./k9s_linux_amd64.deb

k9s
```

## Print-screen k8s pods

![K8s pods](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/10.K8s.WS/k8s.png)

## Print-screen k3s pods

![K3s pods](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/10.K8s.WS/k3s.png)

## Check_pods.eml

```bash
name: Check err pods on private clusters

on:
  push:
    branches:
      - master

jobs:
  check_pods:
    runs-on: self-hosted
    env:
      SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
    steps:
      - name: Check crashed pods on k3s cluster
        run: |

          crashed_pods_count=$(kubectl get pods -A --context='k3s' | awk 'NR!=1 {print $4}' | grep -v 'Running' | wc -l)
          crashed_pods_list=$(kubectl get pods -A --context='k3s' | awk 'NR!=1 && $4 != "Running" {print $1"/"$2}')
          echo "Crashed pods in k3s: $crashed_pods_count"
          echo "$crashed_pods_list"
          if [ "$crashed_pods_count" -ne 0 ]; then
            message="🚨 $crashed_pods_count crashed pods in k3s cluster:\n$(echo "$crashed_pods_list" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')"
            curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$message\"}" "$SLACK_WEBHOOK_URL"
          fi
```

## Print-screen crashed/failed pods

![Err pods](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/10.K8s.WS/crash_pods_k3s.png)

## Print-screen Slack notification

![Err pods notify](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/10.K8s.WS/Slack_crash_pods.png)

## Print-screen GitHub action success

![Job complete](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/10.K8s.WS/jobs_complete.png)


