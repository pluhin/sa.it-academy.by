02.GIT.local

#Commands

```bash
  334  git config user.email "ivan.fanchenko@gmail.com"
  335  git config user.name "Ivan Fanchenko"
  336  vi .gitignore
#Ceate files in master branch and add commits
  337  echo "First commit in master" >> master_file.txt
  338  git add .
  339  git status
  340  git commit -m "First commit in master"
  341  echo "Second commit in master" >> master_file.txt
  342  git add .
  343  git commit -m "Second commit in master"
  344  git log
#Ceate files in dev branch and add commits
  345  git checkout -b "dev"
  346  echo "First commit in dev" >> dev_file.txt
  347  git add .
  348  git commit -m "First commit in dev"
  349  echo "Second commit in dev" >> dev_file.txt
  350  git add .
  351  git commit -m "Second commit in dev"
  352  git log
#Ceate files in features branch and add commits
  353  git checkout -b features/do_one
  354  echo "First commit in features" >> features_file.txt
  355  git add .
  356  git commit -m "One commit in features"
  357  git log
  358  git checkout master
#Ceate files in hotfix branch and add commits
  359  git checkout -b hotfix/we_gonna_die
  360  echo "One commit in hotfix" >> hotfix_file.txt
  361  git add .
  362  git commit -m "One commit in hotfix"
#Rebase master with features which include dev
  363  git checkout master
  364  git rebase features/do_one
  365  git log --oneline --graph
#Merge master with  hotfix
  366  git merge hotfix/we_gonna_die
  367  git log --oneline --graph
#Add hotfix to dev branch
  368  git checkout dev
  369  git cherry-pick hotfix/we_gonna_die
  370  git log --oneline --graph
#Add hotfix to features branch
  371  git checkout features/do_one
  372  git cherry-pick hotfix/we_gonna_die
  373  git log --oneline --graph
  374  history
```
```
#Commits list in master
*   d7df158 (HEAD -> master) Merge branch 'hotfix/we_gonna_die' firstly to master branch
|\
| * 31cab26 (hotfix/we_gonna_die) One commit in hotfix
* | 63cd259 One commit in features
* | f7802c5 Second commit in dev
* | a1912a8 First commit in dev
|/
* 0f1c77e Second commit in master
* 125aaac First commit in master

#Commits list in dev
* dabbbc8 (HEAD -> dev) One commit in hotfix
* f7802c5 Second commit in dev
* a1912a8 First commit in dev
* 0f1c77e Second commit in master
* 125aaac First commit in master

#Commits list in features/do_one
* 2ba7765 (HEAD -> features/do_one) One commit in hotfix
* 63cd259 One commit in features
* f7802c5 Second commit in dev
* a1912a8 First commit in dev
* 0f1c77e Second commit in master
* 125aaac First commit in master


#Commits list hotfix
* 31cab26 (HEAD -> hotfix/we_gonna_die) One commit in hotfix
* 0f1c77e Second commit in master
* 125aaac First commit in master
