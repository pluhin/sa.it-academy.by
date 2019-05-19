# Hometask 10. 
###Jenkins. As code

#### What was done:

- Work with repo + (Repo wos dowloaded to Workdir)
- Work with files + (Added some data to data\somedata.txt)
- Publish artifacts + (Published arhived changes to ARCS branch with date-time-stamp in filename)
- Tests + (Re-download ARCS branch and list files)
- Notification + (Slack)

#### Here is Jenkins pipeline log:

``` bash

Started by user Dmitry Alekseichik
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/mygit/2.Pipeline.hometask
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository master)
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:DAlekseichik/Mygit.git
 > git init /var/lib/jenkins/workspace/mygit/2.Pipeline.hometask # timeout=10
Fetching upstream changes from git@github.com:DAlekseichik/Mygit.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:DAlekseichik/Mygit.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:DAlekseichik/Mygit.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:DAlekseichik/Mygit.git # timeout=10
Fetching upstream changes from git@github.com:DAlekseichik/Mygit.git
 > git fetch --tags --progress git@github.com:DAlekseichik/Mygit.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 30ea85469f970f95d96bf56c5ebfaae441cf5a40 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 30ea85469f970f95d96bf56c5ebfaae441cf5a40
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 30ea85469f970f95d96bf56c5ebfaae441cf5a40
Commit message: "Add ARCS dir"
 > git rev-list --no-walk 30ea85469f970f95d96bf56c5ebfaae441cf5a40 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking downloaded repository)
[Pipeline] sh
+ ls -l
total 8
drwxr-xr-x 2 jenkins jenkins 4096 May 18 19:29 arcs
drwxr-xr-x 2 jenkins jenkins 4096 May 18 19:29 data
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Adding some new data with timestamp)
[Pipeline] sh
+ date +%d.%m.%Y_%H-%M-%S
+ daystamp=18.05.2019_19-29-08
+ echo SAVING daystamp VAR to file and renew it
SAVING daystamp VAR to file and renew it
+ echo 18.05.2019_19-29-08
+ cat /tmp/daystamp
+ daystamp=18.05.2019_19-29-08
+ echo WRITING SOME NEW DATA to somedata.txt
WRITING SOME NEW DATA to somedata.txt
+ echo TODAY is: 18.05.2019_19-29-08
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Packing Data to Arcs dir)
[Pipeline] sh
+ cat /tmp/daystamp
+ daystamp=18.05.2019_19-29-08
+ echo 18.05.2019_19-29-08
18.05.2019_19-29-08
+ echo IT IS A GOOD DAY TO DIE!
IT IS A GOOD DAY TO DIE!
+ tar -zcvf ./arcs/18.05.2019_19-29-08.tar.gz ./data
./data/
./data/somedata.txt
[Pipeline] sh
+ cat /tmp/daystamp
+ daystamp=18.05.2019_19-29-08
+ echo 18.05.2019_19-29-08
18.05.2019_19-29-08
+ echo IT IS A GOOD DAY TO DIE!
IT IS A GOOD DAY TO DIE!
+ cp ./arcs/18.05.2019_19-29-08.tar.gz /tmp
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Create Arcs Branch)
[Pipeline] sh
+ git checkout -b My_Arcs
Switched to a new branch 'My_Arcs'
M	data/somedata.txt
[Pipeline] sh
+ git branch
* My_Arcs
  master
[Pipeline] sh
+ git checkout My_Arcs
Already on 'My_Arcs'
M	data/somedata.txt
[Pipeline] sh
+ echo My_Arcs
My_Arcs
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push Arcs Branch to GITHUB)
[Pipeline] sh
+ git checkout My_Arcs
Already on 'My_Arcs'
M	data/somedata.txt
[Pipeline] sh
+ git add --all
[Pipeline] sh
+ git commit -m My_Arcs
[My_Arcs fdd06c5] My_Arcs
 Committer: Jenkins <jenkins@git.local>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 arcs/18.05.2019_19-29-08.tar.gz
[Pipeline] sh
+ git push origin My_Arcs
remote: 
remote: Create a pull request for 'My_Arcs' on GitHub by visiting:        
remote:      https://github.com/DAlekseichik/Mygit/pull/new/My_Arcs        
remote: 
To github.com:DAlekseichik/Mygit.git
 * [new branch]      My_Arcs -> My_Arcs
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clear All Master)
[Pipeline] sh
+ ls -l ./arcs
total 8
-rw-r--r-- 1 jenkins jenkins 196 May 18 19:29 18.05.2019_19-29-08.tar.gz
-rw-r--r-- 1 jenkins jenkins  18 May 18 19:29 readme.md
[Pipeline] deleteDir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clone repository branch My_Arcs)
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:DAlekseichik/Mygit.git
 > git init /var/lib/jenkins/workspace/mygit/2.Pipeline.hometask # timeout=10
Fetching upstream changes from git@github.com:DAlekseichik/Mygit.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:DAlekseichik/Mygit.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:DAlekseichik/Mygit.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:DAlekseichik/Mygit.git # timeout=10
Fetching upstream changes from git@github.com:DAlekseichik/Mygit.git
 > git fetch --tags --progress git@github.com:DAlekseichik/Mygit.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/My_Arcs^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/My_Arcs^{commit} # timeout=10
Checking out Revision fdd06c59fe13771b0990a099fe67f7d8acf35e8b (refs/remotes/origin/My_Arcs)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f fdd06c59fe13771b0990a099fe67f7d8acf35e8b
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b My_Arcs fdd06c59fe13771b0990a099fe67f7d8acf35e8b
Commit message: "My_Arcs"
First time build. Skipping changelog.
[Pipeline] sh
+ ls -l ./arcs
total 8
-rw-r--r-- 1 jenkins jenkins 196 May 18 19:29 18.05.2019_19-29-08.tar.gz
-rw-r--r-- 1 jenkins jenkins  18 May 18 19:29 readme.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Check GZ file in My_Arcs)
[Pipeline] sh
+ ls -l ./arcs
total 8
-rw-r--r-- 1 jenkins jenkins 196 May 18 19:29 18.05.2019_19-29-08.tar.gz
-rw-r--r-- 1 jenkins jenkins  18 May 18 19:29 readme.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Delete Arcs branch)
[Pipeline] sh
+ git checkout master
Switched to a new branch 'master'
Branch 'master' set up to track remote branch 'master' from 'origin'.
+ git branch -D My_Arcs
Deleted branch My_Arcs (was fdd06c5).
[Pipeline] sh
+ git push origin --delete My_Arcs
To github.com:DAlekseichik/Mygit.git
 - [deleted]         My_Arcs
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clear All Final)
[Pipeline] sh
+ ls -l ./arcs
total 4
-rw-r--r-- 1 jenkins jenkins 18 May 18 19:29 readme.md
[Pipeline] deleteDir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://sa-itacademy-by.slack.com/services/hooks/jenkins-ci/, teamDomain: https://sa-itacademy-by.slack.com, channel: , color: #00FF00, botUser: false, tokenCredentialId: ae699a45-4878-42c6-af2c-99d7fdd836d5
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```