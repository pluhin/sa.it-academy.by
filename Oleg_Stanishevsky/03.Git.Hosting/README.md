# 03.Git.Hosting

## Remote repositoties
### GitHub:
https://github.com/Stanishevski/03githosting.git

### GitLab:
https://gitlab.com/oleg.stanishevski/03githosting


# Terminal screen
```
sysadmin@srv:~/Mydevops/03.Git.Hosting$ date >> test.txt
sysadmin@srv:~/Mydevops/03.Git.Hosting$ git add --all
sysadmin@srv:~/Mydevops/03.Git.Hosting$ git commit -m "TOTAL END 4"
[master 35e6302] TOTAL END 4
 1 file changed, 1 insertion(+)
sysadmin@srv:~/Mydevops/03.Git.Hosting$ sh push_to_all_repos.sh
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 412 bytes | 412.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Stanishevski/03githosting.git
   5196aa3..35e6302  master -> master
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 412 bytes | 412.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0)
To gitlab.com:oleg.stanishevski/03githosting.git
   5196aa3..35e6302  master -> master
```
 # SCRIPT

```
#!/bin/bash
  
origins=$(git remote)
for list in $origins
do
git push -f $list --all
done

```
# SLACK Notification
https://github.com/Stanishevski/sa.it-academy.by/blob/md-sa2-22-22/Oleg_Stanishevsky/03.Git.Hosting/Slack.PNG

