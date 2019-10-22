##12. Jenkins. As code

Jenkins output

 
```
Started by user S_Beliakou
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/121
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] deleteDir
[Pipeline] git
using credential git_pass
Cloning the remote Git repository
Cloning repository git@github.com:spooky1010/project.git
 > git init /var/lib/jenkins/workspace/121 # timeout=10
Fetching upstream changes from git@github.com:spooky1010/project.git
 > git --version # timeout=10
using GIT_ASKPASS to set credentials 
 > git fetch --tags --progress git@github.com:spooky1010/project.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git@github.com:spooky1010/project.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git@github.com:spooky1010/project.git # timeout=10
Fetching upstream changes from git@github.com:spooky1010/project.git
using GIT_ASKPASS to set credentials 
 > git fetch --tags --progress git@github.com:spooky1010/project.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision de9f38adc7ccfdb997ffe352b311d6481b58d640 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f de9f38adc7ccfdb997ffe352b311d6481b58d640
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master de9f38adc7ccfdb997ffe352b311d6481b58d640
Commit message: "222"
 > git rev-list --no-walk de9f38adc7ccfdb997ffe352b311d6481b58d640 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Add)
[Pipeline] sh
+ pwd
/var/lib/jenkins/workspace/121
+ git branch
* master
+ git checkout -b branch_jenkins
Switched to a new branch 'branch_jenkins'
+ git branch
* branch_jenkins
  master
+ git push origin branch_jenkins
remote: 
remote: Create a pull request for 'branch_jenkins' on GitHub by visiting:        
remote:      https://github.com/spooky1010/project/pull/new/branch_jenkins        
remote: 
To git@github.com:spooky1010/project.git
 * [new branch]      branch_jenkins -> branch_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (2)
[Pipeline] sh
+ echo 'st 2'
st 2
+ touch index11.txt
+ ls -l
total 24
-rw-r--r--. 1 root root  87 Oct 21 07:07 features.txt
-rw-r--r--. 1 root root  29 Oct 21 07:07 file1.txt
-rw-r--r--. 1 root root  21 Oct 21 07:07 file2.txt
-rw-r--r--. 1 root root  52 Oct 21 07:07 file_dev.txt
-rw-r--r--. 1 root root 124 Oct 21 07:07 hotfix.txt
-rw-r--r--. 1 root root   0 Oct 21 07:07 index11.txt
-rwxr-xr-x. 1 root root 171 Oct 21 07:07 push_all.sh
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (add commit 3)
[Pipeline] sh
+ echo 'st 3'
st 3
+ git add --all
+ git commit -m 'add index file'
[branch_jenkins e18f139] add index file
 Committer: root <root@localhost.localdomain>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 index11.txt
+ git push -f origin branch_jenkins
To git@github.com:spooky1010/project.git
   de9f38a..e18f139  branch_jenkins -> branch_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (delete branch 4)
[Pipeline] sh
+ echo 'delete branch 4'
delete branch 4
+ git checkout master
Switched to branch 'master'
+ git branch -D branch_jenkins
Deleted branch branch_jenkins (was e18f139).
+ git push origin --delete branch_jenkins
To git@github.com:spooky1010/project.git
 - [deleted]         branch_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (test)
[Pipeline] sh
+ echo 'st 5 test'
st 5 test
+ git branch -r
  origin/dev
  origin/features/do_one
  origin/hotfix/we_gonna_die
  origin/master
  origin/new_branch_jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```
