git init
date > 1_master.txt
git add 1_master.txt
git commit -m "First commit to master"
date > 2_master.txt
git add 2_master.txt
git commit -m "Second commit to master"
git checkout -b dev
date > 1_dev.txt
git add 1_dev.txt
git commit -m "First commit to dev"
date > 2_dev.txt
git add 2_dev.txt
git commit -m "Second commit to dev"
git checkout -b features/do_one
date > do_one.txt
git add do_one.txt
git commit -m "Commit to features/do_one"
git checkout master
git checkout -b hotfix/we_gonna_die
date > we_gonna_die.txt
git add we_gonna_die.txt
git commit -m "Commit to hotfix/we_gonna_die"
git checkout dev
git merge features/do_one
git checkout master
git merge dev
git log --oneline
