# Jenkinsfile:
```groovy
pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        disableConcurrentBuilds()
    }
    environment {
        BUILD = "${env.BUILD_ID}"
//        NEWBRANCH = "from_jenkins"
    }
    parameters {
        string(name: 'new_branch', defaultValue: 'from_jenkins', description: 'Enter new branch name')
        choice(name: 'repository_branch', choices: ['master', 'dev', 'features/do_one', 'hotfix/we_gonna_die'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:hutemai/test.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean old one package?')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    deleteDir()
                    git url: "${params.repository_url}", branch: "${params.repository_branch}"
            }
        }
        stage('Checking repository'){
            steps { 
                    sh "ls -l"
            }
        }
        stage('Create Branch'){
            steps {
                sh "git checkout -b ${params.new_branch}"
                sh "git branch"
                sh "git checkout ${params.new_branch}"
                sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh ' tar -zcvf /tmp/$BUILD.tar.gz  ./'
//                deleteDir()
                sh 'cp /tmp/$BUILD.tar.gz  ./'
                sh "ls -l"
            }
        }
        stage('Clean old one') {
            when {
                expression {params.do_clean == true}
            }
            steps {
                sh 'rm -f /tmp/*.tar.gz'
            }
        }
        stage('Packing test') {
            steps {
                sh "ls -l"
            }
        }
        stage('Git Push'){
            steps{
                sh """
                git add *
                git commit -a -m \"from_jenkins\"
                git push origin ${params.new_branch} --force
                """
            }
        }
        stage('Test') { 
            steps { 
                deleteDir()
                git url: "${params.repository_url}"
                sh "git checkout ${params.new_branch}"
                sh "echo \"Remote and Local branches are:\""
                sh 'git branch -a'
                sh "echo \"Files in remote ${params.new_branch}\" branch:"
                sh 'ls -l'
                sh """
                if [[ -f \$BUILD.tar.gz ]]; then
                    echo \"All is OK\"
                else
                    echo \"Package doesn't exist in ${params.new_branch} branch\" 2>&1
                fi
                """
            }
        }
        stage('Delete branch') { 
            input {
                message "All is OK, delete test branch?"
                ok "Yes."
//                submitter "alice,bob"
//                parameters {
//                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
//                }
            }
            steps { 
                    sh "git checkout master && git branch -D ${params.new_branch}"
                    sh "git push origin --delete ${params.new_branch}"
            }
        }
    }
    post {
        aborted {
            slackSend (color: '#808080', message: "ABORTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        success {
            slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}
```
