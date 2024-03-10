```bash
  827  mkdir 14.K8s.Jenkins
  828  ls
  829  cd 14.K8s.Jenkins/
  830  ls
  831  vim Dockerfile
  832  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk_02 .
  833  docker login jfrog.it-academy.by
  834  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk_02
  835  vim jenkins.yaml
  836  kubectl apply -f jenkins.yaml
  837  vim jenkins.yaml
  838  vim Dockerfile
  839  vim jenkins.yaml
  840  claer
  841  clear
  842  kubectl apply -f jenkins.yaml
  843  vim jenkins.yaml
  844  history
```
---

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