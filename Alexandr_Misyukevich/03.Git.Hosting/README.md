# Homework 03.Git.Hosting
## Homework Assignment 1: Initializing a Remote Repository
### History shell
```shell
mkdir 03.Git.Hosting
cd 03.Git.Hosting/
git init
git remote add origin-github git@github.com:Misyukevich/03.Git.Hosting.git
git remote 
git remote -v
git remote add origin-gitlab git@gitlab.com:sa-itacademy-30-24/03.git.hosting.git
git remote -v
cd
nano Push.sh
alias
nano .bashrc 
source .bashrc
alias
cd 03.Git.Hosting/
touch README.md
date >> README.md
git add README.md 
git commit -m "Add README"
chmod +x /home/misyukevich/Push.sh
pushall
git log
history
```
### Script
```bash 
#!/bin/bash

PUSHALL=$(git remote)
CURRENTBRANCH=$(git branch --show-current)

for push in $PUSHALL; do
        git push $push $CURRENTBRANCH
done

```
