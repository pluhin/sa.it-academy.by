```bash
755  cd 14.K8s.Jenkins.Install/
  756  ls
  757  git init
  758  vim Dockerfile
  759  mkdir -p .github/workflows
  760  vim .github/workflows/build.yaml
  761  git add --all
  762  git status
  763  git commit -m "Init commit"
  764  git remote add origin git@github.com:pluhin/sa2-32-25-jenkins-build.git
  765  git push -u origin master
  766  mkdir jenkins
  767  cd jenkins/
  768  vim deploy_jenkins.yaml
  769  kubectl apply -f deploy_jenkins.yaml
  770  vim deploy_jenkins.yaml
  771  kubectl apply -f deploy_jenkins.yaml
  772  vim deploy_jenkins.yaml
  773  kubectl apply -f deploy_jenkins.yaml
  774  vim deploy_jenkins.yaml
  775  kubectl apply -f deploy_jenkins.yaml
  776  vim deploy_jenkins.yaml
  777  echo "cGFzc3dvcmQ=" | base64 -d
  778  vim deploy_jenkins.yaml
  779  kubectl apply -f deploy_jenkins.yaml
```

## Create folders (control plane node)

```
   58  mkdir /mnt/test/sa2-32-25/spishchyk/jenkins/
   59  chmod 777 /mnt/test/sa2-32-25/spishchyk/jenkins
   60  mount | grep test
   61  ls - /mnt/test/sa2-32-25/spishchyk/jenkins/jobs/Test_job/
   62  ls -l /mnt/test/sa2-32-25/spishchyk/jenkins/jobs/Test_job/
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