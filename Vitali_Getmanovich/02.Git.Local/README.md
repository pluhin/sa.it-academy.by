# 02. GIT. Local

## List commands
---

```bash
   40  mkdir Course
   41  ls -la
   42  cd Course
   43  ls -la
   44  mkdir 02.GIT.Local
   45  ls -l
   46  cd 02.GIT.Local/
   47  git init
   48  ls -la
   49  cd .git/
   50  ls -la
   51  sudo vim config
   52  git config user.name "VitaliGet"
   53  git config user.email "getmanovich1987@gmail.com"
   54  sudo vim config
   55  cd ..
   56  ls -l
   57  ls -la
   58  clear
   66  git status
   67  cd Course/02.GIT.Local/
   68  git status
   69  clear
   70  ls -la
   71  history > firstfile.txt
   72  git status
   73  git add --all
   74  git status
   75  git commit -m "first_commit_master"
   76  git status
   77  git --oneline
   78  git log --oneline
   79  date > secondfile.txt
   80  ls -l
   81  cat firstfile.txt
   82  cat secondfile.txt
   83  clear
   84  git status
   85  git add --all
   86  git status
   87  git commit -m "second_commit_master"
   88  git log --oneline
   89  git branch
   90  git branch -b dev
   91  git branch -b "dev"
   92  git checkout -b "dev"
   93  git checkout -b dev
   94  branch
   95  git branch
   96  git log --oneline
   97  git branch
   98  echo "This is first file in dev branch" > thirdfile.txt
   99  cat thirdfile.txt
  100  git add --all
  101  git commit -m "first_commit_dev"
  102  git log --oneline
  103  date > fourthfile.txt
  104  git add fourthfile.txt
  105  git commit -m "second_commit_dev"
  106  git log --oneline
  107  git checkout -b features/do_one
  108  git branch
  109  date > fifthfile.txt
  110  git add fifthfile.txt
  111  git commit -m "first_commit_features/do_one"
  112  git log --oneline
  113  git branch master
  114  git branch
  115  git checkout master
  116  git log --oneline
  117  git checkout dev
  118  git log --oneline
  119  git checkout master
  120  git checkout -b hotfix/we_gonna_die
  121  git branch
  122  echo "This is first file in branch hotfix/we_gonna_die" > sixthfile.txt
  123  ls -l
  124  git add --all
  125  git commit -m "first_commit_hotfix/we_gonna_die"
  126  git log --oneline
  127  ls -l
  128  git checkout master
  129  git log --oneline
  132  git merge dev
  134  git log --oneline
  135  git merge features/do_one
  136  git log --oneline
  139  git checkout dev
  140  git log --oneline
  141  git checkout master
  142  git cherry-pick  hotfix/we_gonna_die
  155  git log --oneline
  156  git checkout dev
  157  git cherry-pick hotfix/we_gonna_die
  158  git log --oneline
  159  git checkout features/do_one
  160  git cherry-pick hotfix/we_gonna_die
  161  git log --oneline
  162  history
```

## Play
---

### Branch 'master'
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git log --oneline
8d6cfa7 (HEAD -> master) first_commit_hotfix/we_gonna_die
fb7925b first_commit_features/do_one
e36aed1 second_commit_dev
0d0a417 first_commit_dev
9339153 second_commit_master
455e792 first_commit_master
```
### Branch 'dev'
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git log --oneline
e0d13c7 (HEAD -> dev) first_commit_hotfix/we_gonna_die
e36aed1 second_commit_dev
0d0a417 first_commit_dev
9339153 second_commit_master
455e792 first_commit_master
```
### Branch 'features/do_one'
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git log --oneline
1ab29cd (HEAD -> features/do_one) first_commit_hotfix/we_gonna_die
fb7925b first_commit_features/do_one
e36aed1 second_commit_dev
0d0a417 first_commit_dev
9339153 second_commit_master
455e792 first_commit_master
```
### Branch 'hotfix/we_gonna_die'
```bash
vitali@vitali-VirtualBox:~/Course/02.GIT.Local$ git log --oneline
24ed2be (HEAD -> hotfix/we_gonna_die) first_commit_hotfix/we_gonna_die
9339153 second_commit_master
455e792 first_commit_master
```
