## 03.Git.Hosting 
Homework Assignment 1: Initializing a Remote Repository


1.Create remote empty repositories (GitHub and GitLab)
```bush
	https://github.com/Dmitry-Kitsune/md-sa2-29-24
	https://gitlab.com/D_Burlyaev/md-sa2-29-24
```bush

2.Add ssh key(s) to use ssh authentication
```bush
ssh-keygen
Generating public/private ed25519 key pair.
Enter file in which to save the key (/c/Users/XXXXX/.ssh/id_ed25519):
Enter passphrase for "/c/Users/XXXXXX/.ssh/id_ed25519" (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/XXXXXX/.ssh/id_ed25519
Your public key has been saved in /c/Users/XXXXXX/.ssh/id_ed25519.pub
## Added public key to profile in both hostings.
```

3.Push your local repository into remote repositories each all, one by one
```bush
## Adds path to remote repositories
git remote add GHub git@github.com:Dmitry-Kitsune/md-sa2-29-24.git
git remote add GLab git@gitlab.com:D_Burlyaev/md-sa2-29-24.git

git remote
GHub
GLab
origin


git branch -m md-sa2-29-24

```bush
$ git push GHub md-sa2-29-24
Enter passphrase for key '/c/Users/Fuzzy/.ssh/id_ed_md-sa2-29-24':
Enumerating objects: 182, done.
Counting objects: 100% (182/182), done.
Delta compression using up to 16 threads
Compressing objects: 100% (116/116), done.
Writing objects: 100% (182/182), 1.35 MiB | 2.17 MiB/s, done.
Total 182 (delta 38), reused 161 (delta 30), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (38/38), done.
remote:
remote: Create a pull request for 'md-sa2-29-24' on GitHub by visiting:
remote:      https://github.com/Dmitry-Kitsune/md-sa2-29-24/pull/new/md-sa2-29-24
remote:
To github.com:Dmitry-Kitsune/md-sa2-29-24.git
 * [new branch]      md-sa2-29-24 -> md-sa2-29-24

$ git push GLab md-sa2-29-24

Enter passphrase for key '/c/Users/Fuzzy/.ssh/id_ed25519':
Enumerating objects: 182, done.
Counting objects: 100% (182/182), done.
Delta compression using up to 16 threads
Compressing objects: 100% (116/116), done.
Writing objects: 100% (182/182), 1.35 MiB | 24.32 MiB/s, done.
Total 182 (delta 38), reused 161 (delta 30), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (38/38), done.
remote:
remote: To create a merge request for md-sa2-29-24, visit:
remote:   https://gitlab.com/D_Burlyaev/md-sa2-29-24/-/merge_requests/new?merge_request%5Bsource_branch%5D=md-sa2-29-24
remote:
To gitlab.com:D_Burlyaev/md-sa2-29-24.git
 * [new branch]      md-sa2-29-24 -> md-sa2-29-24

```
4.Create email integration push/commit events
```bush
## Added email notifications

![alt text](https://github.com/Dmitry-Kitsune/md-sa2-29-24/blob/md-sa2-29-24/md-sa2-29-24/03.Git.Hosting/img/Ghub_notification.png "GitHub email")

```

5.Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
create alias for script in your shell

```bush
alias Autopush='./AutoPushScript.sh'
## Скрипт

#!/bin/bash

echo "Start push in specifyed remote repositories"

# Get repo list
remote_repositories=$(git remote)

# Push in repo
for This_repo in $remote_repositories
do
if [  $This_repo = GHub ] || [ $This_repo = GLub ]
then
    git push -u $This_repo --all
fi
done

echo "End push in all repositories"

```
6.list of upstream repositories should be extracted automatically for loop


```bush
$ Autopush
Start push in specifyed remote repositories
Enter passphrase for key '/c/Users/Fuzzy/.ssh/id_ed_md-sa2-29-24':
Enumerating objects: 20, done.
Counting objects: 100% (20/20), done.
Delta compression using up to 16 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (11/11), 1.40 KiB | 1.40 MiB/s, done.
Total 11 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:Dmitry-Kitsune/md-sa2-29-24.git
   47efa64..f3f1143  md-sa2-29-24 -> md-sa2-29-24
 * [new branch]      bug-fix -> bug-fix
 * [new branch]      experimental-feature -> experimental-feature
 * [new branch]      feature-branch -> feature-branch
 * [new branch]      master -> master
branch 'md-sa2-29-24' set up to track 'GHub/md-sa2-29-24'.
branch 'bug-fix' set up to track 'GHub/bug-fix'.
branch 'experimental-feature' set up to track 'GHub/experimental-feature'.
branch 'feature-branch' set up to track 'GHub/feature-branch'.
branch 'master' set up to track 'GHub/master'.
End push in all repositories
```


Create folder 03.GIT.Hosting, put all your repositories's urls to the file 03.GIT.Hosting/README.md + script and prepare PR (Pull Request)