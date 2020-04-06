# Pipeline Jenkinsfile

---

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
                sh """
                tar -zcvf /tmp/package.tar.gz  ./
                date
                """
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
---

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
                    sh """
                        git checkout -b $NEW_BRANCH
                        git branch
                        git push origin $NEW_BRANCH
                    """
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
                    sh """
                    echo "Remote branches are:"
                    git branch -r
                    echo "Local branches are:"
                    git branch
                    """
            }
        }
    }
    post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
}
```

[env-vars.html](https://jenkins.url/env-vars.html/)

---

```groovy
pipeline {
    agent { label 'master' }
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
                    git branch: "${params.repository_branch}", url: "${params.repository_url}"
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
                expression {params.do_clean}
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

---

```groovy

def tagsPreTestList = "info"
def tagVersionAirflow = "r4.22"
def ansibleVaultCredId = 'ansible_vault'
def skippedTagsDeployment = "repos"

pipeline {
    agent {
        label 'master'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    parameters {
        booleanParam(name: 'doPreTest', defaultValue: true, description: 'Include tests')
        booleanParam(name: 'doCopyRepos', defaultValue: true, description: 'Copy articfacts (core/dag/mag/rpms)')
        booleanParam(name: 'doStopWorkers', defaultValue: true, description: 'Stop worker daemon')
        booleanParam(name: 'doDeployment', defaultValue: true, description: 'Deployment')
        choice(name: 'inventoryFile', choices: ['airflow', 'inventory/airflow-pre-prod.yml', 'inventory/airflow-prod.yml', 'inventory/airflow-test-env.yml'], description: 'Inventory file')
        string(name: 'limit', defaultValue: '', description: 'FORMAT:\nall:!CL:!PR')
        string(name: 'ldapUser', defaultValue: '', description: 'LDAP user')
        password(name: 'ldapPass', defaultValue: '', description: 'LDAP password')
        //string(name: 'tagsDeployment', defaultValue: '', description: 'Tags for deployment play')
        //string(name: 'expraParams', defaultValue: '', description: 'String passed to the Ansible Command Line invocation as-is')
    }
    stages {
        stage('Pre-tests') {
            when { expression { params.doPreTest } }
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/${params.inventoryFile}",
                    playbook:           "${WORKSPACE}/test.yml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    tags:               "${tagsPreTestList}",
                    limit:              "${params.limit}",
                    colorized:          true,
                    extraVars: [
                        ldap_user_from_jenkins:       "${params.ldapUser}",
                        ldap_password_from_jenkins:   "${params.ldapUass}"
                    ]
                )
            }
        }
        stage('Copy artifacts') {
            when { expression { params.doCopyRepos } }
            steps {
                ansiblePlaybook(
                    installation:       "${params.ansible}",
                    inventory:          "${WORKSPACE}/${params.inventoryFile}",
                    playbook:           "${WORKSPACE}/repos.yml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    limit:              "${params.limit}",
                    colorized:          true,
                    extraVars: [
                        ldap_user_from_jenkins:       "${params.ldapUser}",
                        ldap_password_from_jenkins:   "${params.ldapUass}",
                        mag_branch:                   "${tagVersionAirflow}",
                        core_branch:                  "${tagVersionAirflow}",
                        dags_branch:                  "${tagVersionAirflow}",
                        hide_logs:                    'false'
                    ]
                )
            }
        }
        stage('Stop workers') {
            when { expression { params.doStopWorkers } }
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/${params.inventoryFile}",
                    playbook:           "${WORKSPACE}/control.yml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    limit:              "${params.limit}",
                    tags:               "airflow::stop",
                    colorized:          true,
                    extraVars: [
                        ldap_user_from_jenkins:       "${params.ldapUser}",
                        ldap_password_from_jenkins:   "${params.ldapUass}",
                    ]
                )
            }
        }
        stage('Deployment') {
            when { expression { params.doDeployment } }
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/${params.inventoryFile}",
                    playbook:           "${WORKSPACE}/worker.yml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    limit:              "${params.limit}",
                    //tags:               "${params.tagsDeployment}",
                    skippedTags:        "${skippedTagsDeployment}",
                    colorized:          true,
                    extraVars: [
                        ldap_user_from_jenkins:       "${params.ldapUser}",
                        ldap_password_from_jenkins:   "${params.ldapUass}",
                        mag_branch:                   "${tagVersionAirflow}",
                        core_branch:                  "${tagVersionAirflow}",
                        dags_branch:                  "${tagVersionAirflow}"
                    ]
                )
            }
        }
    }
}

```


```groovy
stage('Deployment') {
    steps {
        withCredentials([string(credentialsId: "ansible_vault", variable: 'vault_pass')]){
            sh """
                sed -i -E 's!ansible_host=[0-9]*[0-9].[0-9]*[0-9].[0-9]*[0-9].[0-9]*[0-9]!!g' inventories/${params.inventory_file}
                echo "${params.ansible_path} ${params.limit} -i inventories/${params.inventory_file} -e \"${params.extra_vars} obo_deploy=${params.obo_deploy} ldap_user_from_jenkins=LDAP_USER ldap_password_from_jenkins=LDAP_PASS mag_branch=${params.mag_branch} core_branch=${params.app_branch} dags_branch=${params.app_branch}\" ${params.extra_params} --ask-vault-pass ${params.tags} ${params.playbook}"
                echo "$vault_pass" | ${params.ansible_path} \
                                        ${params.limit} \
                                        ${params.playbook} \
                                        ${params.extra_params} \
                                    -i inventories/${params.inventory_file} \
                                    -e "ldap_user_from_jenkins=${params.ldap_user} \
                                        ldap_password_from_jenkins=${params.ldap_pass} \
                                        obo_deploy=True \
                                        mag_branch=${params.app_branch} \
                                        core_branch=${params.app_branch} \
                                        config_branch=master \
                                        dags_branch=${params.app_branch} \
                                        ${params.extra_vars}" \
                                        --ask-vault-pass \
                                        ${params.tags}
            """
            }
    }
}
```

---

```groovy
        stage('Checking') {
            steps {
                script {
                    if (params.inventory == null) {
                        error("Build failed because didn't choose inventory file")
                    }
                    if (params.SSH_USER == null) {
                        error("Build failed because missing ssh user name")
                    }
                    if (params.SSH_PASS == null) {
                        error("Build failed because missing ssh password")
                    }
                }
            }
        }
```

```yaml
---
- name: Grab CRITICAL services
  uri:
    url: "{{ api_url }}/objects/services"
    validate_certs: false
    method: GET
    return_content: true
    user: "{{ api_user }}"
    password: "{{ api_pass }}"
    body_format: json
    body: "
    { \"joins\": [ \"host.name\", \"host.address\" ],
      \"attrs\": [ \"name\", \"display_name\", \"state\", \"last_check_result\" ],
      \"filter\": \"service.state == 2\",
      \"pretty\": true
    }"
    force_basic_auth: true
  register: out
- name: CRITICAL services
  debug:
    msg: |
      Critical on:     {{ problem.joins.host.name }} (mgmt: {{ problem.joins.host.address }} )
      Problem service: {{ problem.attrs.display_name }}
      Output is:       {{ problem.attrs.last_check_result.output }}
  loop: "{{ out.json.results }}"
  loop_control:
    loop_var: problem
    label: "{{ problem.joins.host.name }}"

```

---

```bash
export API_AUTH_HEADER='admin:**********'
curl -X POST -u ${API_AUTH_HEADER} "https://pluhin.ddns.net/job/SA/job/SA_06/job/10.print.env/build"
curl -X GET -u ${API_AUTH_HEADER} https://pluhin.ddns.net/job/SA/job/SA_06/job/10.print.env/config.xml -o local.xml
curl -X POST -u ${API_AUTH_HEADER} "https://pluhin.ddns.net/job/SA/job/SA_06/createItem?name=11.print.env" --data-binary @local.xml -H "Content-Type:text/xml"
```
