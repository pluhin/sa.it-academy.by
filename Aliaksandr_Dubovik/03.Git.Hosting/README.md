# My repositories

https://gitlab.com/specreview.team/md-sa2-22-22-git.git
https://github.com/AliaksandrDub/md-sa2-22-22.git

# SCRIPT

#!/bin/bash

echo "Enter your message"
read message

git add .
git commit -m"${message}"

 git status
 echo "Pushing"
 for push in $(git remote); do
        git push -u $push
done

# OUTPUT SCRIPT

[aliaksandr@my-host md-sa2-22-22]$ ./myskript
Enter your message
Test_Test
[dev 7debc56] Test_Test
 1 file changed, 1 insertion(+)
 create mode 100644 new.txt
# On branch dev
nothing to commit, working directory clean
Pushing
warning: push.default is unset; its implicit value is changing in
Git 2.0 from 'matching' to 'simple'. To squelch this message
and maintain the current behavior after the default changes, use:

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use:

  git config --global push.default simple

See 'git help config' and search for 'push.default' for further information.
(the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
'current' instead of 'simple' if you sometimes use older versions of Git)

Counting objects: 4, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 301 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To git@github.com:AliaksandrDub/md-sa2-22-22.git
   c1a74f6..7debc56  dev -> dev
Branch dev set up to track remote branch dev from origin.
warning: push.default is unset; its implicit value is changing in
Git 2.0 from 'matching' to 'simple'. To squelch this message
and maintain the current behavior after the default changes, use:

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use:

  git config --global push.default simple

See 'git help config' and search for 'push.default' for further information.
(the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
'current' instead of 'simple' if you sometimes use older versions of Git)

Counting objects: 12, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (11/11), 1.22 KiB | 0 bytes/s, done.
Total 11 (delta 2), reused 7 (delta 1)
To git@gitlab.com:specreview.team/md-sa2-22-22-git.git
   25d3534..7debc56  dev -> dev
Branch dev set up to track remote branch dev from origin_gitlab.