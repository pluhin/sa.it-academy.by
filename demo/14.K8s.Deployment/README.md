```bash
  931  mkdir 14.K8s.Deployment
  932  cd 14.K8s.Deployment/
  933  ls
  934  vim Dockerfile
  935  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk_01 .
  936  docker images
  937  df -h
  938  docker version
  939  docker images
  940  docker login jfrog.it-academy.by
  941  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk_01
  942  curl -S https://jfrog.it-academy.by/ui/
  943  docker login jfrog.it-academy.by
  944  kubectl get ms
  945  kubectl get ns
  946  vim jenkins.yaml
  947  kubectl apply -f jenkins.yaml
  948  vim jenkins.yaml
  949  kubectl apply -f jenkins.yaml
  950  vim jenkins.yaml
  951  history
```

```bash
71  mkdir -p /mnt/test/sa2-25-23/amazurov/jenkins
   72  ls -l mkdir -p /mnt/test/sa2-25-23/
   73  exit
   74  mkdir -p /mnt/test/sa2-25-23/Ivanov/jenkins
   75  cd /mnt/test/sa2-25-23/
   76  ls
   77  mkdir -p /mnt/test/sa2-25-23/YMazurau/jenkins
   78  ls -al /mnt/test/sa2-25-23/YMazurau/jenkins
   79  ls -al /mnt/test/sa2-25-23/
   80  exit
   81  mkdir -p /mnt/test/sa2-25-23/baranau/jenkins
   82  cd /mnt/test/sa2-25-23/
   83  ls
   84  exit
   85  mkdir -p /mnt/test/sa2-25-23/spishchyk/jenkins
   86  ls -l /mnt/test/sa2-25-23/spishchyk/jenkins
   87  ls -l /mnt/test/sa2-25-23/spishchyk/
   88  ls -l /mnt/test/sa2-25-23/
   89  ls -l /mnt/test/sa2-25-23/
   90  ls -l /mnt/test/sa2-25-23/
   91  ls -l /mnt/test/sa2-25-23/
   92  ls -l /mnt/test/sa2-25-23/
   93  echo -n "my_pass" | base64
   94  ls -la /mnt/test/sa2-25-23-23/Ivanchuk_Pavel
   95  ls -la /mnt/test/sa2-25-23/Ivanchuk_Pavel
   96  ls -la /mnt/test/sa2-25-23/
   97  ls -la /mnt/test/sa2-25-23/YMazurau/
   98  exit
   99  ls -l /mnt/test/sa2-25-23/Ivanchuk_Pavel/jenkins
  100  mkdir -p /mnt/test/sa2-25-23/Ivanchuk_Pavel/jenkins
  101  ls -l /mnt/test/sa2-25-23/spishchyk/jenkins/
  102  history
```

## Task

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