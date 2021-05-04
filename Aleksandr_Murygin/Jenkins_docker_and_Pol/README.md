```groove
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'kubeval-test'
        image 'garethr/kubeval:latest'
        ttyEnabled true
        command 'watch date'
        }
    }
  }
    stages {
        stage('Clone repository') {
            steps {
                container('kubeval-test'){
                    git url: 'https://github.com/AleksandMur/word01.git'
                }    
            }
        }
        stage('parallel') {
            parallel {
                stage('test1') { 
                    steps { 
                        container('kubeval-test'){
                            sh """#!/bin/sh
                            kubeval deploy.yaml
                            """
                        }    
                    }
                }
                stage('test2') { 
                    steps {
                        container('kubeval-test'){
                            sh """#!/bin/sh
                            kubeval pv.yaml
                            """
                        }    
                    }
                }
                stage('test3') { 
                    steps { 
                        container('kubeval-test'){
                            sh """#!/bin/sh
                            kubeval pvc.yaml
                            """
                        }    
                    }
                }
                stage('test4') { 
                    steps { 
                        container('kubeval-test'){
                            sh """#!/bin/sh
                            kubeval ingres.yaml
                            """
                        }
                    }
                }
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
        always {
            deleteDir()
        }
    }
}
```

```sh
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] containerTemplate option is deprecated, use yaml syntax to define containers.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: kubernetes ci-cd/homework-6-5g29p-jk35l-pcn4r
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Scheduled] Successfully assigned ci-cd/homework-6-5g29p-jk35l-pcn4r to node1
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Pulled] Container image "garethr/kubeval:latest" already present on machine
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Created] Created container kubeval-test
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Started] Started container kubeval-test
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Pulled] Container image "jenkins/inbound-agent:4.3-4" already present on machine
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Created] Created container jnlp
[Normal][ci-cd/homework-6-5g29p-jk35l-pcn4r][Started] Started container jnlp

Agent homework-6-5g29p-jk35l-pcn4r is provisioned from template homework_6-5g29p-jk35l
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/homework/6/"
    runUrl: "job/homework/6/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "8cafb8f51baad53f4daee5cc2f778d6b15d85295"
    jenkins/label: "homework_6-5g29p"
  name: "homework-6-5g29p-jk35l-pcn4r"
spec:
  containers:
  - command:
    - "watch"
    - "date"
    image: "garethr/kubeval:latest"
    imagePullPolicy: "IfNotPresent"
    name: "kubeval-test"
    resources:
      limits: {}
      requests: {}
    tty: true
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  - env:
    - name: "JENKINS_SECRET"
      value: "********"
    - name: "JENKINS_AGENT_NAME"
      value: "homework-6-5g29p-jk35l-pcn4r"
    - name: "JENKINS_NAME"
      value: "homework-6-5g29p-jk35l-pcn4r"
    - name: "JENKINS_AGENT_WORKDIR"
      value: "/home/jenkins/agent"
    - name: "JENKINS_URL"
      value: "http://jenkins:8080/"
    image: "jenkins/inbound-agent:4.3-4"
    name: "jnlp"
    resources:
      limits: {}
      requests:
        memory: "256Mi"
        cpu: "100m"
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  nodeSelector:
    kubernetes.io/os: "linux"
  restartPolicy: "Never"
  volumes:
  - emptyDir:
      medium: ""
    name: "workspace-volume"

Running on homework-6-5g29p-jk35l-pcn4r in /home/jenkins/agent/workspace/homework
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)

[Pipeline] container
[Pipeline] {
[Pipeline] git
The recommended git tool is: NONE

No credentials specified
Warning: JENKINS-30600: special launcher org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator$1@35785817; decorates org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator$1@5bc84f5d; decorates RemoteLauncher[hudson.remoting.Channel@1ab59e29:JNLP4-connect connection from 10.233.90.185/10.233.90.185:58396] will be ignored (a typical symptom is the Git executable not being run inside a designated container)
Cloning the remote Git repository

Cloning repository https://github.com/AleksandMur/word01.git
 > git init /home/jenkins/agent/workspace/homework # timeout=10
Fetching upstream changes from https://github.com/AleksandMur/word01.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- https://github.com/AleksandMur/word01.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision a9788bc3685c0cb5d67bf3e35d74928f5147f5d5 (refs/remotes/origin/master)

 > git config remote.origin.url https://github.com/AleksandMur/word01.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f a9788bc3685c0cb5d67bf3e35d74928f5147f5d5 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master a9788bc3685c0cb5d67bf3e35d74928f5147f5d5 # timeout=10

Commit message: "test complete"
 > git rev-list --no-walk a9788bc3685c0cb5d67bf3e35d74928f5147f5d5 # timeout=10

[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (parallel)
[Pipeline] parallel
[Pipeline] { (Branch: test1)
[Pipeline] { (Branch: test2)
[Pipeline] { (Branch: test3)
[Pipeline] { (Branch: test4)
[Pipeline] stage
[Pipeline] { (test1)
[Pipeline] stage
[Pipeline] { (test2)

[Pipeline] stage
[Pipeline] { (test3)
[Pipeline] stage
[Pipeline] { (test4)
[Pipeline] container
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] sh

[Pipeline] sh
[Pipeline] sh
PASS - pv.yaml contains a valid PersistentVolume (nfs-word01)
PASS - deploy.yaml contains a valid Deployment (project.wordpress01)
[Pipeline] sh

PASS - deploy.yaml contains a valid Service (project.wordpress-balancer)
PASS - pvc.yaml contains a valid PersistentVolumeClaim (project.wordpress-volume01)
[Pipeline] }
[Pipeline] }
[Pipeline] }
[Pipeline] // container
PASS - ingres.yaml contains a valid Ingress (project.ingress-sa2)
[Pipeline] // container
[Pipeline] // container
[Pipeline] }

[Pipeline] }
[Pipeline] }
[Pipeline] }
[Pipeline] // stage
[Pipeline] // stage
[Pipeline] // stage
[Pipeline] }
[Pipeline] }
[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // stage
[Pipeline] }

[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] deleteDir
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: sa-itacademy-by, channel: #test-alert, color: #00FF00, botUser: false, tokenCredentialId: slack_secret, notifyCommitters: false, iconEmoji: <empty>, username: <empty>, timestamp: <empty>

[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // container
[Pipeline] }

[Pipeline] // node
[Pipeline] }
[Pipeline] // podTemplate
[Pipeline] End of Pipeline
Finished: SUCCESS
```

