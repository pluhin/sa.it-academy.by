## Jenkins task as code
https://jenkins.io/doc/book/pipeline/
### Simple tasks
Add Pipeline script from UI
```groovy
pipeline { 
    agent any 
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
                sh '''
                tar -zcvf /tmp/package.tar.gz  ./
                '''
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
### Add variables

```groovy
pipeline {
    agent any
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    parameters {
        choice(name: 'repository_branch', choices: ['master', 'm-sa2-06-19', 'jenkins'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:pluhin/sa.it-academy.by.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean old one package?')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    git branch: '${params.repository_branch}', url: '${params.repository_url}'

            }
        }
        stage('Checking repository'){
            steps { 
                    sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh '''
                    tar -zcvf /tmp/$BUILD.tar.gz  ./
                '''
                deleteDir()
                sh 'cp /tmp/$BUILD.tar.gz  ./'
            }
        }
        stage('Clean old one') {
            when {
                expression {params.do_clean == true}
            }
            steps {
                sh 'rm -f /tmp/$BUILD.tar.gz'
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
### Work with git branches
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
                    git url: 'git@github.com:pluhin/sa.it-academy.by.git'
            }
        }
        stage('Create branch') { 
            steps { 
                    sh 'git checkout -b $NEW_BRANCH'
                    sh 'git branch'
                    sh 'git push origin $NEW_BRANCH'
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
                    sh 'echo "Remote branches are:"'
                    sh 'git branch -r'
                    sh 'echo "Local branches are:"'
                    sh 'git branch'
            }
        }
    }
}
```
### Notification for slack
1. Install Plugin on Jenkins server **Slack Notification**
2. In Jenkins -> configuration -> Global Slack Notifier Settings 
    - https://sc-itacademy-by.slack.com/services/hooks/jenkins-ci/
    - add token to ID storage
3. In the job add the following:
```groovy
post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
```
### Multibranch Jobs
1. Create git project (git@github.com:pluhin/multibranches.git)
2. Add existing Jenkinsfile into master (done)
3. Add Mutibranch Jenkins Job (Periodically 1m)
4. Add new branch
```bash
git checkout -b feature_02
git push
git push --set-upstream origin feature_02
```
- test it on web UI
