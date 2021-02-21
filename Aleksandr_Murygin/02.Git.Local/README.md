# Log

```bash

 122  git init
  123  nano master1.txt
  124  git status
  125  git add master1.txt
  126  git status
  127  git commit -m "first master"
  128  nano master2.txt
  129  git status
  130  git add master2.txt
  131  git status
  132  git commit -m "second master"
  133  git checkout -b dev
  134  nano dev1.txt
  135  git status
  136  git add dev1.txt
  137  git status
  138  git commit -m "first dev"
  139  nano dev2.txt
  140  git status
  141  git add dev2.txt
  142  git status
  143  git commit -m "second dev"
  144  git log --oneline
  145  git checkout -b features/do_one
  146  nano features1.txt
  147  git status
  148  git add features1.txt
  149  git status
  150  git commit -m "first features"
  151  git log --oneline
  152  git checkout master
  153  git checkout -b hotfix/we_gonna_die
  154  git log --oneline
  155  nano hotfix1.txt
  156  git status
  157  git add hotfix1.txt
  158  git status
  159  git commit -m "first hotfix"
  160  git checkout master
  161  git merge features/do_one
  162  git log --oneline
  163  git cherry-pick hotfix/we_gonna_die
  164  git log --oneline
  165  git checkout dev
  166  git cherry-pick hotfix/we_gonna_die
  167  git log --oneline
  168  git checkout features/do_one
  169  git log --oneline
  170  git cherry-pick hotfix/we_gonna_die
  171  git log --oneline
  172  git status
  173  history
```
# Branch log

## master log

```
$ git log --oneline
d7ce3a4 (HEAD -> master) first hotfix
58f8caf first features
4cbba8d second dev
bcc10e5 first dev
8c93842 second master
3c4945b first master
```
## dev log

```
$ git log --oneline
a789faa (HEAD -> dev) first hotfix
4cbba8d second dev
bcc10e5 first dev
8c93842 second master
3c4945b first master
```
## features/do_one log

```
$ git log --oneline
ca85a7b (HEAD -> features/do_one) first hotfix
58f8caf first features
4cbba8d second dev
bcc10e5 first dev
8c93842 second master
3c4945b first master
```
## hotfix/we_gonna_die log

```
$ git log --oneline
3a3aa60 (HEAD -> hotfix/we_gonna_die) first hotfix
8c93842 second master
3c4945b first master
```
