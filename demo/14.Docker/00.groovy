pipeline {
    agent none
    stages {
        stage('Test curl') {
            agent {
                docker { image 'appropriate/curl' }
            }
            steps {
                sh """
                curl --version
                wget -O - https://onliner.by | egrep "https://[0-9a-z]+[.]onliner[.]by" -o | sort -u > tmp.out
                cat tmp.out
                curl \$(cat tmp.out) -I | egrep HTTP
                """
            }
        }
    }
}