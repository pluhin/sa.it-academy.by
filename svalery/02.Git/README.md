# Git local

```bash
   16  pwd
   17  git init
   18  echo "1 commit in master branch" > 1com_master.txt
   19  cat 1com_master.txt
   20  git add *
   21  git status
   22  git commit -m "first commit in master"
   23  git config --global user.name "Valery Skop"
   24  git config --global user.email "1@1.1"
   25  git commit -m "first commit in master"
   26  echo "2 commit in master branch" > 2com_master.txt
   27  git add *
   28  git commit -m "second commit in master"
   29  git branch -b dev
   30  git checkout -b dev
   31  echo "1 commit in dev branch" > 1com_dev.txt
   32  git add *
   33  git commit -m "first commit in dev"
   34  echo "2 commit in dev branch" > 2com_dev.txt
   35  git add *
   36  git commit -m "second commit in dev"
   37  git checkout -b features/do_one
   38  git log --oneline
   39  echo "1 commit in features branch" > 1com_featuers.txt
   40  git add *
   41  git commit -m "first commit in features"
   42  echo "2 commit in features branch" > 2com_featuers.txt
   43  git add *
   44  git checkout features/do_one
   45  git status
   46  git restore --staged 2com_featuers.txt
   47  rm 2com_featuers.txt
   48  git checkout master
   49  git checkout -b hotfix/we_gonna_die
   50  echo "1 commit in hotfix branch" > 1com_hotfix.txt
   51  git add *
   52  git commit -m "first commit in hotfix"
   53  git log --oneline
   54  git log
   55  git branch
   56  git checkout ma
   57  git checkout master #Release phase
   58  git merge features/do_one
   59  git status
   60  git log
   61  git log --oneline
   62  git checkout features/do_one #Hotfix deploy
   63  git log --oneline
   64  git checkout master
   65  git checkout hotfix/we_gonna_die
   66  git log --oneline
   67  git checkout master
   68  git cherry-pick d0bef13
   69  git log --oneline
   70  git checkout dev
   71  git cherry-pick d0bef13
   72  git checkout features/do_one
   73  git cherry-pick d0bef13
   74  git branch
   75  git checkout master
   76  git log --oneline
   77  git checkout dev
   78  git log --oneline
   79  git checkout features/do_one
   80  git log --oneline
   81  git checkout hotfix/we_gonna_die
   82  git log --oneline
   83  history
```

---

# Master branch
```bash
bd18952 (HEAD -> master) first commit in hotfix
cee3c24 first commit in features
7ac6be6 second commit in dev
cbc7cf3 first commit in dev
ed9054d second commit in master
640d5db first commit in master
```

---

# Dev branch
```bash
d408edf (HEAD -> dev) first commit in hotfix
7ac6be6 second commit in dev
cbc7cf3 first commit in dev
ed9054d second commit in master
640d5db first commit in master
```

---

# Features/do_one branch
```bash
5269b5c (HEAD -> features/do_one) first commit in hotfix
cee3c24 first commit in features
7ac6be6 second commit in dev
cbc7cf3 first commit in dev
ed9054d second commit in master
640d5db first commit in master
```

---

# Hotfix/we_gonna_die branch
```bash
d0bef13 (HEAD -> hotfix/we_gonna_die) first commit in hotfix
ed9054d second commit in master
640d5db first commit in master
```