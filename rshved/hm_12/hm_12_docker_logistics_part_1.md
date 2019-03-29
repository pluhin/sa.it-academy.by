# Docker.Logistics
### Automate task **11. Docker. Lading** by Jenkins
##### Jenkinsfile
```groovy
pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        disableConcurrentBuilds()
    }
    environment {
        registry = "hutemai/jenkins_test"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    parameters {
        string(name: 'repository_url', defaultValue: 'git@github.com:hutemai/dokcer_test.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean local docker image?')
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git "${params.repository_url}"
            }
        }
        stage('Checking repository'){
            steps { 
                    sh "ls -l"
            }
        }
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            when {
                expression {params.do_clean == true}
            }
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
```
##### Pipeline docker_hub:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_12/pics_part_1/dockerhub_1.png?raw=true)
##### DockerHub:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_12/pics_part_1/dockerhub_2.png?raw=true)
##### Jenkins OUTPUT:
```bash
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/docker_hub
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Cloning Git)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:hutemai/dokcer_test.git # timeout=10
Fetching upstream changes from git@github.com:hutemai/dokcer_test.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:hutemai/dokcer_test.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 57b1c974b7d3b39fd6bfbb1f7d96db4510adb19a (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 57b1c974b7d3b39fd6bfbb1f7d96db4510adb19a
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 57b1c974b7d3b39fd6bfbb1f7d96db4510adb19a
Commit message: "docker_test"
 > git rev-list --no-walk 57b1c974b7d3b39fd6bfbb1f7d96db4510adb19a # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 16
-rw-r--r-- 1 jenkins jenkins 118 Mar 26 01:29 Dockerfile
drwxr-xr-x 2 jenkins jenkins  34 Mar 26 01:29 __pycache__
-rw-r--r-- 1 jenkins jenkins   6 Mar 26 01:29 requirements.txt
-rw-r--r-- 1 jenkins jenkins 685 Mar 26 01:29 start.py
-rw-r--r-- 1 jenkins jenkins 416 Mar 26 01:29 start.pyc
drwxr-xr-x 2 jenkins jenkins  41 Mar 26 01:29 templates
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Building image)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ docker build -t hutemai/jenkins_test:5 .
Sending build context to Docker daemon 71.68 kB

Step 1/6 : FROM python:alpine3.6
 ---> 37daba746bbe
Step 2/6 : COPY . /app
 ---> ae4f46082c94
Removing intermediate container 41150f25257b
Step 3/6 : WORKDIR /app
 ---> ad3316c2fb64
Removing intermediate container fddeda4a6071
Step 4/6 : RUN pip install -r requirements.txt
 ---> Running in c18e4b006786

[91m[0mCollecting flask (from -r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl (91kB)
Collecting click>=5.1 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting Jinja2>=2.10 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7f/ff/ae64bacdfc95f27a016a7bed8e8686763ba4d277a78ca76f32659220a731/Jinja2-2.10-py2.py3-none-any.whl (126kB)
Collecting itsdangerous>=0.24 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Werkzeug>=0.14 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/24/4d/2fc4e872fbaaf44cc3fd5a9cd42fda7e57c031f08e28c9f35689e8b43198/Werkzeug-0.15.1-py2.py3-none-any.whl (328kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Building wheels for collected packages: MarkupSafe
  Running setup.py bdist_wheel for MarkupSafe: started
  Running setup.py bdist_wheel for MarkupSafe: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/f2/aa/04/0edf07a1b8a5f5f1aed7580fffb69ce8972edc16a505916a77
Successfully built MarkupSafe
Installing collected packages: click, MarkupSafe, Jinja2, itsdangerous, Werkzeug, flask
Successfully installed Jinja2-2.10 MarkupSafe-1.1.1 Werkzeug-0.15.1 click-7.0 flask-1.0.2 itsdangerous-1.1.0
[91mYou are using pip version 10.0.1, however version 19.0.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
[0m ---> abb0ac62a028
Removing intermediate container c18e4b006786
Step 5/6 : EXPOSE 5000
 ---> Running in 30eb0fad3d16
 ---> a15250bfe7c7
Removing intermediate container 30eb0fad3d16
Step 6/6 : CMD python3 ./start.py
 ---> Running in c4fd08c68a68
 ---> f204a6c83ee3
Removing intermediate container c4fd08c68a68
Successfully built f204a6c83ee3
[Pipeline] dockerFingerprintFrom
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy Image)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u hutemai -p ******** https://index.docker.io/v1/
Login Succeeded
[Pipeline] {
[Pipeline] sh
+ docker tag hutemai/jenkins_test:5 hutemai/jenkins_test:5
[Pipeline] sh
+ docker push hutemai/jenkins_test:5
The push refers to a repository [docker.io/hutemai/jenkins_test]
099dbda2eac4: Preparing
2a2b44445ecf: Preparing
a7c43324881c: Preparing
14d7c702acff: Preparing
e5a9b27d4e38: Preparing
8492333e0825: Preparing
9dfa40a0da3b: Preparing
8492333e0825: Waiting
9dfa40a0da3b: Waiting
a7c43324881c: Layer already exists
e5a9b27d4e38: Layer already exists
14d7c702acff: Layer already exists
8492333e0825: Layer already exists
9dfa40a0da3b: Layer already exists
2a2b44445ecf: Pushed
099dbda2eac4: Pushed
5: digest: sha256:6a5e4a1ba51381bb7a7bd9c770e309d5fbfc9d7dbca218b7efbc1d22e0f55beb size: 1788
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Remove Unused docker image)
[Pipeline] sh
+ docker rmi hutemai/jenkins_test:5
Untagged: hutemai/jenkins_test:5
Untagged: hutemai/jenkins_test@sha256:6a5e4a1ba51381bb7a7bd9c770e309d5fbfc9d7dbca218b7efbc1d22e0f55beb
Deleted: sha256:f204a6c83ee3e64defd23bed3f5bf305ada358933eff6acb209d1092c60173ec
Deleted: sha256:a15250bfe7c79339aeacf3629f5fb2e7b73e4cd2a2ff9b93f40ccc03a358ba2a
Deleted: sha256:abb0ac62a028af541f309b1a5f542124d1918fda7883d48ed50e805e1fb606c6
Deleted: sha256:546e75cd07b2ecd52ddd36d315ca99c2a6b901f7d8f54b1b1f44c9e8fd02041c
Deleted: sha256:ad3316c2fb645aeff537f8166801c86dcc934042e715a64e9524d70739312ad5
Deleted: sha256:ae4f46082c94854c9f7f6233b31cfc1b4ae0c571ff131b63134287e5dba4ce22
Deleted: sha256:188e2900378df925956b7d09eeb1f05a2b97e87937a762e3dec04910f82a6be5
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
