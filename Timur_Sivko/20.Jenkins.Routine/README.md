# 20. Jenkins. Routine

## Homework Assignment 1: Jenkins API

[Check User in Jenkins · Workflow runs · ostia27/10.Kubernetes · GitHub](https://github.com/ostia27/10.Kubernetes/actions/workflows/20.Jenkins.Routine.yml)

```yaml
name: Check User in Jenkins

on:
  workflow_dispatch:
    inputs:
      username:
        description: 'Username to check'
        required: true
        type: string

jobs:
  trigger-jenkins:
    runs-on: self-hosted
    
    steps:
      - name: Trigger Jenkins Job
        run: |
          curl "${{ secrets.JENKINS_URL }}/generic-webhook-trigger/invoke?username=${{ inputs.username }}&token=${{ secrets.TOKEN }}"
```

```groovy
def USER_EXISTS = false
pipeline {
    agent any
    
    parameters {
        string(name: 'username', defaultValue: '', description: 'Username to check in /etc/passwd')
    }
    
    stages {
        stage('Validate Input') {
            steps {
                script {
                    if (params.username.trim().isEmpty()) {
                        error "Username parameter cannot be empty"
                    }
                }
            }
        }
        
        stage('Check User') {
            steps {
                script {
                    def result = sh(script: "getent passwd ${params.username} >/dev/null 2>&1 && echo 1 || echo 0", returnStdout: true)
                    echo "${result.trim()}"
                    echo "${(result.trim().toInteger() == 1)}"
                    USER_EXISTS = (result.trim().toInteger() == 1)
                }
            }
        }
        
        stage('Notify') {
            steps {
                script {
                    echo "${USER_EXISTS}"
                    def message = USER_EXISTS ? 
                        "✅ User '${params.username}' exists in /etc/passwd" :
                        "❌ User '${params.username}' does not exist in /etc/passwd"
                    slackSend(
                        channel: '#timur-github-package',
                        color: USER_EXISTS.toBoolean() ? 'good' : 'danger',
                        message: message,
                        tokenCredentialId: 'Slack2',
                        botUser: true
                    )
                }
            }
        }
    }
    
    post {
        failure {
            slackSend(
                channel: '#timur-github-package',
                color: 'danger',
                message: "❌ Pipeline failed while checking user '${params.username}'",
                tokenCredentialId: 'Slack2',
                botUser: true
            )
        }
    }
}
```

![Снимок экрана_2024-12-24_14-48-57.png](Cнимок%20экрана_2024-12-24_14-48-57.png)


