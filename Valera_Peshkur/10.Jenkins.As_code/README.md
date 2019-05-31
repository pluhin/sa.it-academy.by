### 10.Jenkins.As_code

[notification](./slack_notification.png)

```bash
Started by user jenkins
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Jenkins.Code/30.Jenkinsfile
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] deleteDir
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:vpeshkur/drill_rep.git
 > git init /var/lib/jenkins/workspace/Jenkins.Code/30.Jenkinsfile # timeout=10
Fetching upstream changes from git@github.com:vpeshkur/drill_rep.git
 > git --version # timeout=10
 > git fetch --tags --force --progress git@github.com:vpeshkur/drill_rep.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:vpeshkur/drill_rep.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:vpeshkur/drill_rep.git # timeout=10
Fetching upstream changes from git@github.com:vpeshkur/drill_rep.git
 > git fetch --tags --force --progress git@github.com:vpeshkur/drill_rep.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision cd5c1ddcf23a111a0c369d8adaa67eeca94d54c2 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f cd5c1ddcf23a111a0c369d8adaa67eeca94d54c2
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master cd5c1ddcf23a111a0c369d8adaa67eeca94d54c2
Commit message: "add slack.png"
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Create branch)
[Pipeline] sh
+ git checkout -b new_branch
Переключено на новую ветку «new_branch»
[Pipeline] sh
+ git branch
  master
* new_branch
[Pipeline] sh
+ git push origin new_branch
remote: 
remote: Create a pull request for 'new_branch' on GitHub by visiting:        
remote:      https://github.com/vpeshkur/drill_rep/pull/new/new_branch        
remote: 
To github.com:vpeshkur/drill_rep.git
 * [new branch]      new_branch -> new_branch
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Delete branch)
[Pipeline] sh
+ git checkout master
Переключено на ветку «master»
+ git branch -D new_branch
Ветка new_branch удалена (была cd5c1dd).
[Pipeline] sh
+ git push origin --delete new_branch
To github.com:vpeshkur/drill_rep.git
 - [deleted]         new_branch
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] sh
+ echo Remote branches are:
Remote branches are:
[Pipeline] sh
+ git branch -r
  origin/master
[Pipeline] sh
+ echo Local branches are:
Local branches are:
[Pipeline] sh
+ git branch
* master
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://sa-itacademy-by.slack.com/services/hooks/jenkins-ci/, teamDomain: <empty>, channel: , color: #00FF00, botUser: false, tokenCredentialId: slackToken
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
