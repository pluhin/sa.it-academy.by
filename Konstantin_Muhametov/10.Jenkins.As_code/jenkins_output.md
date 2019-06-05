```Started by user user
Obtained Jenkinsfile from git git@github.com:moongs1/jenkins.git
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Task_010/01
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
using credential f7680d4c-093e-43d1-a2f1-fa5df93a33be
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:moongs1/jenkins.git # timeout=10
Fetching upstream changes from git@github.com:moongs1/jenkins.git
 > git --version # timeout=10
using GIT_SSH to set credentials 
 > git fetch --tags --progress git@github.com:moongs1/jenkins.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/Jenkinsfiles^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/Jenkinsfiles^{commit} # timeout=10
Checking out Revision 84492e34ee44c5e2886d6b291a56bf4d9c6e5d7d (refs/remotes/origin/Jenkinsfiles)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 84492e34ee44c5e2886d6b291a56bf4d9c6e5d7d
Commit message: "Update Jenkinsfile"
 > git rev-list --no-walk 2043e085062cd163aaf7b283dbbe9f61fd8cc690 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:moongs1/sa.it.git # timeout=10
Fetching upstream changes from git@github.com:moongs1/sa.it.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:moongs1/sa.it.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/jenkins^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/jenkins^{commit} # timeout=10
Checking out Revision 16cb4c5451b23cfaa2500c512d99f2832ec174fc (refs/remotes/origin/jenkins)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 16cb4c5451b23cfaa2500c512d99f2832ec174fc
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D jenkins # timeout=10
 > git checkout -b jenkins 16cb4c5451b23cfaa2500c512d99f2832ec174fc
Commit message: "delete date"
 > git rev-list --no-walk f49c8672d5752c7e3cb97f040bf5d9de18cfb06f # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking  repository) (Checking  repository)
[Pipeline] sh
+ ls -l
total 20
-rw-r--r--. 1 jenkins jenkins 1667 Jun  5 04:17 02.GIT.Local.md
-rw-r--r--. 1 jenkins jenkins    0 Jun  5 04:17 email_notification_check.txt
-rw-r--r--. 1 jenkins jenkins   32 Jun  5 04:17 first_file.txt
-rw-r--r--. 1 jenkins jenkins    8 Jun  5 04:17 fourth_file.txt
-rw-r--r--. 1 jenkins jenkins   38 Jun  5 04:17 second_file.txt
-rw-r--r--. 1 jenkins jenkins    0 Jun  5 04:17 slack_testing_3_06_PM.txt
-rw-r--r--. 1 jenkins jenkins    0 Jun  5 04:17 slack_test_new.txt
-rw-r--r--. 1 jenkins jenkins    0 Jun  5 04:17 test_slack1.txt
-rw-r--r--. 1 jenkins jenkins    0 Jun  5 04:17 test_slack.txt
-rw-r--r--. 1 jenkins jenkins   28 Jun  5 04:17 third_file.txt
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Date)
[Pipeline] sh
+ echo date
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Git push Date)
[Pipeline] sh
+ git add --all
[Pipeline] sh
+ git commit -m 'System date'
[jenkins 7fc3d2d] System date
 Committer: Jenkins Automation Server <jenkins@localhost.localdomain>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
 create mode 100644 date.txt
[Pipeline] sh
+ git push origin jenkins
To git@github.com:moongs1/sa.it.git
   16cb4c5..7fc3d2d  jenkins -> jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (delete Date)
[Pipeline] sh
+ git rm date.txt
rm 'date.txt'
[Pipeline] sh
+ git commit -m 'delete date'
[jenkins 98b1408] delete date
 Committer: Jenkins Automation Server <jenkins@localhost.localdomain>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 deletion(-)
 delete mode 100644 date.txt
[Pipeline] sh
+ git push origin jenkins
To git@github.com:moongs1/sa.it.git
   7fc3d2d..98b1408  jenkins -> jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://justme-up65103.slack.com/services/hooks/jenkins-ci/, teamDomain: <empty>, channel: test, color: #00FF00, botUser: false, tokenCredentialId: slack
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```