# 20. Jenkins. As code

## Jenkinsfile, text report and screenshot of stages

Attached

## Git repository of this task

https://github.com/BB8312/jac

## Console Output

```bash
Started by user Admin


Obtained Jenkinsfile from git https://github.com/BB8312/jac
[Pipeline] Start of Pipeline
[Pipeline] node
Running on nodeloc

 in /home/jenkins/workspace/PipGit
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential some_randome
Cloning the remote Git repository
Cloning repository https://github.com/BB8312/jac
 > git init /home/jenkins/workspace/PipGit # timeout=10
Fetching upstream changes from https://github.com/BB8312/jac
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
using GIT_ASKPASS to set credentials 
 > git fetch --tags --force --progress -- https://github.com/BB8312/jac +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision a4b2e735b6f298754dfbb642b2a6343b73fbdd42 (refs/remotes/origin/main)
 > git config remote.origin.url https://github.com/BB8312/jac # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f a4b2e735b6f298754dfbb642b2a6343b73fbdd42 # timeout=10
Commit message: "Merge branch 'main' of github.com:BB8312/jac Edit repo"
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (NMAPpining)
[Pipeline] sh
+ nmap -p22 -sV 192.168.153.127-190
+ echo 


[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Speedtesting)
[Pipeline] sh
+ speedtest
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Gitcloning)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ [ -d jac ]
+ git clone https://bb8312:****@github.com/bb8312/jac.git
Êëîíèðîâàíèå â «jac»…
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Gitpushing)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ date +%T; %D
+ STAMP=15:51:02; 06/24/22
+ cp report.txt jac/report.txt
+ cd jac
+ git config user.email jenkins@jen.jen
+ git config user.name Jenkins Slave
+ git add --all
+ git commit -m 15:51:02; 06/24/22
[main 10c42df] 15:51:02; 06/24/22
 1 file changed, 10 insertions(+), 10 deletions(-)
+ git push https://bb8312:****@github.com/bb8312/jac.git
remote: This repository moved. Please use the new location:        
remote:   https://github.com/BB8312/jac.git        
To https://github.com/bb8312/jac.git
   a4b2e73..10c42df  main -> main
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
