## Jenkins deployment

```bash
 744  mkdir 14.K8s.Application
  745  cd 14.K8s.Application/
  746  ls
  747  vim Dockerfile
  748  docker build -t  jfrog.it-academy.by/public/jenkins-ci:spishchyk_29 .
  749  docker images
  750  docker login jfrog.it-academy.by
  751  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk_29
  752  cat /proc/cpuinfo
  753  free
  754  free -h
  755  top
  756  df -h
  757  du -sh *
  758  du -sh /*
  759  sudo du -sh /*
  760  kubectl get ns
  761  vim jenkins.yaml
  762  kubectl apply -f jenkins.yaml
  763  kubectl logs jenkins-596bf696d4-6x4rg -n ci-cd
  764  vim jenkins.yaml
  765  k log ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx
  766  kubectl log ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx
  767  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx
  768  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx | grep relo
  769  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx | grep ci-cd
  770  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx | grep amiss
  771  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx | grep admiss
  772  kubectl logs ingress-nginx-controller-7ffb6d5b7c-9zvdp -n ingress-nginx | grep ci-cd | more
  773  history
```

## Create folder on NFS share

```bash
   46  mkdir /mnt/test
   47  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/

   67  mkdir -p /mnt/test/sa2-29-24/spishchyk/{jenkins,jenkins_pv}
   68  ls -l /mnt/test/sa2-29-24/spishchyk

   89  chmod 777 -R /mnt/test/sa2-29-24/spishchyk

   91  ls -l /mnt/test/sa2-29-24/spishchyk/
   92  cat /mnt/test/sa2-29-24/spishchyk/jenkins/jobs/Test/config.xml
   93  history

```

## Test job 

```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'curl-test'
        image 'pluhin31/wget_curl:latest'
        ttyEnabled true
        command 'sleep 180'
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