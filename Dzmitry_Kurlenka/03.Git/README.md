# 03.Git
---
## SSH
```bash
dzmtr_k@git_srv:~$ ssh-keygen
dzmtr_k@git_srv:~$ cat ~/.ssh/id_rsa.pub
```
## Remote add and rebase to local
```bash
dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git branch
  master
* md-sa2-23-23

dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git checkout md-sa2-23-23
Already on 'md-sa2-23-23'
Your branch is up to date with 'origin/md-sa2-23-23'.
dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git remote add up git@github.com:kurlenka/sa.it-academy.by.git
dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git remote
origin
up
dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git fetch up

dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git branch
  master
* md-sa2-23-23
dzmtr_k@git_srv:~/tmp/sa.it-academy.by$ git rebase up/md-sa2-23-23
First, rewinding head to replay your work on top of it...
Fast-forwarded md-sa2-23-23 to up/md-sa2-23-23.
```
## Push to gitlab
```bash
dzmtr_k@git_srv:~/tmp/sa.it-academy.by/Dzmitry_Kurlenka$ git remote add origin-lab git@gitlab.com:dzmitry_kur/sa.it-academy.by.git
dzmtr_k@git_srv:~/tmp/sa.it-academy.by/Dzmitry_Kurlenka$ ssh -T git@gitlab.com

dzmtr_k@git_srv:~/tmp/sa.it-academy.by/Dzmitry_Kurlenka$ git push origin-lab --all
Counting objects: 418, done.
Compressing objects: 100% (258/258), done.
Writing objects: 100% (418/418), 1.10 MiB | 11.90 MiB/s, done.
Total 418 (delta 98), reused 401 (delta 89)
remote: Resolving deltas: 100% (98/98), done.
remote:
remote: To create a merge request for md-sa2-23-23, visit:
remote:   https://gitlab.com/dzmitry_kur/sa.it-academy.by/-/merge_requests/new?merge_request%5Bsource_branch%5D=md-sa2-23-23
remote:
To gitlab.com:dzmitry_kur/sa.it-academy.by.git
 * [new branch]        master -> master
 * [new branch]        md-sa2-23-23 -> md-sa2-23-23

```

## Script
```bash
#!/bin/bash
for repo in $(git remote)
	do
        git push --all $repo
	done
dzmtr_k@git_srv:~$ alias pushgit="/home/dzmtr_k/pushgit"

```