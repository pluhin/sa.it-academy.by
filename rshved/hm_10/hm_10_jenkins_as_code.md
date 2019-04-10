# Jenkins as code.
#### Pipeline view:
##### - Job 11 was completed with removal of the branch
##### - Job 12 was completed without removal of the branch 
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_10/jenkins_as_code_pics/jen_1.png?raw=true)
#### Slack notification:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_10/jenkins_as_code_pics/jen_2.png?raw=true)
### OUTPUT:
```bash
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Jenkins_as_codee
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] deleteDir
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:hutemai/test.git
 > git init /var/lib/jenkins/workspace/Jenkins_as_codee # timeout=10
Fetching upstream changes from git@github.com:hutemai/test.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:hutemai/test.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:hutemai/test.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:hutemai/test.git # timeout=10
Fetching upstream changes from git@github.com:hutemai/test.git
 > git fetch --tags --progress git@github.com:hutemai/test.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/hotfix/we_gonna_die^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/hotfix/we_gonna_die^{commit} # timeout=10
Checking out Revision fb3ab0c2ba4aff72678240c921fb74a9d20c4e5f (refs/remotes/origin/hotfix/we_gonna_die)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f fb3ab0c2ba4aff72678240c921fb74a9d20c4e5f
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b hotfix/we_gonna_die fb3ab0c2ba4aff72678240c921fb74a9d20c4e5f
Commit message: "first commit in hotfix"
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 12
-rw-r--r-- 1 jenkins jenkins 28 Mar 18 09:01 file1.py
-rw-r--r-- 1 jenkins jenkins 26 Mar 18 09:01 file2.py
-rw-r--r-- 1 jenkins jenkins 25 Mar 18 09:01 file4.py
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Create Branch)
[Pipeline] sh
+ git checkout -b from_jenkins
Switched to a new branch 'from_jenkins'
[Pipeline] sh
+ git branch
* from_jenkins
  hotfix/we_gonna_die
[Pipeline] sh
+ git checkout from_jenkins
Already on 'from_jenkins'
[Pipeline] sh
+ ls -l
total 12
-rw-r--r-- 1 jenkins jenkins 28 Mar 18 09:01 file1.py
-rw-r--r-- 1 jenkins jenkins 26 Mar 18 09:01 file2.py
-rw-r--r-- 1 jenkins jenkins 25 Mar 18 09:01 file4.py
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Packing project)
[Pipeline] sh
+ tar -zcvf /tmp/11.tar.gz ./
./
./.git/
./.git/refs/
./.git/refs/heads/
./.git/refs/heads/hotfix/
./.git/refs/heads/hotfix/we_gonna_die
./.git/refs/heads/from_jenkins
./.git/refs/tags/
./.git/refs/remotes/
./.git/refs/remotes/origin/
./.git/refs/remotes/origin/dev
./.git/refs/remotes/origin/features/
./.git/refs/remotes/origin/features/do_one
./.git/refs/remotes/origin/hotfix/
./.git/refs/remotes/origin/hotfix/we_gonna_die
./.git/refs/remotes/origin/master
./.git/branches/
./.git/description
./.git/hooks/
./.git/hooks/applypatch-msg.sample
./.git/hooks/commit-msg.sample
./.git/hooks/post-update.sample
./.git/hooks/pre-applypatch.sample
./.git/hooks/pre-commit.sample
./.git/hooks/pre-push.sample
./.git/hooks/pre-rebase.sample
./.git/hooks/prepare-commit-msg.sample
./.git/hooks/update.sample
./.git/info/
./.git/info/exclude
./.git/HEAD
./.git/config
./.git/objects/
./.git/objects/pack/
./.git/objects/info/
./.git/objects/af/
./.git/objects/af/b7401859f2c1bd14c05faa9a7bce22ae7ed98e
./.git/objects/01/
./.git/objects/01/02023f406be7b32613e16bcee403cc8b531b7f
./.git/objects/a8/
./.git/objects/a8/1464e94617092a4549f327f38a240b7dd7d256
./.git/objects/40/
./.git/objects/40/6b0fc4ac3a1161633b3274b5e8806a6dd7786b
./.git/objects/c1/
./.git/objects/c1/b273e445d69183f7c974f2c253b1a49694329d
./.git/objects/9b/
./.git/objects/9b/f3523afc2f08c07ab3f18d6c5df2a2847f6fc2
./.git/objects/11/
./.git/objects/11/8499060a197e8c1e7400df15ef04b8e633cd15
./.git/objects/dd/
./.git/objects/dd/3b7a93f405d5863b94e56e239785e64e98e467
./.git/objects/6d/
./.git/objects/6d/5d1b18aeeeefe6f86933e1ed35b1e9762b90a8
./.git/objects/fb/
./.git/objects/fb/3ab0c2ba4aff72678240c921fb74a9d20c4e5f
./.git/objects/ea/
./.git/objects/ea/f51fc35246e298275c712b13b681a2053cd9df
./.git/objects/d8/
./.git/objects/d8/9d57c75ded356d0c088ffe335e5cd71ab59db0
./.git/objects/de/
./.git/objects/de/b56a8104cfd5155576f3aaa2825d55110f1184
./.git/objects/de/43793733b7bf20eea3b9e25afae509d886634a
./.git/objects/43/
./.git/objects/43/e3fe7c5494540f71c17664f1c8b03302a88131
./.git/objects/14/
./.git/objects/14/894d4287da37a89732be8fc119442f5ce866e4
./.git/objects/ad/
./.git/objects/ad/5af928eb635aad8d1716552f643de3c9f90094
./.git/objects/90/
./.git/objects/90/9d3b6fcd7db6d4163242949c6d96e84370deb2
./.git/objects/e8/
./.git/objects/e8/7eab17a829fb0d47cecd672191bf4c814519b0
./.git/objects/13/
./.git/objects/13/0cad2274f144a61a06b0ef052b070ea6aeacce
./.git/objects/64/
./.git/objects/64/300e13cc2349f6fc885c04a7b7aac6f305d894
./.git/objects/c5/
./.git/objects/c5/4f5e3f81b63bed2aa90d4486fc08b5c294e0e4
./.git/objects/4b/
./.git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904
./.git/objects/32/
./.git/objects/32/0808c8056a2f4fd1b728684b49811fa67866ee
./.git/objects/16/
./.git/objects/16/eff9690e76275603fd70b1aff5d26df5cdde19
./.git/objects/4a/
./.git/objects/4a/e8c071b659ccaeaa3341ba2d95b1afc806caa8
./.git/objects/1e/
./.git/objects/1e/460a4b13534c0e67e21f700f502e270c2088fd
./.git/objects/b3/
./.git/objects/b3/7d863a961099ee0385e7a642473295012b678a
./.git/objects/f6/
./.git/objects/f6/07b800850623557bb0e08bfe9a51131f86d8d6
./.git/objects/96/
./.git/objects/96/c15555846ee4e4573f43e30a281d669690394a
./.git/objects/8f/
./.git/objects/8f/4f371c9c3412210643cfda4148153dc230b49c
./.git/objects/12/
./.git/objects/12/36e73463fa811220999702c8df84b5f230985a
./.git/objects/8b/
./.git/objects/8b/c6f028c2edd3f7eb4e263e801f98d2621d5b03
./.git/objects/c3/
./.git/objects/c3/7a1d301f2df2610311e2a438643a2ca512c019
./.git/objects/c7/
./.git/objects/c7/b443ad40543c660025033910e6ff783d81dc9e
./.git/FETCH_HEAD
./.git/logs/
./.git/logs/refs/
./.git/logs/refs/remotes/
./.git/logs/refs/remotes/origin/
./.git/logs/refs/remotes/origin/dev
./.git/logs/refs/remotes/origin/features/
./.git/logs/refs/remotes/origin/features/do_one
./.git/logs/refs/remotes/origin/hotfix/
./.git/logs/refs/remotes/origin/hotfix/we_gonna_die
./.git/logs/refs/remotes/origin/master
./.git/logs/refs/heads/
./.git/logs/refs/heads/hotfix/
./.git/logs/refs/heads/hotfix/we_gonna_die
./.git/logs/refs/heads/from_jenkins
./.git/logs/HEAD
./.git/index
./file1.py
./file2.py
./file4.py
[Pipeline] sh
+ cp /tmp/11.tar.gz ./
[Pipeline] sh
+ ls -l
total 28
-rw-r--r-- 1 jenkins jenkins 15156 Mar 18 09:01 11.tar.gz
-rw-r--r-- 1 jenkins jenkins    28 Mar 18 09:01 file1.py
-rw-r--r-- 1 jenkins jenkins    26 Mar 18 09:01 file2.py
-rw-r--r-- 1 jenkins jenkins    25 Mar 18 09:01 file4.py
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clean old one)
[Pipeline] sh
+ rm -f /tmp/11.tar.gz
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Packing test)
[Pipeline] sh
+ ls -l
total 28
-rw-r--r-- 1 jenkins jenkins 15156 Mar 18 09:01 11.tar.gz
-rw-r--r-- 1 jenkins jenkins    28 Mar 18 09:01 file1.py
-rw-r--r-- 1 jenkins jenkins    26 Mar 18 09:01 file2.py
-rw-r--r-- 1 jenkins jenkins    25 Mar 18 09:01 file4.py
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Git Push)
[Pipeline] sh
+ git add 11.tar.gz file1.py file2.py file4.py
+ git commit -a -m from_jenkins
[from_jenkins 78af134] from_jenkins
 Committer: Jenkins Automation Server <jenkins@10.0.2.15>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 11.tar.gz
+ git push origin from_jenkins --force
remote: 
remote: Create a pull request for 'from_jenkins' on GitHub by visiting:        
remote:      https://github.com/hutemai/test/pull/new/from_jenkins        
remote: 
To git@github.com:hutemai/test.git
 * [new branch]      from_jenkins -> from_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] deleteDir
[Pipeline] git
No credentials specified
Cloning the remote Git repository
Cloning repository git@github.com:hutemai/test.git
 > git init /var/lib/jenkins/workspace/Jenkins_as_codee # timeout=10
Fetching upstream changes from git@github.com:hutemai/test.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:hutemai/test.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:hutemai/test.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:hutemai/test.git # timeout=10
Fetching upstream changes from git@github.com:hutemai/test.git
 > git fetch --tags --progress git@github.com:hutemai/test.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision afb7401859f2c1bd14c05faa9a7bce22ae7ed98e (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f afb7401859f2c1bd14c05faa9a7bce22ae7ed98e
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master afb7401859f2c1bd14c05faa9a7bce22ae7ed98e
Commit message: "update file4"
 > git rev-list --no-walk afb7401859f2c1bd14c05faa9a7bce22ae7ed98e # timeout=10
[Pipeline] sh
+ git checkout from_jenkins
Switched to a new branch 'from_jenkins'
Branch from_jenkins set up to track remote branch from_jenkins from origin.
[Pipeline] sh
+ echo 'Remote and Local branches are:'
Remote and Local branches are:
[Pipeline] sh
+ git branch -a
* from_jenkins
  master
  remotes/origin/dev
  remotes/origin/features/do_one
  remotes/origin/from_jenkins
  remotes/origin/hotfix/we_gonna_die
  remotes/origin/master
[Pipeline] sh
+ echo 'Files in remote from_jenkins' branch:
Files in remote from_jenkins branch:
[Pipeline] sh
+ ls -l
total 28
-rw-r--r-- 1 jenkins jenkins 15156 Mar 18 09:01 11.tar.gz
-rw-r--r-- 1 jenkins jenkins    28 Mar 18 09:01 file1.py
-rw-r--r-- 1 jenkins jenkins    26 Mar 18 09:01 file2.py
-rw-r--r-- 1 jenkins jenkins    25 Mar 18 09:01 file4.py
[Pipeline] sh
+ [[ -f 11.tar.gz ]]
+ echo 'All is OK'
All is OK
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Delete branch)
[Pipeline] input
All is OK, delete test branch?
Yes. or Abort
Approved by admin
[Pipeline] sh
+ git checkout master
Switched to branch 'master'
+ git branch -D from_jenkins
Deleted branch from_jenkins (was 78af134).
[Pipeline] sh
+ git push origin --delete from_jenkins
To git@github.com:hutemai/test.git
 - [deleted]         from_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://sa-itacademy-by.slack.com/services/hooks/jenkins-ci/, teamDomain: <empty>, channel: , color: #00FF00, botUser: false, tokenCredentialId: 5c82a65c-80ee-4121-862f-3013713b566a
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
