# 02.GIT

```bash

    # Step 1 (master (init branch) with 2 commits)
cd /a/git
git init
git config --global user.email "estello2k@gmail.com"
git config --global user.name "akamenetskiy"
echo text >> 1.txt
echo text >> 2.txt
git add 1.txt
git commit -m "First commit (master) with 1.txt"
git add 2.txt
git commit -m "Second commit (master) with 2.txt"
    # Step 2 (dev (has been created from master) + 2 additional commits)
git checkout -b dev
echo text >> 3.txt
echo text >> 4.txt
git add 3.txt
git commit -m "First commit (dev) with 3.txt"
git add 4.txt
git commit -m "Second commit (dev) with 4.txt"
    # Step 3 (features/do_one (has been created from dev branch))
git checkout -b features/do_one
echo text >> 5.txt
git add 5.txt
git commit -m "First commit (features/do_one) with 5.txt"
    # Step 4 (hotfix/we_gonna_die (has been created from master branch))
git checkout master
git checkout -b hotfix/we_gonna_die
echo text >> 6.txt
git add 6.txt
git commit -m "First commit (hotfix/we_gonna_die) with 6.txt"
    # Step 5 - Release phase
git checkout master
git merge dev
git merge features/do_one
    # Step 6 - Hotfix deploy
git checkout hotfix/we_gonna_die
git log --oneline
git checkout master
git cherry-pick ce6b1b3
git checkout dev
git cherry-pick ce6b1b3
git checkout features/do_one
git cherry-pick ce6b1b3

# List of commits
# master branch
a361c06 (HEAD -> master) First commit (hotfix/we_gonna_die) with 6.txt
ad0095c First commit (features/do_one) with 5.txt
c1a4a88 Second commit (dev) with 4.txt
66ad6fe First commit (dev) with 3.txt
a258608 Second commit (master) with 2.txt
f7b7500 First commit (master) with 1.txt
# dev branch
7ed78af (HEAD -> dev) First commit (hotfix/we_gonna_die) with 6.txt
c1a4a88 Second commit (dev) with 4.txt
66ad6fe First commit (dev) with 3.txt
a258608 Second commit (master) with 2.txt
f7b7500 First commit (master) with 1.txt
# features/do_one branch
5fadf79 (HEAD -> features/do_one) First commit (hotfix/we_gonna_die) with 6.txt
ad0095c First commit (features/do_one) with 5.txt
c1a4a88 Second commit (dev) with 4.txt
66ad6fe First commit (dev) with 3.txt
a258608 Second commit (master) with 2.txt
f7b7500 First commit (master) with 1.txt
# hotfix/we_gonna_die branch
ce6b1b3 (HEAD -> hotfix/we_gonna_die) First commit (hotfix/we_gonna_die) with 6.txt
a258608 Second commit (master) with 2.txt
f7b7500 First commit (master) with 1.txt
```