# 03.GIT.Hosting

## Create ssh-key
---
```bash
vitali@vitali-VirtualBox:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/vitali/.ssh/id_rsa):
Created directory '/home/vitali/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/vitali/.ssh/id_rsa
Your public key has been saved in /home/vitali/.ssh/id_rsa.pub
vitali@vitali-VirtualBox:~/.ssh$ cat id_rsa.pub
```

## Push local repository to GitHub
-------
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git remote add origin-github git@github.com:VitaliGet/Course_Lesson3.git
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git remote
origin-github
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git push origin-github
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Compressing objects: 100% (12/12), done.
Writing objects: 100% (18/18), 2.03 KiB | 94.00 KiB/s, done.
Total 18 (delta 4), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (4/4), done.
To github.com:VitaliGet/Course_Lesson3.git
 * [new branch]      master -> master
```
### *URL to the repository GitHub*
 https://github.com/VitaliGet/Course_Lesson3 

## Push local repository to GitLab
---
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git remote add origin-gitlab git@gitlab.com:Getmanovich7/course-03-lesson.git
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git remote
origin-github
origin-gitlab
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git push origin-gitlab
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Compressing objects: 100% (12/12), done.
Writing objects: 100% (18/18), 2.03 KiB | 74.00 KiB/s, done.
Total 18 (delta 4), reused 0 (delta 0), pack-reused 0
To gitlab.com:Getmanovich7/course-03-lesson.git
 * [new branch]      master -> master
```

### *URL to the repository GitLab*
https://gitlab.com/Getmanovich7/course-03-lesson


## Slack integration
---
![Slackscreen](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/03.GIT.Hosting/Slack.png)

---

## Email notification
---
![Emailscreen](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/03.GIT.Hosting/email.png)

---

## Script for automatically push

```bash
vitali@vitali-VirtualBox:~$ cat pushscript.sh
#!/bin/bash
git add --all
git commit -m "$1"
for repository in $(git remote)
do
        git push $repository
done
```
vitali@vitali-VirtualBox:~$ chmod +x pushscript.sh

## Create alias
```bash
vitali@vitali-VirtualBox:~$ cat .bashrc
# push commit to all remote repository
alias push='source /home/vitali/pushscript.sh'
```
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ push "Add new file"
[master 4f00bbe] Add new file
 2 files changed, 2 insertions(+)
 create mode 100644 eleventhfile.txt
 create mode 100644 newfile.txt
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 388 bytes | 64.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:VitaliGet/Course_Lesson3.git
   3f17333..4f00bbe  master -> master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 388 bytes | 10.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
To gitlab.com:Getmanovich7/course-03-lesson.git
   3f17333..4f00bbe  master -> master
```
