# Created remote empty repositories
## [Github repo](https://github.com/anton-bartoshevich/sa.it-academy.by/tree/md-sa2-23-23/Anton_Bartoshevich)

## [Gitlab repo](https://gitlab.com/sheldonkuper32/anton_bartoshevich/-/tree/main/03.GIT.Hosting)
______

```bash
#!/bin/bash
git add .
echo "Please enter the name of commit:"
read commit
git commit -m "$commit"

for push_to in $(git remote); do
        git push --all $push_to
done
```
## Result after script:

```bash
668  date
669  date > date.txt
670  git status
671  ./script.sh
Please enter the name of commit:
add date.txt
[master e1429be] add date.txt
 1 file changed, 1 insertion(+)
 create mode 100644 date.txt
Counting objects: 3, done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 317 bytes | 31.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:anton-bartoshevich/Test_repo.git
   8055b73..e1429be  master -> master
Counting objects: 3, done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 317 bytes | 63.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote:
remote: To create a merge request for master, visit:
remote:   https://gitlab.com/sheldonkuper32/test_repo/-/merge_requests/new?merge_request%5Bsource_branch%5D=master
remote:
To gitlab.com:sheldonkuper32/test_repo.git
   8055b73..e1429be  master -> master
```

