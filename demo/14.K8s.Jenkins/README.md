```bash
  875  vim Dockerfile
  876  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  877  docker login jfrog.it-academy.by
  878  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
  879  kubectl get ns
```

## Login to jfrog.it-academy.by

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

Please create nfs folder before apply manifests

## test task


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