# Homework for 03.Git.Hosting
---
## Create key
```bash
svv@ubuntu:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/svv/.ssh/id_rsa):
Created directory '/home/svv/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/svv/.ssh/id_rsa
Your public key has been saved in /home/svv/.ssh/id_rsa.pub
svv@ubuntu:~$ cat /home/svv/.ssh/id_rsa.pub
```
## Remote add and rebase to local
```bash
svv@ubuntu:~/devops/sa.it-academy.by$ git branch
  master
* md-sa2-23-23
svv@ubuntu:~/devops/sa.it-academy.by$ git checkout md-sa2-23-23
Already on 'md-sa2-23-23'
Your branch is up to date with 'origin/md-sa2-23-23'.
svv@ubuntu:~/devops/sa.it-academy.by$ git remote add up https://github.com/pluhin/sa.it-academy.by.git
svv@ubuntu:~/devops/sa.it-academy.by$ git remote
origin
up
svv@ubuntu:~/devops/sa.it-academy.by$ git fetch up
remote: Enumerating objects: 29, done.
remote: Counting objects: 100% (29/29), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 29 (delta 7), reused 21 (delta 2), pack-reused 0
Unpacking objects: 100% (29/29), 5.69 KiB | 647.00 KiB/s, done.
From https://github.com/pluhin/sa.it-academy.by
 * [new branch]        jenkins            -> up/jenkins
 * [new branch]        m-sa2-06-19        -> up/m-sa2-06-19
 * [new branch]        m-sa2-07-19        -> up/m-sa2-07-19
 * [new branch]        m-sa2-08-19        -> up/m-sa2-08-19
 * [new branch]        m-sa2-09-19        -> up/m-sa2-09-19
 * [new branch]        m-sa2-10-19        -> up/m-sa2-10-19
 * [new branch]        m-sa2-11-19        -> up/m-sa2-11-19
 * [new branch]        m-sa2-12-20        -> up/m-sa2-12-20
 * [new branch]        m-sa2-13-20        -> up/m-sa2-13-20
 * [new branch]        m-sa2-14-20        -> up/m-sa2-14-20
 * [new branch]        m-sa2-15-20        -> up/m-sa2-15-20
 * [new branch]        master             -> up/master
 * [new branch]        md-sa2-16-21       -> up/md-sa2-16-21
 * [new branch]        md-sa2-17-21       -> up/md-sa2-17-21
 * [new branch]        md-sa2-18-21       -> up/md-sa2-18-21
 * [new branch]        md-sa2-19-22       -> up/md-sa2-19-22
 * [new branch]        md-sa2-20-22       -> up/md-sa2-20-22
 * [new branch]        md-sa2-21-22       -> up/md-sa2-21-22
 * [new branch]        md-sa2-22-22       -> up/md-sa2-22-22
 * [new branch]        md-sa2-23-23       -> up/md-sa2-23-23
 * [new branch]        revert-1966-master -> up/revert-1966-master
svv@ubuntu:~/devops/sa.it-academy.by$ git branch
  master
* md-sa2-23-23
svv@ubuntu:~/devops/sa.it-academy.by$ git rebase up/md-sa2-23-23
First, rewinding head to replay your work on top of it...
Fast-forwarded md-sa2-23-23 to up/md-sa2-23-23.
```
## Push to gitlab
```bash
svv@ubuntu:~/devops$ cd 02.GIT/
svv@ubuntu:~/devops/02.GIT$ git remote add origin-gitlab git@gitlab.com:svvsvv/md-sa2-23-23-git.git
svv@ubuntu:~/devops/02.GIT$ ssh -T git@gitlab.com
The authenticity of host 'gitlab.com (2606:4700:90:0:f22e:fbec:5bed:a9b9)' can't be established.
ECDSA key fingerprint is SHA256:HbW3g8zUjNSksFbqTiUWPWg2Bq1x8xdGUrliXFzSnUw.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'gitlab.com,2606:4700:90:0:f22e:fbec:5bed:a9b9' (ECDSA) to the list of known hosts.
Welcome to GitLab, @svvsvv!
svv@ubuntu:~/devops/02.GIT$ git push origin-gitlab --all
Enumerating objects: 20, done.
Counting objects: 100% (20/20), done.
Delta compression using up to 2 threads
Compressing objects: 100% (17/17), done.
Writing objects: 100% (20/20), 1.50 KiB | 770.00 KiB/s, done.
Total 20 (delta 10), reused 0 (delta 0)
remote:
remote: To create a merge request for dev, visit:
remote:   https://gitlab.com/svvsvv/md-sa2-23-23-git/-/merge_requests/new?merge_request%5Bsource_branch%5D=dev
remote:
remote:
remote: To create a merge request for features/do_one, visit:
remote:   https://gitlab.com/svvsvv/md-sa2-23-23-git/-/merge_requests/new?merge_request%5Bsource_branch%5D=features%2Fdo_one
remote:
remote:
remote: To create a merge request for hotfix/we_gonna_die, visit:
remote:   https://gitlab.com/svvsvv/md-sa2-23-23-git/-/merge_requests/new?merge_request%5Bsource_branch%5D=hotfix%2Fwe_gonna_die
remote:
To gitlab.com:svvsvv/md-sa2-23-23-git.git
 * [new branch]      dev -> dev
 * [new branch]      features/do_one -> features/do_one
 * [new branch]      hotfix/we_gonna_die -> hotfix/we_gonna_die
 * [new branch]      master -> master
```
## Push to github
```bash
svv@ubuntu:~/devops/02.GIT$ git remote add origin-github git@github.com:svvsvv/md-sa2-23-23-git.git
svv@ubuntu:~/devops/02.GIT$ git push origin-github --all
The authenticity of host 'github.com (140.82.121.3)' can't be established.
ECDSA key fingerprint is SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com,140.82.121.3' (ECDSA) to the list of known hosts.
Enumerating objects: 20, done.
Counting objects: 100% (20/20), done.
Delta compression using up to 2 threads
Compressing objects: 100% (17/17), done.
Writing objects: 100% (20/20), 1.50 KiB | 770.00 KiB/s, done.
Total 20 (delta 10), reused 0 (delta 0)
remote: Resolving deltas: 100% (10/10), done.
To github.com:svvsvv/md-sa2-23-23-git.git
 * [new branch]      dev -> dev
 * [new branch]      features/do_one -> features/do_one
 * [new branch]      hotfix/we_gonna_die -> hotfix/we_gonna_die
 * [new branch]      master -> master
```
## Script push remote
```bash
svv@ubuntu:~$ cat > pushremotes
#!/bin/bash
for repo in $(git remote)
	do
        git push --all $repo
	done
svv@ubuntu:~$ alias pushremotes="/home/svv/pushremotes"
svv@ubuntu:~$ chmod ugo+x /home/svv/pushremotes
svv@ubuntu:~/devops/02.GIT$ git remote
origin-github
origin-gitlab
svv@ubuntu:~/devops/02.GIT$ pushremotes
Everything up-to-date
Everything up-to-date
```
## E-mail notification
```
[svvsvv/sa.it-academy.by] 9cb69f: created md-file 02.GIT.local.md
От	Vitali Snisar <noreply@github.com>Add contact
Кому	svv_c@mail.ruAdd contact
Дата	Сегодня 01:06
Тело сообщения

  Branch: refs/heads/md-sa2-23-23
  Home:   https://github.com/svvsvv/sa.it-academy.by
  Commit: 4e070f939839a141fcd56a179fca6438bc47fc8a
      https://github.com/svvsvv/sa.it-academy.by/commit/4e070f939839a141fcd56a179fca6438bc47fc8a
  Author: Vitali Snisar <svv_c@mail.ru>
  Date:   2023-02-21 (Tue, 21 Feb 2023)

  Changed paths:
    A Vitali_Snisar/03.Git.Hosting/README.md

  Log Message:
  -----------
  Commit_03.Git.Hosting
Compare: https://github.com/svvsvv/sa.it-academy.by/compare/2b5a084bc8d2...4e070f939839
```
## Slack notification
```