# 03.GITHUB

## Repositories's urls

[Github](https://github.com/Anton50013/sa2-23-23-git_Negovora)

[Gitlab](https://gitlab.com/anton50013/md-sa2-23-23-git_test2)

## SHH Github

![SSH Github](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/03.Git.Hosting/SSH.png)

## SHH Gitlab

![SSH Gitlab](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/03.Git.Hosting/SSHgitlab.png)

## Email notification

![Email](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/03.Git.Hosting/Emailnoti.png)

## Slack notification

![Slak](https://github.com/Anton50013/sa.it-academy.by/blob/md-sa2-23-23/Anton_Negovora/03.Git.Hosting/Gitnoti.png)

## Script

```bash
#! /bin/bash

git add --all
for push in $(git remote)
do
git push $push --all
done
```

## Script Output

```bash
# pushtogit                              Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 2 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 472 bytes | 472.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Anton50013/sa.it-academy.by.git
   83fea0ea..123aec1c  md-sa2-23-23 -> md-sa2-23-23
Everything up-to-date
```

## History

```bash
  144  ssh-keygen
  145  cat /root/.ssh/id_rsa.pub
  146  git remote add origin git@github.com:Anton50013/sa2-23-23-git_Negovora.git
  147  git push origin --all
  148  cd /tmp/
  149  git clone git@github.com:Anton50013/sa.it-academy.by.git
  150  cd sa.it-academy.by/
  151  git checkout md-sa2-23-23
  152  ls -la
  153  git remote add up git@github.com:Anton50013/sa.it-academy.by.git
  154  git fetch up
  155  git rebase up/md-sa2-23-23
  156  ls -l
  157  mkdir Anton_Negovora
  163  cd ./02.GIT
  164  git remote rename origin origin-github
  165  git remote add origin git@gitlab.com:anton50013/md-sa2-23-23-git_test.git
  166  git push origin --all
  167  cd /tmp/
  168  ls -la
  169  cd ./sa.it-academy.by
  170  ls -la
  171  cd ./Anton_Negovora
  172  mkdir 02.GIT.Local
  173  cd ./02.GIT.Local
  174  vim 02.GIT.Local.md
  175  cd ../
  176  vim README.md
  177  ls -la
  178  git add --all
  179  git commit -m "Create 02rep"
  183  git branch
  184  ls -la
  185  mkdir 03.Git.Hosting
  186  cd ./03.Git.Hosting
  187  vim script.sh
  189  chmod +x script.sh
  190  alias pushtogit="/tmp/sa.it-academy.by/Anton_Negovora/03.Git.Hosting/script.sh"
  191  git add --all
  192  git commit -m "script"
  193  pushtogit
```