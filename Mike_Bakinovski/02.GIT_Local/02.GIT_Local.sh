#!/bin/bash

#CLI should be seted on 02.GIT_Local folder

#cd 02.GIT_Local

git init

git config user.name "MikeBakinovski"
git config user.email mike.bakinovski@gmail.com

touch 02.Home_Task.txt
printf "Initialize local repository on your test host. Create the following branches:

    master (init branch)
        has 2 commits
    dev (has been created from master)
        has 2 commits from master + 2 additional
    features/do_one (has been created from dev branch)
        has 2 commits from master + 2 additional from dev + 1 additional
    hotfix/we_gonna_die (has been created from master branch)
        has 2 commits from master + 1 additional commit

    Play the following situations:

    Release phase - all commits should be inside master (except commits which is presented in branch hotfix)
    Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too
    In the end of this \"play\" you should provide list of your commits in above mentioned branches. You can add this output into the final part of your report.

    All your commands put into files 02.GIT.Local.md and add to your repository, then prepare PR (Pull Request)

    IMPORTANT!!! Use git markup for your report. See link

    Additional: Create README.md with project description in your folder. You will be maintain its during our course till the final demo
" > 02.Home_Task.txt

# First commit to 'master' with 02.Home_Task.txt file.

git add 02.Home_Task.txt
git commit -m "First commit to master with 02.Home_Task.txt file."

# Second commit to 'master' with masterlog.txt file.

git log > masterlog.txt
git add masterlog.txt
git commit -m "Second commit to master with masterlog.txt file."

# Create brach 'dev'

git checkout -b dev

# First commit to dev with devlog.txt file.

git log > devlog.txt
git add devlog.txt
git commit -m "First commit to dev with devlog.txt file."

# Second commit to dev with devlog.txt file.

git log > devlog.txt
git add devlog.txt
git commit -m "Second commit to dev with devlog.txt file."

# Create brach 'features/do_one'

git checkout -b features/do_one

# One commit to features/do_one with do_onelog.txt file.

git log > do_onelog.txt
git add do_onelog.txt
git commit -m "One commit to features/do_one with do_onelog.txt file."

# Switch to branch 'master'

git checkout master

# Create brach 'hotfix/we_gonna_die'

git checkout -b hotfix/we_gonna_die

# One commit to hotfix/we_gonna_die with gonna_dielog.txt file.

git log > gonna_dielog.txt
git add gonna_dielog.txt
git commit -m "One commit to hotfix/we_gonna_die with gonna_dielog.txt file."

# RELEASE PHASE

# Switch to branch 'master'

git checkout master

# All commits inside master except commits which is presented in branch hotfix.

git merge dev
git merge features/do_one

# HOTFIX DEPLOY

git merge --no-commit hotfix/we_gonna_die
git add --all
git commit -m "HOTFIX DEPLOY TO 'master' BRANCH"

git checkout dev
git merge --no-commit hotfix/we_gonna_die
git add --all
git commit -m "HOTFIX DEPLOY TO 'dev' BRANCH"

git checkout features/do_one
git merge --no-commit hotfix/we_gonna_die
git add --all
git commit -m "HOTFIX DEPLOY TO 'features/do_one' BRANCH"

# Log files creating 

git checkout master
git log --graph --all > finallog.txt
git log --oneline > masterlog.txt

git checkout dev
git log --oneline > devlog.txt

git checkout features/do_one
git log --oneline > do_onelog.txt

git checkout hotfix/we_gonna_die
git log --oneline > gonna_dielog.txt

git checkout master

#git add --all
#git commit -m "FINAL COMMIT"
