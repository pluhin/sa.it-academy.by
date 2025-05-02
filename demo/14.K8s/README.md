```bash
  686  cd 13.K8s.Helm/
  687  mkdir jenkins
  688  cd jenkins/
  689  vim Dockerfile
  690  cd ..
  691  mkdir -p .github/workflows/
  692  vim .github/workflows/build.yaml
  693  vim jenkins/Dockerfile
  694  git add --all
  695  git commit -m "Add jenkins build"
  696  git push
  697  vim .github/workflows/build.yaml
  698  vim jenkins/deploy.yaml
  699  kubectl apply -f jenkins/deploy.yaml
  700  history

```



## Create NFS folders

```bash
   63  ls -l /mnt/test/sa2-31-25/spishchyk/
   64  chmod 777 -R /mnt/test/sa2-31-25/spishchyk/jenkins
   65  chmod 777 -R /mnt/test/sa2-31-25/andrei_tsimakhovich/jenkins/
   66  chmod 777 -R /mnt/test/sa2-31-25/vladislav_m/jenkins/
   67  mkdir -p /mnt/test/sa2-31-25/d_komar/jenkins
   68  chmod 777 -R /mnt/test/sa2-31-25/d_komar/jenkins/
```

## Test Job

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