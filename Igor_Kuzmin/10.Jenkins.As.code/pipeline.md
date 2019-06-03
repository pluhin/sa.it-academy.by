```    
pipeline {
    agent any
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    parameters {
        string(name: 'new_branch', defaultValue: 'jenkinstest', description: 'Enter new branch name')
        choice(name: 'repository_branch', choices: ['master', 'm-sa2-06-19', 'm-sa2-07-19', 'jenkins'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:IgorKzmn/sa.it-academy.by.git', description: 'Github repository url')
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
        stage('Pack project') {
            steps {
                sh ' tar -zcvf /tmp/$BUILD.tar.gz  ./'
                sh 'cp /tmp/$BUILD.tar.gz  ./'
                sh "ls -l"
            }
        }
        stage('Pack test') {
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