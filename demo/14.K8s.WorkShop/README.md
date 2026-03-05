```bash
764  mkdir 14.K8s.WorkShop
  765  cd 14.K8s.WorkShop/
  766  ls
  767  git init
  768  mkdir -p .github/workflows
  769  vim .github/workflows/build.yaml
  770  cat .github/workflows/build.yaml
  771  vim Dockerfile
  772  cat Dockerfile
  773  vim .github/workflows/build.yaml
  774  git add --all
  775  git commit -m "Init"
  776  git remote add origin git@github.com:pluhin/sa2-34-26-jenkins.git
  777  git push -u origin master
  778  history
  779  vim .github/workflows/build.yaml
  780  vim Dockerfile
  781  git commit --amend -a --no-edit
  782  git push origin -f
  783  vim jenkins.yaml
  784  kubectl apply -f jenkins.yaml
  785  vim jenkins.yaml
  786  kubectl label namespace ci-cd istio-injection=enabled --overwrite
  787  kubectl apply -f jenkins.yaml
  788  history
```

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