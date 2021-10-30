```bash
 1099  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
 1100  vim Dockerfile
 1101  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
 1102* ssh plu@192.168.100.100
 1103  docker images
 1104  docker login jfrog.it-academy.by
 1105  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
 1106* ssh root@192.168.202.22
 1107* ssh root@192.168.203.21
 1108* clear
 1109* ssh root@192.168.202.22
 1110  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
 1111* sudo vim /etc/hosts
 1112* ssh root@178.124.206.53
 1113* cd /tmp
 1114* mkdir flux
 1115* cd flux
 1116* git init
 1117* touch README.md
 1118* git add --all
 1119* git commit -m "Init"
 1120* git remote add origin git@github.com:pluhin/flux_demo.git
 1121* git push -u origin master
 1122* scp root@192.168.202.22:/root/flux/jenkins.yaml  ./
 1123* git status
 1124* git add --all
 1125* git commit -m "Add Jenkins"
 1126* git push
 1127* brew install flux
 1128* flux
 1129* brew uninstall flux
 1130* brew install fluxcd/tap/flux
 1131* flux --help
 1132* history
 1134* export GITHUB_USER=pluhin
 1135* export GITHUB_REPO=flux_demo
 1136* flux bootstrap github   --owner=$GITHUB_USER   --repository=$GITHUB_REPO   --branch=main   --path=./clusters   --personal
 1137* kubectl get nodes
 1138* ssh -L 6443:127.0.0.1:6443 root@192.168.203.21 -f -N
 1139* export KUBECONFIG=$KUBECONFIG:$HOME/.kube/ec_htp_sa
 1140* kubectl get nodes
 1141* flux bootstrap github   --owner=$GITHUB_USER   --repository=$GITHUB_REPO   --branch=main   --path=./clusters   --personal
 1142* cp  jenkins.yaml ../
 1143* git fetch --all
 1144* git checkout main
 1145* mv ../jenkins.yaml ./
 1146* ls
 1147* flux create source git jenkins \\n  --url=https://github.com/pluhin/flux-demo.git \\n  --branch=main \\n  --interval=1m \\n  --export > ./clusters/jenkins-source.yaml
 1148* git status
 1149* flux create kustomization jenkins \\n  --source=jenkins \\n  --path="./" \\n  --prune=true \\n  --validation=client \\n  --interval=5m \\n  --export > ./clusters/jenkins-kustomization.yaml
 1150* git status
 1151* git add --all
 1152* git commit -m "Add flux next step"
 1153* git push
 1154* watch
 1155* flux get kustomizations
 1156* vim jenkins.yaml
 1157* git add --all
 1158* git commit -m "Change image"
 1159* git push
 1160* kubectl -n flux-system create secret generic slack-url \\n--from-literal=address=https://hooks.slack.com/services/XXXXXXXXXX
 1161* vim clusters/notification.yaml
 1162* git add --all
 1163* git commit -m "Add notification"
 1164* git push
 1165* kubectl -n flux-system get alerts
 1166* kubectl apply -f clusters/jenkins-kustomization.yaml
 1167* kubectl apply -f clusters/*
 1168* kubectl apply -f clusters/jenkins-source.yaml
 1169* kubectl apply -f clusters/jenkins-kustomization.yaml
 1170* vim clusters/jenkins-kustomization.yaml
 1171* kubectl apply -f clusters/jenkins-kustomization.yaml
 1172* git status
 1173* kubectl apply -f clusters/notification.yaml
 1174* kubectl -n flux-system get alerts
 1175* kubectl -n flux-system get kustomizations
 1176* vim clusters/jenkins-kustomization.yaml
 1177* kubectl apply -f clusters/jenkins-kustomization.yaml
 1178* vim clusters/jenkins-kustomization.yaml
 1179* kubectl apply -f clusters/jenkins-kustomization.yaml
 1180* git add --all
 1181* git commit -m "Correct"
 1182* git push
 1183* kubectl -n flux-system get kustomizations
 1184* kubectl -n flux-system delete -f clusters/notification.yaml
 1185* cd ~
 1186* pws
 1187* pwd
 1188* cp /tmp/flux/jenkins.yaml git_repos/sa.it-academy.by/demo/14.K8s
```


192.168.37.105:/mnt/IT-Academy/nfs-data/sa2-18-21/demo/jenkins

```groovy
pipeline {
  agent {
    kubernetes {
      label 'sample-app'
      idleMinutes 5
      yaml """
apiVersion: v1
kind: Pod
metadata:
  name: curltest
  namespace: ci-cd
spec:
  containers:
  - name: curltest
    image: jfrog.it-academy.by/public/curl:spishchyk
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
  restartPolicy: Always
"""
}
  }
  stages {
    stage('Test') {
      steps {
        container('curltest') {
          sh 'curl -S https://onliner.by'
        }
      }
    }
  }
}
```

## Flux CD

### Setup

Pre-steps: 
- create repo ( https://github.com/pluhin/flux_demo/tree/main ), clone it locally, go to repo folder
- kubectl has connect to k8s
- install flux


```bash
export GITHUB_USER=pluhin
export GITHUB_REPO=flux_demo

flux bootstrap github   --owner=$GITHUB_USER   --repository=$GITHUB_REPO   --branch=master   --path=./clusters   --personal

git pull
```

### Add application

```bash
flux create source git jenkins \
  --url=https://github.com/pluhin/flux_demo.git \
  --branch=master \
  --interval=1m \
  --export > ./clusters/jenkins-source.yaml

flux create kustomization jenkins \
  --source=jenkins \
  --path="./" \
  --prune=true \
  --interval=5m \
  --export > ./clusters/jenkins-kustomization.yaml

git add -A && git commit -m "Add jenkins Kustomization"
git push
flux get kustomizations
  
vim jenkins.yaml 
git add --all
git commit -m "Test"
git push
```

### Notification

```bash
kubectl -n flux-system create secret generic slack-url \
--from-literal=address=https://hooks.slack.com/services/xxxxx
```


`./clusters/flux-system/notification.yaml`


```yaml
---
apiVersion: notification.toolkit.fluxcd.io/v1beta1
kind: Provider
metadata:
  name: slack
  namespace: flux-system
spec:
  type: slack
  channel: general
  secretRef:
    name: slack-url
---
apiVersion: notification.toolkit.fluxcd.io/v1beta1
kind: Alert
metadata:
  name: on-call-webapp
  namespace: flux-system
spec:
  providerRef:
    name: slack
  eventSeverity: info
  eventSources:
    - kind: GitRepository
      name: '*'
    - kind: Kustomization
      name: '*'
```

```bash
git add --all
git commit -m "Add notification"
git push
```

```
kubectl -n flux-system get alerts
```

Uninstall

```bash
flux uninstall --namespace=flux-system
```