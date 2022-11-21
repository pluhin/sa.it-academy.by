### 03.Git.Hosting

## Commands
```bash
    1  ssh-keygen
    2  cat ~/.ssh/id_rsa.pub 
    3  clear
    4  git remote add originGH git@github.com:Pavel167988/03GitHosting.git
    5  clear
    6  git branch
    7  git status
    8  git add 02.GitLocal/
    9  git commit -m "Add folder to github"
   10  git push originGH master
   11  cat ~/.ssh/id_rsa.pub 
   12  git remote add originGL git@gitlab.com:Pavel167988/githosting.git
   13  git add 02.GitLocal/
   14  git commit -m 
   15  git commit -m "Add folder to gitlab"
   16  git push -f originGL master
   17  cat ~/.ssh/id_rsa.pub 
   18  git remote add originBB git@bitbucket.org:pavelogs/3githosting.git
   19  git add 02.GitLocal/
   20  git commit -m "Add folder to Bitbucket"
   21  git push -f originBB master
  ```



## Urls Github, Gitlab, Bitbucket

[GitHub(https://github.com/Pavel167988/03GitHosting/tree/master)

[GitLab(https://gitlab.com/Pavel167988/githosting/-/tree/master)

[BitBucket(https://bitbucket.org/pavelogs/3githosting/src/master)





## Script
```bash
#!/bin/bash
repos=$(git remote)
for push in $repos
do
git push -f $push --all
done
```



## Output script
```bash
$ bash script.sh
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 1.06 KiB | 1.06 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0)
To bitbucket.org:pavelogs/3githosting.git
   5ba9da2..3a8a279  master -> master
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 1.06 KiB | 1.06 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To github.com:Pavel167988/03GitHosting.git
   5ba9da2..3a8a279  master -> master
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 1.06 KiB | 1.06 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0)
remote:
remote: To create a merge request for master, visit:
remote:   https://gitlab.com/Pavel167988/githosting/-/merge_requests/new?merge_request%5Bsource_branch%5D=master
remote:
To gitlab.com:Pavel167988/githosting.git
   5ba9da2..3a8a279  master -> master
```
















