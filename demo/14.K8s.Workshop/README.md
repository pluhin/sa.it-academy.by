```bash
 688  mkdir 14.K8s.Workshop
  689  cd 14.K8s.Workshop/
  690  ls
  691  vim Dockerfile
  692  git init
  693  mkdir -p .github/workflows
  694  vim .github/workflows/build.yaml
  695  git commit -m "first commit"
  696  git add --all
  697  git commit -m "first commit"
  698  git remote add origin git@github.com:pluhin/sa2-35-26-jenkins.git
  699  vim .github/workflows/build.yaml
  700  git push -u origin master
  701  history
  702  vim .github/workflows/build.yaml
  703  git add --all
  704  git commit -m "Add tag"
  705  git push
  706  mkdir jenkins.yaml
  707  rm jenkins.yaml
  708  rm jenkins.yaml -f
  709  rm jenkins.yaml -fr
  710  ls
  711  ls -a
  712  vim jenkins.yaml
  713  kubect apply -f jenkins.yaml
  714  kubectl apply -f jenkins.yaml
  715  history
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