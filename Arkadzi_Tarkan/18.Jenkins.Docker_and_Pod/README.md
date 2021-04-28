## Pipeline

```
pipeline {
  triggers { 
        cron('H 2 * * 7')
    }
  agent {
    kubernetes {
        containerTemplate {
        name 'manifest-test'
        image 'garethr/kubeval:latest'
        ttyEnabled true
        command 'watch date'
        }
    }
  }
  stages {
    stage('GitClone') {
      steps {
        container('ManifestTest') {
            git url: 'https://github.com/arkadzit/manifests_repo.git'
        }
      }
    }
    stage('git-check-manifest') {
      steps {
        container('manifest-test'){
            sh """#!/bin/sh 
            kubeval radarr.yaml
            """ 
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
    }
}
```

## Console Output

```
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] echo
[WARNING] containerTemplate option is deprecated, use yaml syntax to define containers.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: kubernetes ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Scheduled] Successfully assigned ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157 to node1
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Pulled] Container image "garethr/kubeval:latest" already present on machine
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Created] Created container manifest-test
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Started] Started container manifest-test
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Pulled] Container image "jenkins/inbound-agent:4.3-4" already present on machine
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Created] Created container jnlp
[Normal][ci-cd/jenkins-manifest-test-11-ft065-7glh4-hh157][Started] Started container jnlp
Still waiting to schedule task
‘jenkins-manifest-test-11-ft065-7glh4-hh157’ is offline
Agent jenkins-manifest-test-11-ft065-7glh4-hh157 is provisioned from template jenkins_manifest_test_11-ft065-7glh4
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://jenkins:8080/job/jenkins_manifest_test/11/"
    runUrl: "job/jenkins_manifest_test/11/"
  labels:
    jenkins: "slave"
    jenkins/label-digest: "a97b40675e2884e73160bc9c23490ba96d752319"
    jenkins/label: "jenkins_manifest_test_11-ft065"
  name: "jenkins-manifest-test-11-ft065-7glh4-hh157"
spec:
  containers:
  - command:
    - "watch"
    - "date"
    image: "garethr/kubeval:latest"
    imagePullPolicy: "IfNotPresent"
    name: "manifest-test"
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
      value: "jenkins-manifest-test-11-ft065-7glh4-hh157"
    - name: "JENKINS_NAME"
      value: "jenkins-manifest-test-11-ft065-7glh4-hh157"
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

Running on jenkins-manifest-test-11-ft065-7glh4-hh157 in /home/jenkins/agent/workspace/jenkins_manifest_test
[Pipeline] {
[Pipeline] container
[Pipeline] {
[Pipeline] stage
[Pipeline] { (GitClone)
[Pipeline] container
[Pipeline] {
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
Warning: JENKINS-30600: special launcher org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator$1@5fbda655; decorates org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator$1@23cc38d8; decorates RemoteLauncher[hudson.remoting.Channel@4643da11:JNLP4-connect connection from 10.233.90.107/10.233.90.107:53784] will be ignored (a typical symptom is the Git executable not being run inside a designated container)
Cloning the remote Git repository
Cloning repository https://github.com/arkadzit/manifests_repo.git
 > git init /home/jenkins/agent/workspace/jenkins_manifest_test # timeout=10
Fetching upstream changes from https://github.com/arkadzit/manifests_repo.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- https://github.com/arkadzit/manifests_repo.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision 0010373378b76b98b95036440fd0c0c62b954628 (refs/remotes/origin/master)
 > git config remote.origin.url https://github.com/arkadzit/manifests_repo.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 0010373378b76b98b95036440fd0c0c62b954628 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 0010373378b76b98b95036440fd0c0c62b954628 # timeout=10
Commit message: "Create sonarr.yaml"
 > git rev-list --no-walk 0010373378b76b98b95036440fd0c0c62b954628 # timeout=10
[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (git-check-manifest)
[Pipeline] container
[Pipeline] {
[Pipeline] sh
PASS - radarr.yaml contains a valid Deployment (radarr-app)
PASS - radarr.yaml contains a valid Service (radarr-web-service)
PASS - radarr.yaml contains a valid Ingress (ingress-radarr)
[Pipeline] }
[Pipeline] // container
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: sa-itacademy-by, channel: #alertmanager-notification, color: #00FF00, botUser: false, tokenCredentialId: slack_secret, notifyCommitters: false, iconEmoji: <empty>, username: <empty>, timestamp: <empty>
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