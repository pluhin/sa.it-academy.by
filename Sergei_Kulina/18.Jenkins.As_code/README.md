# 18.Jenkins.As_code

## Otput 

[Output report](https://github.com/Kulinych/test/blob/master/report.txt) 


## Jenkins pipeline output 
```bash
pipeline { 
    agent {
        node {
            label '1'
            
        }
    }    
    triggers {
        cron('H 2 * * 7')
    }
    stages {
        stage('Git clone') {
            steps {
                deleteDir()
                git url: 'https://github.com/Kulinych/test.git', branch: 'master'
            }
        }    
        stage('Count host') {
            steps { 
                sh """
                    nmap -n -sn 192.168.202.* 192.168.203.* -oG - | awk '/Up\$/{print \$2}' | wc -l > report.txt
                """
            }
        }    
        stage('Speedtest') {
            steps {
                sh """
                    echo "@@@@@@@@@@@@@@@@@" >> report.txt              
                    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - >> report.txt
                """
            }
        }
        stage('Github upload') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'git', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh """
                        git add -A
                        git commit -m "Update ${env.JOB_NAME} ${env.BUILD_NUMBER}"
                        git push https://${USER}:${encodedPass}@github.com/kulinych/test.git
                    """
                        }
                    }               
                }        
            }        
         
    post {
        success {
        slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        // mail to: 'pluhin@gmail.com',
        // subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
        // body: "Something is wrong with ${env.BUILD_URL}"
        }
        failure {
            slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }   
}   
'``
