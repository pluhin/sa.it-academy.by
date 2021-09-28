# 03.Git Hosting

## Repositories URLs
* GitHub: https://github.com/snegboris/git_03
* GitLab: https://gitlab.com/snegboris/git_03
* Bitbucket: https://bitbucket.org/snegboris/git_03

## Some output from shell 

```bash
sneg@home_ubuntu:~/devops_courses/git_03$ (master)git remote -v
origin-bit      git@bitbucket.org:snegboris/git_03.git (fetch)
origin-bit      git@bitbucket.org:snegboris/git_03.git (push)
origin-github   git@github.com:snegboris/git_03.git (fetch)
origin-github   git@github.com:snegboris/git_03.git (push)
origin-gitlab   git@gitlab.com:snegboris/git_03.git (fetch)
origin-gitlab   git@gitlab.com:snegboris/git_03.git (push)

sneg@home_ubuntu:~/devops_courses/git_03$ (master)git branch -a
  dev
  features
  hotfix
* master
  remotes/origin-bit/dev
  remotes/origin-bit/features
  remotes/origin-bit/hotfix
  remotes/origin-bit/master
  remotes/origin-github/HEAD -> origin-github/master
  remotes/origin-github/dev
  remotes/origin-github/features
  remotes/origin-github/hotfix
  remotes/origin-github/master
  remotes/origin-gitlab/dev
  remotes/origin-gitlab/features
  remotes/origin-gitlab/hotfix
  remotes/origin-gitlab/master
```

## Listing of pushall.sh

```bash
#!/bin/bash

echo "Enter commit message"
read message
git add .
git commit -m "${message}"

for i in `git remote`;
 do
  echo "Pushing data to remote: " $i;
  git push $i -f;
 done

exit 0
```