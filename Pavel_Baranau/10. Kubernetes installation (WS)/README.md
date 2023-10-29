# 10. Kubernetes installation (WS)
## Install sa-2
``` bash
13  cat .ssh/authorized_keys 
   14  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   15  apt install curl
   16  apt-get update
   17  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   18  apt-get update
   19  apt install curl
   20  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   21  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   22  rm kubectl
   23  clear
   24  scp root@192.168.203.1:/etc/rancher/k3s/k3s.yaml ~/.kube/config
   25  cd /.kube/
   26  mkdir ~/.kube/config
   27  mkdir ~/.kube/config/
   28  ls
   29  ls -la
   30  mkdir ~/.kube
   31  ls -la
   32  cd .kube/
   33  mkdir /config/
   34  cd
   35  scp root@192.168.203.1:/etc/rancher/k3s/k3s.yaml ~/.kube/config
   36  cd /.kube.config/
   37  cd /.kube/config/
   38  cd ~/.kube/config/
   39  cd ~/.kube/config
   40  sudo mc
   41  nano /.kube/config
   42  mc
   43  nano ~/.kube/config 
   44  kubectl get pods -A
   45  wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz
   46  nano .profile 
   47  source .profile 
   48  go version
   49  wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
   50  sudo tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
   51  k9s
   52  nano test.yaml
   53  kubectl apply -f test.yaml 
   54  k9s
   55  exit
   56  clear
   57  history
   58  k9s
   59  nano ~/.kube/config 
   60  clear
   61  history
   62  ls
   63  nano test.yaml
   64  exit
   65  k9s
   66  clear
   67  history 
   68  nano test.yaml
   69  k9s
   70  kubectl apply -f test.yaml 
   71  k9s
   72  nano test.yaml
   73  k9s
   74  kubectl apply -f test.yaml 
   75  CLEAR
   76  clear
   77  k9s
   78  kubectl events
   79  k9s
   80  kubectl events
   81  kubectl logs
   82  clear
   83  kubectl events
   84  nano test.yaml
   85  kubectl events
   86  k9s
   87  kubectl delete pod ubuntu2
   88  kubectl events
   89  k9s
   90  kubectl apply -f test.yaml 
   91  k9s
   92  cat  output-pods.log
   93  kubectl apply -f test.yaml 
   94  k9s
   95  echo "$(cat  output-pods.log | grep -v Running)" >> crash_report 2>&1
   96  kubectl get pods --field-selector=status.phase!=Running
   97  mc
   98  kubectl events
   99  kubectl get pods -A
  100  k9s
  101  nano test.yaml
  102  kubectl apply -f test.yaml 
  103  nano test.yaml
  104  kubectl apply -f test.yaml 
  105  k9s
  106  ls
  107  ls | grep li
  108  ls | grep a
  109  ls | -v grep a
  110  k9s
```
![sa-2](https://i.ibb.co/C8Vksyt/Screenshot-from-2023-10-28-20-02-42.png)
## Install  on my local
``` bash
1094  ssh root@178.124.206.53 -p 32510
 1095  ssh-copy-id -p 32510 jump_sa@178.124.206.53
 1096  ssh root@192.168.202.2
 1097  kubectl get pods -A
 1098  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
 1099  kubectl get pods -A
 1100  scp root@192.168.203.1:/etc/rancher/k3s/k3s.yaml ~/.kube/config
 1101  ssh-copy-id -p root@192.168.203.1
 1102  ssh-copy-id root@192.168.203.1
 1103  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510" root@192.168.203.1:/etc/rancher/k3s/k3s.yaml ~/.kube/config
 1104  cat /.kube/config
 1105  cat ~/.kube/config
 1106  ssh -L 6443:127.0.0.1:6443 root@192.168.203.1 -f -N
 1107  nano ~/.kube/config
 1108  ssh -L 6443:127.0.0.1:6443 root@192.168.203.1 -f -N
 1109  ssh -L 6444:127.0.0.1:6443 root@192.168.203.1 -f -N
 1110  nano ~/.kube/config
 1111  ssh -L 6444:127.0.0.1:6443 root@192.168.203.1 -f -N\n: 1698276094:0;ssh -L 6444:127.0.0.1:6443 root@192.168.203.1 -f -N
 1112  lsof -i :6444
 1113  lsof -i
 1114  ssh -L 7555:127.0.0.1:6443 root@192.168.203.1 -f -N
 1115  nano ~/.kube/config
 1116  ssh -L 7555:127.0.0.1:6443 root@192.168.203.1 -f -N
 1117  ssh root@192.168.203.1
 1118  kubctl get pods -A
 1119  kubectl get pods -A
 1120  wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz\nsudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
 1121  nano ~/.profile
 1122  source ~/.profile
 1123  k9s
 1124  sudo tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
 1125  wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
 1126  sudo tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
 1127  k9s
 1128  kubectl get pods -A
 1129  ssh -L 7555:127.0.0.1:6443 root@192.168.203.1 -f -N
 1130  k9s
 1131  kubectl apply -f test.yaml
 1132  ls
 1133  cd Documents
 1134  ls
 1135  mc
 1136  cd academy
 1137  ls
 1138  cd mylesson
 1139  ls
 1140  cd
 1141  ls
 1142  clear
 1143  history
 1144  kubctl get pods -A
 1145  kubectl get pods -A
 1146  k9s
 1147  ssh root@192.168.203.1
 1148  ssh root@192.168.202.2
 1149  k9s
 1150  ls
 1151  cd mylesson
 1152  ls
 1153  cd 10.Kuber
 1154  celar
 1155  clear
 1156  git init
 1157  git remote add origin git@github.com:pavelbaranov/10.Kuber.git
 1158  kubectl logs
 1159  ssh root@192.168.203.1
 1160  ssh root@192.168.202.2
 1161  clear
```
![Local](https://i.ibb.co/ByzrMX7/Screenshot-from-2023-10-28-20-53-45.png)

## Github Action
``` yaml
name: Check Status of Pods

on: workflow_dispatch

jobs:
  check-pods:
    runs-on: ubuntu-latest
    steps:
    - name: Connect to K3s host
      run: |
        mkdir ~/.ssh
        eval `ssh-agent -s`
        ssh-add - <<< "${{ secrets.SSH_KEY }}"
        ssh-keyscan -p 32510 ${{ secrets.JUMP_HOST }} >> ~/.ssh/known_hosts
        ssh ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510 ssh-keyscan ${{ secrets.HOST }} >> ~/.ssh/known_hosts
        ssh -o ProxyCommand="ssh -W %h:%p ${{ secrets.JUMP_USERNAME }}@${{ secrets.JUMP_HOST }} -p 32510" ${{ secrets.HOST_USER }}@${{ secrets.HOST }} "kubectl get pods -A" >> init_pods.log
    
    - name: Get status pods
      id: status-pods
      run:
         echo "pods-crashed=$(cat init_pods.log | grep -v 'Running\|Completed ' | wc -l)"
         echo "pods-crashed=$pods_crashed"
    
    - name: Uplod status pods
      if: steps.check-pods.outputs.pods-crashed != 1
      uses: actions/upload-artifact@v3
      with:
        name: Status Pods
        path: init_pods.log

    - name: Notify Slack on failure
      if: steps.check-pods.outputs.pods-crashed != 1
      uses: rtCamp/action-slack-notify@v2
      env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          SLACK_COLOR: 'red'
          SLACK_CHANNEL: test
          SLACK_MESSAGE: "WARNING! Pods crashed or Unruning!"
```
![Slack msg](https://i.ibb.co/ckY34CH/Screenshot-from-2023-10-28-20-57-18.png)