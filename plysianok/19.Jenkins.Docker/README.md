# 19.Jenkins.Docker

---

```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'kubeval'
        image 'garethr/kubeval:latest'
        ttyEnabled true
        command 'watch date'
        }
    }
  }
  stages {
    stage('Clone repository') { 
        steps { 
                git url: 'https://github.com/WESTnik/19.Jenkins.git',
                credentialsId: "github"
        }
    }
    stage('Run kubeval in parallel') {
        parallel {
            stage('Check alertmanager.yaml') {
                steps {
                    container('kubeval') {
                      sh """#!/bin/sh
                        kubeval alertmanager.yaml
                        
                    """
                    }
                }
            }
            stage('Check ns.yaml') {
                steps {
                    container('kubeval') {
                      sh """#!/bin/sh
                        kubeval ns.yaml
                        
                    """
                    }
                }
            }
        }
    }
  }
  post {
    success {
        slackSend (channel: "#100", color: "good", message: "SUCCESSFUL: Job '(${env.BUILD_URL})")
        }
    failure {
        slackSend (channel: "#100", color: '#FF0000', message: "FAILED: Job '(${env.BUILD_URL})")
        }
    }
}

```

---
## Jenkins pipeline console output

```bash
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] containerTemplate option is deprecated, use yaml syntax to define containers.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node

Created Pod: kubernetes ci-cd/kubeval-9-fs24d-6hckb-5m0jl
[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Scheduled] Successfully assigned ci-cd/kubeval-9-fs24d-6hckb-5m0jl to node2

[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Pulled] Container image "garethr/kubeval:latest" already present on machine
[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Created] Created container kubeval
[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Started] Started container kubeval
[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Pulled] Container image "jenkins/inbound-agent:4.3-4" already present on machine
[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Created] Created container jnlp

[Normal][ci-cd/kubeval-9-fs24d-6hckb-5m0jl][Started] Started container jnlp

Agent kubeval-9-fs24d-6hckb-5m0jl is provisioned from template kubeval_9-fs24d-6hckb
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/kubeval/9/"
    runUrl: "job/kubeval/9/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "958623f8a62e442377b894ee3aa52202e34e005a"
    jenkins/label: "kubeval_9-fs24d"
  name: "kubeval-9-fs24d-6hckb-5m0jl"
spec:
  containers:
  - command:
    - "watch"
    - "date"
    image: "garethr/kubeval:latest"
    imagePullPolicy: "IfNotPresent"
    name: "kubeval"
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
      value: "kubeval-9-fs24d-6hckb-5m0jl"
    - name: "JENKINS_NAME"
      value: "kubeval-9-fs24d-6hckb-5m0jl"
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

Running on kubeval-9-fs24d-6hckb-5m0jl in /home/jenkins/agent/workspace/kubeval
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] git
The recommended git tool is: NONE

using credential github
Warning: JENKINS-30600: special launcher org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator$1@752bf04f; decorates RemoteLauncher[hudson.remoting.Channel@59aa5cff:JNLP4-connect connection from 10.233.96.99/10.233.96.99:40756] will be ignored (a typical symptom is the Git executable not being run inside a designated container)
Cloning the remote Git repository

Avoid second fetch
Checking out Revision 706a809958db6f584abd89bb97ad556496313782 (refs/remotes/origin/master)

Cloning repository https://github.com/WESTnik/19.Jenkins.git
 > git init /home/jenkins/agent/workspace/kubeval # timeout=10
Fetching upstream changes from https://github.com/WESTnik/19.Jenkins.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
using GIT_ASKPASS to set credentials github
 > git fetch --tags --force --progress -- https://github.com/WESTnik/19.Jenkins.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/WESTnik/19.Jenkins.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 706a809958db6f584abd89bb97ad556496313782 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 706a809958db6f584abd89bb97ad556496313782 # timeout=10

Commit message: "Second commit"
 > git rev-list --no-walk 706a809958db6f584abd89bb97ad556496313782 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Run kubeval in parallel)
[Pipeline] parallel
[Pipeline] { (Branch: Check alertmanager.yaml)
[Pipeline] { (Branch: Check ns.yaml)

[Pipeline] stage
[Pipeline] { (Check alertmanager.yaml)
[Pipeline] stage
[Pipeline] { (Check ns.yaml)

[Pipeline] container
[Pipeline] {
[Pipeline] container
[Pipeline] {

[Pipeline] sh
[Pipeline] sh

PASS - ns.yaml contains a valid Namespace (monitoring)
[Pipeline] }
PASS - alertmanager.yaml contains a valid ConfigMap (monitoring.alertmanager-config)
PASS - alertmanager.yaml contains a valid ConfigMap (monitoring.alertmanager-templates)
PASS - alertmanager.yaml contains a valid Deployment (monitoring.alertmanager)
PASS - alertmanager.yaml contains a valid Service (monitoring.alertmanager)
PASS - alertmanager.yaml contains a valid Ingress (monitoring.alertmanager-ingres)
[Pipeline] // container

[Pipeline] }
[Pipeline] }
[Pipeline] // stage
[Pipeline] // container
[Pipeline] }
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)

[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: Notifications, channel: #100, color: good, botUser: false, tokenCredentialId: SLACK_TOKEN, notifyCommitters: false, iconEmoji: <empty>, username: <empty>, timestamp: <empty>
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // podTemplate
[Pipeline] End of Pipeline

Global Slack Notifier try posting to slack. However some error occurred
TeamDomain :Notifications
Channel :100
Message :build success!

Finished: SUCCESS

```

