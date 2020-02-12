pipeline {
    agent {
        label 'node2'
    }
    stages {
        stage('Create volumes') {
            steps {
                sh """
                mkdir -p /var/lib/jenkins/path/to/movies
                mkdir -p /var/lib/jenkins/path/to/downloadclient-downloads
                mkdir -p /var/lib/jenkins/path/to/tvseries
                mkdir -p /var/lib/jenkins/www
                """
            }
        }
        stage('GitHub clone config'){
            steps {
                sh """
                git clone https://github.com/morozandralek/docker_build.git
                """
            }
        }
        stage('docker-compose UP'){
            steps{
                sh """
                cd docker_build
                git checkout jenkins
                docker-compose up -d
                """
            }
        }
        stage('Move index.html'){
            steps{
                sh """
                cp docker_build/index.html /var/lib/jenkins/www/
                """
            }
        }
    }
}
