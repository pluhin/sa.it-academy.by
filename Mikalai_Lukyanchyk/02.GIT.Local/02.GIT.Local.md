# **02.Git.Local**
## **History**
```bash
   13  git init
   14  ls -la
   15  nano .git/config
   16  git config user.name "Mikalai.Lukyanchyk"
   17  git config user.email "Mikalai.Lukyanchyk@gmail.com"
   18  vim .git/config
   19  git status
   20  echo "First text master" >> first_master.txt
   21  git status
   22  git add first_master.txt
   23  git status
   24  git commit -m "Created the first commit on the master"
   25  git status
   26  echo "second text on the master" >> second_master.txt
   27  git add second_master.txt
   28  git commit -m "Created the second commit on the master"
   29  git status
   30  git log --oneline
   31  git log --oneline
   32  git branch
   33  git checkout -b dev
   34  echo "First dev" >> first_dev.txt
   35  git add first_dev.txt
   36  git commit -m "Created the first commit on the dev"
   37  echo "Second dev" >> second_dev.txt
   38  git add second_dev.txt
   39  git commit -m "Created the second commit on the dev"
   40  git log --oneline
   41  git checkout master
   42  git log --oneline
   43  git checkout dev
   44  git checkout -b features/do_one
   45  echo "First features/do_one" >> features/do_one.txt
   46  echo "First features/do_one" >> features_do_one.txt
   47  git add features_do_one.txt
   48  git commit -m "Created the first commit on the features/do_one"
   49  git log --oneline
   50  git checkout hotfix/we_gonna_die
   51  git checkout master
   52  git checkout -b hotfix/we_gonna_die
   53  date >> hotfix_we_gonna_die.txt
   54  git add hotfix_we_gonna_die.txt
   55  git commit -m "Created the first commit on the hotfix/we_gonna_die"
   56  git log --oneline
   57  git status
   58  git checkout master
   59  git merge features/do_one
   60  git log --oneline\
   61  git log --oneline
   62  git merge dev
   63  git cherry-pick hotfix/we_gonna_die
   64  git log --oneline
   65  git checkout dev
   66  git cherry-pick hotfix/we_gonna_die
   67  git log --oneline
   68  git checkout features/do_one
   69  git cherry-pick hotfix/we_gonna_die
   70  git log --oneline
   ```


## **Release phase**
### master branch

```bash
$ git log --oneline
df29769 (HEAD -> master, features/do_one) Created the first commit on the features/do_one
8b8fe6f (dev) Created the second commit on the dev
5f2c774 Created the first commit on the dev
e2d48eb Created the second commit on the master
e05cfd2 Created the first commit on the master
```

## **Hotfix deploy**
### master branch

```bash
$ git log --oneline
333ad69 (HEAD -> master) Created the first commit on the hotfix/we_gonna_die
df29769 (features/do_one) Created the first commit on the features/do_one
8b8fe6f (dev) Created the second commit on the dev
5f2c774 Created the first commit on the dev
e2d48eb Created the second commit on the master
e05cfd2 Created the first commit on the master
```

### dev branch
```bash
$ git log --oneline
3756382 (HEAD -> dev) Created the first commit on the hotfix/we_gonna_die
8b8fe6f Created the second commit on the dev
5f2c774 Created the first commit on the dev
e2d48eb Created the second commit on the master
e05cfd2 Created the first commit on the master
```
### features/do_one branch
```bash
$ git log --oneline
1fff0aa (HEAD -> features/do_one) Created the first commit on the hotfix/we_gonna_die
df29769 Created the first commit on the features/do_one
8b8fe6f Created the second commit on the dev
5f2c774 Created the first commit on the dev
e2d48eb Created the second commit on the master
e05cfd2 Created the first commit on the master
```
