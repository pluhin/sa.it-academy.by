# Docker 2

```groovy
pipeline {
    agent any
    stages {
        stage('Test curl') {
            agent {
                docker { 
                    image 'appropriate/curl' 
                    label 'master'
                }
            }
            steps {
                sh """
                curl --version
                wget -O - https://onliner.by | egrep "https://[0-9a-z]+[.]onliner[.]by" -o | sort -u > tmp.out
                cat tmp.out
                curl \$(cat tmp.out) -I | egrep HTTP
                """
            }
        }
    }
}
```

---

```groovy
pipeline {
  environment {
    registry = "pluhin31/temp"
    registryCredential = 'dockerhub'
  }
  agent { label 'master'}
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/pluhin/build_sa.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
```

```groovy
node {
  def version = "latest"
  def name = "icinga2_ansible"
  def dockerRegistry = "URL"
  def image

  stage ("Checkout") {
    checkout scm
  }

  stage ("Docker: Build") {
    image = docker.build(
            "${dockerRegistry}/${name}:${version}",
            "-f ./Dockerfiles/i2_config_update.Dockerfile ./Dockerfiles"
        )
  }

  stage ("Docker: Push") {
    image.push "${version}"
    echo "Docker Image pushed: ${dockerRegistry}/${name}:${version}"
  }
}
```

---

```dockerfile
FROM alpine:3.11

RUN apk update && apk add --no-cache ansible=2.9.6-r0

ENTRYPOINT ["/usr/bin/ansible-playbook"]
```

--

```groovy
node {
	def gitCommit
	def name = "ansible"
    def version = "2.9.6"
	def dockerRegistry = "URL"

	stage ("Checkout") {
		checkout scm
		gitCommit = sh(returnStdout: true, script: "git rev-parse HEAD").trim()
	}

	stage ("Docker: Build and Push") {
        dir ("ansible") {
            def tag = "${gitCommit}"
            def app = docker.build "${dockerRegistry}/${name}:${version}"
            app.push "${version}"
            app.push "${tag}"
            app.push "latest"

            echo "------------"
            echo "Docker Image: ${dockerRegistry}/${name}:${version}"
            echo "------------"
        }
	}
}
```

[https://github.com/pluhin/docker_multi](https://github.com/pluhin/docker_multi)

```bash
1673* cd Documents/git_repos/sa.it-academy.by/demo/14.Docker
 1674* ls
 1675* cd app
 1676* docker-compose up
 1677* docker search mysql
 1678* env | grep proxy
 1679* docker-compose up
 1680* home_connect_local
 1681* history| grep vim
 1682* sudo vim /etc/systemd/system/docker.service.d/proxy.conf
 1683* docker-compose up
 1684* sudo service docker restart
 1685* sudo systemctl daemon-reload
 1686* sudo service docker restart
 1687* docker-compose up
 1688* docker-compose up -d
 1689* docker-compose stop web_app2
 1690* docker-compose stop web2
 1691* docker-compose down
 1692  top
 1693* cd ../jenkins
 1694* docker-compose up -d
 1695* docker-compose -v
 1696* docker-compose 1.18
 1699* sudo apt update
 1700* sudo apt upgrade docker-compouse
 1701* sudo apt upgrade docker-compose
 1702* docker-compose up -d
 1703* whereis docker-compose

```