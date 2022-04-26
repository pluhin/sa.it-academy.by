# DevOps course

# 02.GIT.Local.md

```bash
  115  git init
  116  mkdir Alexandr_Nefedin
  117  cd Alexandr_Nefedin/
  118  mkdir 02.Git.Local
  119  cd 02.Git.Local/
  120  git config --list
  121  git config user.name "Alexandr Nefedin"
  122  git config user.email "demo2886@yandex.by"
  123  date > date1.txt
  124  git add --all
  125  git commot -m "My 1st commit master"
  126  git commit -m "My 1st commit master"
  127  date > date2.txt
  128  git add --all
  129  git commit -m "My second commit master"
  130  git log --oneline
  131  git checkout -b dev
  132  mkdir dev
  133  date > dev/date3.txt
  134  git add --all
  135  git commit -m "My 1st commit dev"
  136  date > dev/date4.txt
  137  git add --all
  138  git commit -m "My second commit dev"
  139  git log --oneline
  140  git checkout -b features/do_one
  141  mkdir features
  142  date > features/date5.txt
  143  git add --all
  144  git commit -m "My 1st commit feature"
  145  git log --oneline
  146  git checkout master
  147  git checkout -b hotfix/we_gonna_die
  148  mkdir hotfix
  149  date > hotfix/date6.txt
  150  git add --all
  151  git commit -m "Hotfix commit"
  152  git log --oneline
  153  git checkout dev
  154  git log --oneline
  155  git merge features/do_one
  156  git log --oneline
  157  git checkout master
  158  git merge dev
  159  git log --oneline
  160  git merge hotfix/we_gonna_die
  161  git log --oneline
  162  git checkout dev
  163  git merge hotfix/we_gonna_die
  164  git checkout features/do_one
  165  git log --oneline
  166  git merge hotfix/we_gonna_die
  167  git log --oneline
  168  git checkout master
  169  histori
  170  history

```

<h1>master</h1> 

```bash
*   308ef27 2022-04-26 | Merge branch 'hotfix/we_gonna_die' (HEAD -> master) [Alexandr Nefedin]
|\
| * 74dc7d1 2022-04-26 | Hotfix commit (hotfix/we_gonna_die) [Alexandr Nefedin]
* | d7300bd 2022-04-26 | My 1st commit feature [Alexandr Nefedin]
* | 3b018ad 2022-04-26 | My second commit dev [Alexandr Nefedin]
* | 043a333 2022-04-26 | My 1st commit dev [Alexandr Nefedin]
|/
* b51bbca 2022-04-26 | My second commit master [Alexandr Nefedin]
* 1696300 2022-04-26 | My 1st commit master [Alexandr Nefedin]
```

<h1>dev</h1>

```bash
*   3098c29 2022-04-26 | Merge branch 'hotfix/we_gonna_die' into dev (HEAD -> dev) [Alexandr Nefedin]
|\
| * 74dc7d1 2022-04-26 | Hotfix commit (hotfix/we_gonna_die) [Alexandr Nefedin]
* | d7300bd 2022-04-26 | My 1st commit feature [Alexandr Nefedin]
* | 3b018ad 2022-04-26 | My second commit dev [Alexandr Nefedin]
* | 043a333 2022-04-26 | My 1st commit dev [Alexandr Nefedin]
|/
* b51bbca 2022-04-26 | My second commit master [Alexandr Nefedin]
* 1696300 2022-04-26 | My 1st commit master [Alexandr Nefedin]
```

<h1>features/do_one</h1>

```bash
*   b48c3d9 2022-04-26 | Merge branch 'hotfix/we_gonna_die' into features/do_one (HEAD -> features/do_one) [Alexandr Nefedin]
|\
| * 74dc7d1 2022-04-26 | Hotfix commit (hotfix/we_gonna_die) [Alexandr Nefedin]
* | d7300bd 2022-04-26 | My 1st commit feature [Alexandr Nefedin]
* | 3b018ad 2022-04-26 | My second commit dev [Alexandr Nefedin]
* | 043a333 2022-04-26 | My 1st commit dev [Alexandr Nefedin]
|/
* b51bbca 2022-04-26 | My second commit master [Alexandr Nefedin]
* 1696300 2022-04-26 | My 1st commit master [Alexandr Nefedin]
```


<h1>hotfix/we_gonna_die</h1>

```bash

* 74dc7d1 2022-04-26 | Hotfix commit (HEAD -> hotfix/we_gonna_die) [Alexandr Nefedin]
* b51bbca 2022-04-26 | My second commit master [Alexandr Nefedin]
* 1696300 2022-04-26 | My 1st commit master [Alexandr Nefedin]

```
