![image](https://user-images.githubusercontent.com/110092772/192485724-a01dd13a-2405-4371-ab46-cec272278694.png)


## Jenkinsfile

```bash

pipeline {
    agent {label "debian"}
    triggers {
        cron('0 2 * * 0')
    }    
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        //ansiColor('xterm')
    }
    stages {
        stage('Clone repository') {
            steps {
                git url: 'https://github.com/KirillNichiporov/CI-CD.git', credentialsId: 'repo_jenkins'
            }
        }
        stage('Checking internet speed and online hosts'){
            steps {
                sh """
                nmap -sP $IP_ADDR/24 >> 20.Jenkins
                speedtest-cli >> 20.Jenkins
                """
            }
        }
        stage('Push to my repository') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'repo_jenkins', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh """
                    git checkout master
                    git add .
                    git commit -m "update 20.Jenkins"
                    git push https://${USER}:${encodedPass}@github.com/KirillNichiporov/CI-CD.git master
                    """
                }
            }
        }
    }
}

```
## Link to the repository

[Repo with Results(20.Jenkins)](https://github.com/KirillNichiporov/CI-CD)
