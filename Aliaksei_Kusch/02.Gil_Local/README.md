# Homework Alexey Kusch

## git log:

```
commit 5c8faf4799898498282b22ed29b2a96ae1628b50 (HEAD -> master)
Merge: f37e321 a3869f8
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:50:56 2021 +0300

    Fix2

commit f37e3215995fbec6948c4109e540a89388c75ee6
Merge: dab3023 1bafe7b
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:47:01 2021 +0300

    Fix

commit dab3023e0e59b733a90cdfe96e0bada2b5ab1e2b (hotfix/we_gonna_die)
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:27:57 2021 +0300

    hotfix/we_gonna_die additional

commit a3869f843c1da1a7e4ce58cc93f65d4fd33e3798 (features/do_one, dev)
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:23:06 2021 +0300

    features/do_one additional

commit 1bafe7b16fe8ca07496315194a42210df5521caf
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:19:22 2021 +0300

    Second Additional

commit 0143b883b9726916cb27bbd16eb6f26deb03927a
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:18:31 2021 +0300

    First Additional

commit b4f037b9138f3d3544fffb8903dd38de0dafaece
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:11:16 2021 +0300

    Second Commit

commit 9d3aff5e9f331cf1d8e7ea7b23eec268c29ac10d
Author: Alexey Kusch <test@computer-help.by>
Date:   Wed Feb 24 23:10:15 2021 +0300

    First Commit
```

## git log --oneline --decorate --graph --all:

```
*   5c8faf4 (HEAD -> master) Fix2
|\  
| * a3869f8 (features/do_one, dev) features/do_one additional
* | f37e321 Fix
|\| 
| * 1bafe7b Second Additional
| * 0143b88 First Additional
* | dab3023 (hotfix/we_gonna_die) hotfix/we_gonna_die additional
|/  
* b4f037b Second Commit
* 9d3aff5 First Commit
```

## history:

```
   92  mkdir homework
   93  cd homework
   94  git init
   95  nano first_commit.txt
   96  git add first_commit.txt 
   97  git commit -m "First Commit"
   98  nano second_commit.txt
   99  git add .
  100  git commit -m "Second Commit"
  101  git log
  102  git checkout -b dev
  103  git status
  104  ll
  105  nano first_additional.txt
  106  git add .
  107  git commit -m "First Additional"
  108  nano second_additional.txt
  109  git add .
  110  git commit -m "Second Additional"
  111  git branch "features/do_one"
  112  git checkout "features/do_one"
  113  git status
  114  nano first_additional.txt 
  115  git commit -m "features/do_one additional"
  116  git commit -a -m "features/do_one additional"
  117  git checkout master
  118  git checkout -b "hotfix/we_gonna_die"
  119  nano first_additional.txt
  120  git commit -a -m "hotfix/we_gonna_die additional"
  121  git add .
  122  git commit -m "hotfix/we_gonna_die additional"
  123  git checkout master 
  124  git merge "hotfix/we_gonna_die"
  125  git merge "dev"
  126  git log --oneline --decorate --graph --all
  127  git log
  128  git checkout "hotfix/we_gonna_die"
  129  git rebase master
  130  git rebase -i master
  131  nano first_additional.txt
  132  git checkout master 
  133  git merge "dev"
  134  git add .
  135  git commit -m "Fix"
  136  git merge "dev"
  137  git status
  138  git log
  139  history
  140  git log --oneline --decorate --graph --all
  141  git checkout dev
  142  git merge "features/do_one"
  143  git checkout master
  144  git merge dev
  145  nano first_additional.txt
  146  git add .
  147  git commit -m "Fix2"
  148  git log --oneline --decorate --graph --all
```
