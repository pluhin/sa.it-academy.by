# **03.Git.Hosting**
## **Project inks**
[Gitlab](https://gitlab.com/ivankuzminn/repo-test-git)<br>
[Github](https://github.com/ivankuzminn/sa.it-academy.by)

## **Script result**
```bash
$ push
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 12 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 544.84 KiB | 2.98 MiB/s, done.
Total 10 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:ivankuzminn/sa.it-academy.by.git
   a8e03ac2..921c6c20  md-sa2-23-23 -> md-sa2-23-23
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 12 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 544.84 KiB | 6.98 MiB/s, done.
Total 10 (delta 1), reused 0 (delta 0), pack-reused 0
To gitlab.com:ivankuzminn/repo-test-git.git
   a8e03ac2..921c6c20  md-sa2-23-23 -> md-sa2-23-23
OK
```
## **Script**
```bash
#! /bin/bash

git add --all
for push in $(git remote)
do
git push $push --all
done
echo "OK"
```
## **History**
```bash
   20  ssh keygen
   25  pwd 
   26  vim  /c/Users/Ivan/.ssh/rsa_id.pub
   78  touch push.sh
   79  chmod 777 push.sh
   80  git status
   81  vim push.sh
   82  ll
   84  pwd
   89  alias push="/c/Users/Ivan/Desktop/sa.it-academy.by/Ivan_Kuzmin/03.Git. Hosting/push.sh"
   90  push
   95  vim push.sh
   96  git add push.sh
   98  git commit -m "added script"
   99  push
```

## Slack notification ##
![Slack](https://github.com/ivankuzminn/sa.it-academy.by/blob/md-sa2-23-23/Ivan_Kuzmin/03.Git.Hosting/images/slack.png)

## Email notification ##
![Email](https://github.com/ivankuzminn/sa.it-academy.by/blob/md-sa2-23-23/Ivan_Kuzmin/03.Git.Hosting/images/mail.png)

## Github SSH ##
![Hub](https://github.com/ivankuzminn/sa.it-academy.by/blob/md-sa2-23-23/Ivan_Kuzmin/03.Git.Hosting/images/sshgithub.png)

## Gitlab SSH ##
![Lab](https://github.com/ivankuzminn/sa.it-academy.by/blob/md-sa2-23-23/Ivan_Kuzmin/03.Git.Hosting/images/sshgitlab.png)
