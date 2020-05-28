pipeline {
    agent {label 'node1'}
    stages {
        stage('Clone Git Repo') {
            steps {
                git credentialsId: 'b2922652-0478-4a1d-8072-7083a8ef79f8', url: 'git@github.com:ppavlov28/17.Project.git'
            }
        }
        stage('init environment') {
            steps {
                script{
                load "${env.WORKSPACE}/my-vars.groovy"
                }
            }
        }
        stage('checkout to backup') {
            when {
                equals expected: "restore", actual: "${params.START_JOB}"
            }
            steps {
                script {
                    if ( !params.BACKUP_TAG ) {
                        BT = sh (
                            script: "git tag --sort=taggerdate | tail -n1",
                            returnStdout: true
                    ).trim()
                    echo "BT = ${BT}"
                    } else {
                        BT = "${params.BACKUP_TAG}"
                        echo "BACKUP_TAG = ${params.BACKUP_TAG}"
                    }
                    sh "git checkout ${BT}"
                }
            }
        }
        stage('restore database') {
            when {
                equals expected: "restore", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                docker exec -i mysql sh -c 'exec mysql wordpress -uwordpress -pwordpress' < wordpress.sql
                """
            }
        }
        stage('backup database') {
            when {
                equals expected: "backup", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                docker exec mysql sh -c 'exec mysqldump wordpress -uwordpress -pwordpress' > wordpress.sql
                """
            }
        }
        stage('restore wp-data') {
            when {
                equals expected: "restore", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                sudo tar -xzvf backup_"${BT}".tar.gz
                """
            }
        }
        stage('backup wp-data') {
            when {
                equals expected: "backup", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                tar -czvf backup_"\$BUILD_NUMBER".tar.gz wordpress
                """
            }
        }
        stage("Tag and Push") {
            when {
                    equals expected: "backup", actual: "${params.START_JOB}"
            }
            environment { 
                GIT_TAG = "${env.BUILD_NUMBER}"
            }
            steps {
                sh """
                    git config user.name "${GIT_USER}"
                    git config user.email "${GIT_EMAIL}"
                    git checkout master
                    git add .
                    git commit -m "backup ${GIT_TAG}"
                    git tag -a "${GIT_TAG}" -m "[Jenkins CI] New Tag"
                """
                
                sshagent(['b2922652-0478-4a1d-8072-7083a8ef79f8']) {
                    sh "git push origin ${GIT_TAG}"
                }
            }
        }
        stage('Check docker-compose') {
            when {
                equals expected: "deploy", actual: "${params.START_JOB}"
            }
            steps {
                sh "docker-compose config"
            }
        }
        stage('Deploy docker-compose') {
            when {
                equals expected: "deploy", actual: "${params.START_JOB}"
            }
            steps {
                sh "sudo docker-compose up -d"
            }
        }
        stage('Wait for docker up') {
            when {
                equals expected: "deploy", actual: "${params.START_JOB}"
            }
            steps {
                sleep 60
            }
        }
        stage('config wordpress') {
            when {
                equals expected: "deploy", actual: "${params.START_JOB}"
            }
            steps {
                sh "curl -d 'weblog_title=${wp_title}&user_name=${wp_user_name}&admin_password=${wp_user_pass}&admin_password2=${wp_user_pass}&admin_email=${wp_user_mail}' http://${wp_host}/wp-admin/install.php?step=2"
            }
        }
        stage('check wordpress') {
            agent {label 'master'}
            when {
                equals expected: "deploy", actual: "${params.START_JOB}"
            }
            steps {
                script {
                WP = sh (
                    script: "curl -Is http://${wp_host}/wp-login.php | head -n 1",
                    returnStdout: true
                    ).trim()
                WP_OK = "HTTP/1.1 200 OK"
                echo "${WP}"
                echo "${WP_OK}"
                if ("${WP}" != "${WP_OK}") {
                    error('Something went wrong...')
                }
                }
            }
        }
        stage('clean docker') {
            when {
                equals expected: "clean", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                    docker ps -q | xargs docker stop
                    docker ps -a -q | xargs docker rm -f
                    docker images -q | xargs docker rmi -f
                    docker system prune -f
                """
            }
        }
        stage('delete workspace') {
            when {
                equals expected: "clean", actual: "${params.START_JOB}"
            }
            steps {
                sh """
                sudo rm -rf ${env.WORKSPACE}/*
                sudo find ${env.WORKSPACE} -type f -name ".*" -delete
                """
            }
        }
    }
    post {
        success {
            slackSend (color: '#00FF00', message: "SUCCESSFUL ${params.START_JOB}-${env.BUILD_NUMBER}: Job '${env.JOB_NAME}' (${env.BUILD_URL})")
        }
        failure {
            slackSend (color: '#FF0000', message: "FAILED ${params.START_JOB}-${env.BUILD_NUMBER}: Job '${env.JOB_NAME}' (${env.BUILD_URL})")
        }
    }
}