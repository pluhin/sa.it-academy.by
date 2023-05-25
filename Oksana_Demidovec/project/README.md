#Project's reporter: Oksana Demidovec

##Group number: m-sa2-23-23


## Description of application for deployment

Name of application: my-release-drupal
Programming language: PHP
Technologies which were used in project
Orchestration: Kubernetes

Automation tools: Jenkins, Ansible

Other used technologies: HELM, Docker, MariaDB

SCM: GitHub

Notifications: Slack

In Jenkins created 3 pipiplines:
###Deploy
```
pipeline {
  agent {
  label 'ubuntu'
}
    triggers {
    pollSCM 'H/2 * * * *'
  }
  
    stages {
        stage('Hello') {
            steps {
                checkout scm: [$class: 'GitSCM',
          userRemoteConfigs: [[url: 'git@github.com:OksanaDemidovec/it-academy.project.git',
                              credentialsId: 'myCredId']],
                              branches: [[name: 'refs/heads/master']]
        ], poll: true
                echo 'Hello World'
                sh "pwd"
                sh "kubectl version"
                sh "helm version"
                sh "ls"
                sh "ls .."
                sh "cd ..; helm upgrade my-release project_drupal8 --values ./project_drupal8/values.yaml"
                
                
               
            }
            post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                // mail to: 'nces.oda@gmail.com',
                // subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                // body: "Something is wrong with ${env.BUILD_URL}"
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    } 
        }
    }
}
```
###Test
```
pipeline {
  agent {
  label 'ubuntu'
}
    triggers {
    pollSCM 'H/2 * * * *'
  }
  
    stages {
        stage('Hello') {
            steps {
                checkout scm: [$class: 'GitSCM',
          userRemoteConfigs: [[url: 'git@github.com:OksanaDemidovec/it-academy.project.git',
                              credentialsId: 'myCredId']],
                              branches: [[name: 'refs/heads/master']]
        ], poll: true
                echo 'Hello World'
                sh "pwd"
                sh "kubectl version"
                sh "helm version"
                sh "ls"
                sh "ls .."
                sh "kubectl port-forward svc/my-release-drupal -n default 8082:80&"
                sh 'export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drupal); export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}"); echo http://$NODE_IP:$NODE_PORT'
                sh "curl http://localhost:8082"
                
                
               
            }
            post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                // mail to: 'nces.oda@gmail.com',
                // subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                // body: "Something is wrong with ${env.BUILD_URL}"
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    } 
        }
    }
}
```
###Revert
```
pipeline {
  agent {
  label 'ubuntu'
}
    
  
    stages {
        stage('Hello') {
            steps {
                checkout scm: [$class: 'GitSCM',
          userRemoteConfigs: [[url: 'git@github.com:OksanaDemidovec/it-academy.project.git',
                              credentialsId: 'myCredId']],
                              branches: [[name: 'refs/heads/master']]
        ], poll: true
                
                sh "helm rollback my-release"
                
                
               
            }
            post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                // mail to: 'nces.oda@gmail.com',
                // subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                // body: "Something is wrong with ${env.BUILD_URL}"
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    } 
        }
    }
}
```

## Scheme
![Scheme](drupal.PNG)

## Links
[Git_repository](https://github.com/OksanaDemidovec/sa.it-academy.by)
[Source_drupal](https://github.com/cetic/helm-drupal)
Use official images of drupal:
[DockerHub](https://hub.docker.com/_/drupal/tags)