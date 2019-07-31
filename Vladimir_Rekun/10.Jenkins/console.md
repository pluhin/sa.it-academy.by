#Console Output

```bash
Started by user dev dev
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/52.Jenkinsfile
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] deleteDir
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:wladimirre/sa.it-academy.by.git
 > git init /var/lib/jenkins/workspace/52.Jenkinsfile # timeout=10
Fetching upstream changes from git@github.com:wladimirre/sa.it-academy.by.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:wladimirre/sa.it-academy.by.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:wladimirre/sa.it-academy.by.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:wladimirre/sa.it-academy.by.git # timeout=10
Fetching upstream changes from git@github.com:wladimirre/sa.it-academy.by.git
 > git fetch --tags --progress git@github.com:wladimirre/sa.it-academy.by.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 16428743a6517508c49f210ee4f221204ae5d00a (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 16428743a6517508c49f210ee4f221204ae5d00a
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 16428743a6517508c49f210ee4f221204ae5d00a
Commit message: "Set theme jekyll-theme-slate"
 > git rev-list --no-walk 16428743a6517508c49f210ee4f221204ae5d00a # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (date)
[Pipeline] sh
+ touch file.txt
+ date
[Pipeline] sh
+ git add --all
[Pipeline] sh
+ git commit -m add date
[master 4c14c64] add date
 1 file changed, 1 insertion(+)
 create mode 100644 file.txt
[Pipeline] sh
+ git push origin master
To github.com:wladimirre/sa.it-academy.by.git
   1642874..4c14c64  master -> master
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Create branch)
[Pipeline] sh
+ git checkout -b new_branch
Switched to a new branch 'new_branch'
[Pipeline] sh
+ git branch
  master
* new_branch
[Pipeline] sh
+ git push origin new_branch
remote: 
remote: Create a pull request for 'new_branch' on GitHub by visiting:        
remote:      https://github.com/wladimirre/sa.it-academy.by/pull/new/new_branch        
remote: 
To github.com:wladimirre/sa.it-academy.by.git
 * [new branch]      new_branch -> new_branch
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Delete branch)
[Pipeline] sh
+ git checkout master
Switched to branch 'master'
+ git branch -D new_branch
Deleted branch new_branch (was 4c14c64).
[Pipeline] sh
+ git push origin --delete new_branch
To github.com:wladimirre/sa.it-academy.by.git
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
  origin/jenkins
  origin/m-sa2-06-19
  origin/m-sa2-07-19
  origin/m-sa2-08-19
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
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: sa-itacademy-by, channel: , color: #00FF00, botUser: false, tokenCredentialId: slack_new, iconEmoji <empty>, username <empty>
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
