# 14.K8s

```bash
629  clear
  630  ls
  631  mkdir 14.K8s
  632  cd 14.K8s/
  633  ls
  634  vim Dockerfile
  635  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  636  vim Dockerfile
  637  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  638  free
  639  cat /proc/cpuinfo
  640  docker login jfrog.it-academy.by
  641  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
  642  history | grep ssh
  643  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  644  k get ns
  645  vim jenkins.yaml
  646  vim Dockerfile
  647  vim jenkins.yaml
  648  kubectl apply -f jenkins.yaml
  649  vim jenkins.yaml
  650  kubectl apply -f jenkins.yaml
  651  vim jenkins.yaml
  652  kubectl apply -f jenkins.yaml
  653  vim jenkins.yaml
  654  kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
  655  wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml -O ms.yaml
  656  vim ms.yaml
  657  kubectl apply -f ms.yaml
  658  vim ms.yaml
  659  vim jenkins.yaml
  660  kubectl apply -f jenkins.yaml
  661  helm uninstall sa-joomla
  662  helm uninstall wp-sa
  663  vim jenkins.yaml
  664  kubectl create namespace argocd
  665  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd.yaml
  666  vim argocd.yaml
  667  kubectl apply -f argocd.yaml
  668  kubectl delete -f argocd.yaml
  669  kubectl apply -f argocd.yaml -n argocd
  670  vim argocd.yaml
  671  vim jenkins.yaml
  672  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  673  cd ../
  674  ls
  675  cd 13.K8s/
  676  ls
  677  ls -a
  678  mkdir ci-cd
  679  cp ../14.K8s/jenkins.yaml ./ci-cd/
  680  ls -l
  681  ls -l ci-cd
  682  git add --all
  683  git commit -m "Add jenkins"
  684  git push
  685  kubectl get applications -n argocd
  686  kubectl get applications -n argocd -o yaml
  687  kubectl get pods -A
  688  history
```
---
```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'curl-test'
        image 'pluhin31/wget_curl:latest'
        ttyEnabled true
        command 'date'
        }
  }
  }
  stages {
    stage('Test') {
      steps {
        container('curl-test') {
          sh """#!/bin/sh
            curl --version
                curl https://onliner.by
                wget -O - https://onliner.by | egrep "https://[0-9a-z]+[.]onliner[.]by" -o | sort -u > tmp.out
                cat tmp.out
                curl \$(cat tmp.out) -I | egrep HTTP
          """
        }
      }
    }
  }
}
```