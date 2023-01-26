## [GitHub](https://github.com/Keldanovich/new_repo)
## [GitLab](https://gitlab.com/D.Keldanovich/new_repo)

## Script

```#!/bin/bash
echo -n "Push to all repo enter commit:"
read commit

git add --all
git commit -m $commit

for push in $(git remote); do
        git push -u $push
done
```

## Notification

GIT-Notification:
![alt text](https://github.com/Keldanovich/sa.it-academy.by/blob/md-sa2-22-22/Denis_Keldanovich/03.GIT.Local/hub.jpg)
LAB-Notification:
![alt text](https://github.com/Keldanovich/sa.it-academy.by/blob/md-sa2-22-22/Denis_Keldanovich/03.GIT.Local/lab.jpg)

## Alias to *.sh

```
alias gitpush='bash ./gitpush.sh'
```


## Output
```
dkeldanovich@dkeldanovich-ubuntu:~/local_repository$ gitpush
Push to all repo enter commit:Test
[master 264c25e] Test
 1 file changed, 1 insertion(+), 1 deletion(-)
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 353 bytes | 353.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Keldanovich/new_repo.git
   98bdffa..264c25e  master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
Branch 'master' set up to track remote branch 'master' from 'origin_hub'.
Everything up-to-date
Username for 'https://gitlab.com': 432123@tut.by
Password for 'https://432123@tut.by@gitlab.com':
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 353 bytes | 353.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote:
remote: To create a merge request for master, visit:
remote:   https://gitlab.com/D.Keldanovich/new_repo/-/merge_requests/new?merge_request%5Bsource_branch%5D=master
remote:
To https://gitlab.com/D.Keldanovich/new_repo.git
   98bdffa..264c25e  master -> master
Branch 'master' set up to track remote branch 'master' from 'origin_lab'.
```
