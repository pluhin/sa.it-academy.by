# Jenkins as code 

## Jenkins task 1

```groovy
pipeline { 
    agent any
    triggers { 
        cron('H */1 * * *')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:pluhin/sa.it-academy.by.git'
            }
        }
        stage('Checking repository'){
            steps { 
                sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh """
                tar -zcvf /tmp/package.tar.gz  ./
                """
                deleteDir()
                sh "mv /tmp/package.tar.gz  ./"
            }
        }
        stage('Packing test') {
            steps {
                sh "ls -l"
            }
        }
    
    }
}
```
## Jenkins task 2

```groovy
pipeline { 
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('parallel') {
            parallel {
                stage('Clone repository 01') { 
                    steps { 
                        dir('01') {
                            git url: 'https://github.com/pluhin/sa.it-academy.by.git'
                            sh """
                                tar -zcvf /tmp/package_01.tar.gz  ./
                                ls -l
                            """
                            deleteDir()
                            sh "mv /tmp/package_01.tar.gz  ./"
                        }
                    }
                }
                stage('Clone repository 02') { 
                    steps { 
                        dir('02') {
                            git url: 'https://github.com/pluhin/jenkins_ci.git'
                            sh """
                                tar -zcvf /tmp/package_02.tar.gz  ./
                                ls -l
                            """
                            deleteDir()
                            sh "mv /tmp/package_02.tar.gz  ./"
                        }
                    }
                }
            }
        }
        stage('Packing test') {
            steps {
                sh """
                ls -l ./01
                echo "#####################################################"
                ls -l ./02
                """
            }
        }
    }
}
```
## Jenkins task 3
```groovy
pipeline {
    agent any
    environment {
        NEW_BRANCH = "new_branch"
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    deleteDir()
                    git url: 'https://github.com/pluhin/sa.it-academy.by.git'
            }
        }
        stage('Create branch') { 
            steps { 
                    sh """
                        git checkout -b $NEW_BRANCH
                        git branch
                        git push origin $NEW_BRANCH
                    """
            }
        }
        stage('Delete branch') { 
            steps { 
                    sh 'git checkout master && git branch -D $NEW_BRANCH'
                    sh 'git push origin --delete $NEW_BRANCH'
            }
        }
        stage('Test') { 
            steps { 
                    sh """
                    echo "Remote branches are:"
                    git branch -r
                    echo "Local branches are:"
                    git branch
                    """
            }
        }
    }
    post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    }
}
```

https://github.com/pluhin/multibranches.git

```bash

10317  cd  ~/Documents/git_repos/home/sa.it-academy.by
10318  cd demo/17.Jenkins_as_code
10319  ls
10320  history| grep "localhost"
10321  ssh -L 6443:localhost:6443 root@192.168.201.22 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10322  kubectl get nodes
10323  k9s
10324  kubectl apply -f jenkins.yaml
10325  k9s
10326  kubectl apply -f jenkins.yaml
10327  kubectl get nodes -n ci-cd
10328  kubectl get pods -n ci-cd
10329  kubectl delete pods -n ci-cd jenkins-5ff956d59b-tcb8c
10330  kubectl get pods -n ci-cd
10331  watch | kubectl get pods -n ci-cd
10332  watch  kubectl get pods -n ci-cd
10333  kubectl apply -f jenkins.yaml
10334  watch  kubectl get pods -n ci-cd
10335  kubectl delete pods -n ci-cd jenkins-5ff956d59b-hgs6b
10336  kubectl apply -f jenkins.yaml
10337  watch  kubectl get pods -n ci-cd
10338  kubectl delete pods -n ci-cd jenkins-5ff956d59b-t98p8
10339  k9s
10340  vim /etc/hosts
10341  ec_ssh_jump
10342  sudo vim /etc/hosts
10343  export API_AUTH_HEADER='admin:11a61e8f33bfea869b4185bdc62e0ec22a'
10344  curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-22.sa/job/30.Jenkins_code_01/build
10345  curl -X GET -u ${API_AUTH_HEADER}  http://jenkins.k8s-22.sa/job/30.Jenkins_code_01/config.xml -o task.xml
10346  curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-22.sa/job/30.Jenkins_code_01/config.xml --data-binary "@task.xml"


10354  curl -X POST -u ${API_AUTH_HEADER}  "http://jenkins.k8s-22.sa/createItem?name=30.Jenkins_code_99" --data-binary "@task.xml"  -H "Content-Type:text/xml"

```