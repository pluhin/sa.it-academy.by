pipeline {
    agent {
        label 'master'
    }
    
    environment {
        APP_DB_CREDENTIALS = credentials("${params.APP_DB_CREDENTIALS}")
    }

    parameters {
        string(
            name: 'APP_VERSION',
            description: 'Version of application (wordpress)'
        )
        
        string(
            name: 'APP_ROLLBACK_VERSION',
            description: 'Version of application if deployment failure'
        )

        booleanParam(
            name: 'InitialDeployment',
            defaultValue: 'False'
        )
        
        string(
            name: 'GitRepo',
            defaultValue: 'git@github.com:upanasiuk/project.git',
            description: 'Repo where docker-compose.yaml is'
        )

        string(
            name: 'GitBranch',
            defaultValue: 'pipeline',
            description: 'Branch where pipeline scripts are'
        )
        
        credentials(
            name: 'GitCredsToUse',
            description: 'Credentials to use for GIT repo',
            defaultValue: 'github',
            credentialType: 'com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey'
        )

        string(
            name: 'APP_URL',
            defaultValue: 'app.project.local',
            description: 'URL where the app will be available'
        )

        string(
            name: 'PROJECT_NAME',
            defaultValue: 'projectwork',
            description: 'Name of docker\'s pod'
        )

        string(
            name: 'MYSQL_VERSION',
            defaultValue: '5.7',
            description: 'Version of MYSQL DB'
        )

        string(
            name: 'APP_DB_NAME',
            defaultValue: 'wordpress',
            description: 'Name of DATABASE'
        )
        
        credentials(
            name: 'APP_DB_CREDENTIALS',
            description: 'MYSQL DB credentials',
            defaultValue: 'wp_db_credentials',
            credentialType: 'Username with password'
        )
    }

    stages {
        stage('Check parameters') {
            when {
                expression {
                    return ! ( params.APP_VERSION && ( params.InitialDeployment || params. APP_ROLLBACK_VERSION ) )
                } 
            }
            steps {
                error("You must specify APP_VERSION and either InitialDeployment or APP_ROLLBACK_VERSION")
            }
        }

        stage('Backup') {
            when {
                expression { 
                    return ! params.InitialDeployment 
                } 
            }
            steps {
                build job: 'Backup'
            }
        }

        stage('Pull Github') {
            steps {
                git credentialsId: "${params.GitCredsToUse}", url: "${params.GitRepo}", branch: "${params.GitBranch}"
            }
        }

        stage('Download images') {
            parallel {
                stage('Download MYSQL docker image') {
                    steps {
                        script {
                            docker.image("mysql:${params.MYSQL_VERSION}").pull()
                        }
                    }
                }
        
                stage('Download APP docker image') {
                    steps {
                        script {
                            docker.image("vspanasyuk/wordpress:${params.APP_VERSION}").pull()
                        }
                    }
                }
            }
        }
        
        stage('Update docker service') {
            steps {
                ansiblePlaybook extras: "-e APP_VERSION=${params.APP_VERSION} -e MYSQL_VERSION=${params.MYSQL_VERSION} -e APP_DB_NAME=${params.APP_DB_NAME} -e APP_DB_USER=${env.APP_DB_CREDENTIALS_USR} -e APP_DB_PASSWORD=${env.APP_DB_CREDENTIALS_PSW} -e PROJECT_NAME=${params.PROJECT_NAME} -e PROJECT_URL=${params.APP_URL} -e DOCKER_INTERNAL_PORT=8300", inventory: 'ansible-inv.yaml', playbook: 'ansible-playbook.yaml', become: true
            }
        }
        
        stage('Check deployment') {
            steps {
                sh "./check-deployment.sh 60 http://${params.APP_URL} WordPress"
            }
        }
    }

    post {
        success {
            slackSend (color: '#00FF00', message: "[SUCCESS] Job: ${env.JOB_NAME} ID: ${env.BUILD_ID} URL: ${env.BUILD_URL}")
        }

        failure {
            slackSend (color: '#FF0000', message: "[FAILURE] Job: ${env.JOB_NAME} ID: ${env.BUILD_ID} URL: ${env.BUILD_URL}")

            script {
                if (! params.InitialDeployment && params.APP_ROLLBACK_VERSION) {
                    ansiblePlaybook extras: "-e APP_VERSION=${params.APP_ROLLBACK_VERSION} -e MYSQL_VERSION=${params.MYSQL_VERSION} -e APP_DB_NAME=${params.APP_DB_NAME} -e APP_DB_USER=${env.APP_DB_CREDENTIALS_USR} -e APP_DB_PASSWORD=${env.APP_DB_CREDENTIALS_PSW} -e PROJECT_NAME=${params.PROJECT_NAME} -e PROJECT_URL=${params.APP_URL} -e DOCKER_INTERNAL_PORT=8300", inventory: 'ansible-inv.yaml', playbook: 'ansible-playbook.yaml', become: true
                    build job: 'Restore'
                }
            }
        }
    
    }
}
