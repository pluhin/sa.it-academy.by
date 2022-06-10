
```
vagrant@vagrant:~/jenkins$ docker login jfrog.it-academy.by
Username: sa
Password:
WARNING! Your password will be stored unencrypted in /home/vagrant/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
vagrant@vagrant:~/jenkins$ docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
```


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

## History

```
 750  mkdir jenkins
  751  cd jenkins/
  752  ls
  753  history | grep 127
  754  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.57 -f -N
  755  history | grep joomla
  756  helm uninstall sa-joomla
  757  claer
  758  clear
  759  vim Dockerfile
  760  ps aux | grep 127
  761  netstat -ntp
  762  sudo apt intall network-tools
  763  sudo apt install network-tools
  764  sudo apt install nettools
  765  sudo apt install net-tools
  766  netstat -ntp
  767  netstat -ntpe
  768  netstat -ntpa
  769  netstat -ntpa | grep 6443
  770  vim Dockerfile
  771  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  772  docker images
  773  docker login jfrog.it-academy.by
  774  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
  775  vim jenkins.yaml
  776  kubectl apply -f jenkins.yaml
  777  kubectl get pod -n ci-cd
  778  kubectl delete -f jenkins.yaml
  779  vim jenkins.yaml
  780  kubectl apply -f jenkins.yaml
  781  kubectl create namespace argocd
  782  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd_install.yaml
  783  vim argocd_install.yaml
  784  cp argocd_install.yaml /vagrant/
  785  kubectl apply -f argocd_install.yaml -n argocd
  786  vim argocd_install.yaml
  787  kubectl apply -f argocd_install.yaml -n argocd
  788  vim argocd_install.yaml
  789  kubectl apply -f argocd_install.yaml -n argocd
  790  cp argocd_install.yaml /vagrant/
  791  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  792  ls -l ../secrets_helm/
  793  ls -l ../secrets_helm/ -a
  794  cd ../
  795  cd secrets_helm/
  796  git branches
  797  git branch
  798  cd helm-test/
  799  git branch
  800  ls
  801  mkdir ci-cd
  802  cp ../../jenkins/jenkins.yaml ci-cd/
  803  git add --all
  804  git commit -m "add jenkins"
  805  git push
  806  vim ci-cd/jenkins.yaml
  807  git add --all
  808  git commit -m "Change CPU"
  809  git push
  810  kubectl get application -n argocd jenkins
  811  kubectl get application -n argocd jenkins -o yaml
  812  kubectl get application -n argocd joomla -o yaml
  813  history
```


