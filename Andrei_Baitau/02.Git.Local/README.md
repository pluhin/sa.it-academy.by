### GIT LOCAL

## Full history

```bash
  137  mkdir sa
  138  cd sa/
  139  git init
  140  ls -la
  141  git config user.name "Andrei Baitau"
  142  git config user.email "baitovandrei@gmail.com"
  143  git .git/config
  144  vim git .git/config
  145  vim .git/config
  146  ls -la
  147  git status
  148  vim .gitignore
  149  touch master_file1.txt
  150  git status
  151  git add --all
  152  git commit -m "The first commit in master"
  153  touch master_file2.txt
  154  git add --all
  155  git commit -m "The second commit in master"
  156  git log --oneline
  157  git checkout dev
  158  git checkout -b dev
  159  git log --oneline
  160  ls -la
  161  touch dev_file1.txt
  162  git add --all
  163  git commit -m "The first commit in dev"
  164  touch dev_file2.txt
  165  git add --all
  166  git commit -m "The second commit in dev"
  167  git log --oneline
  168  git checkout -b features/do_one
  169  git log --oneline
  170  touch features_file1.txt
  171  git status
  172  git add --all
  173  git commit -m "Commit in features/do_one"
  174  git checkout master
  175  git log --oneline
  176  git checkout -b hotfix/we_gonna_die
  177  git log --oneline
  178  touch we_gonna_die_file1.txt
  179  git add --all
  180  git commit -m "Commit in hotfix/we_gonna_die"
  181  git log --oneline
  182  git checkout features/do_one
  183  git log --oneline
  184  git checkout
  185  git checkout master
  186  git merge features/do_one
  187  git log --oneline
  188  git merge hotfix/we_gonna_die
  189  git log --oneline
  190  ls -la
  191  git merge hotfix/we_gonna_die
  192  git cherry-pick fb87457
  193  git log --oneline
  194  git reset --hard HEAD~1
  195  git log --oneline
  196  git checkout features/do_one
  197  git merge master
  198  git log --oneline
  199  git checkout dev
  200  git log --oneline
  201  git merge master
  202  git log --oneline
```

# Master commits (after play2)

```bash
17b00f2 (HEAD -> master, features/do_one, dev) Merge branch 'hotfix/we_gonna_die'
44a6633 (hotfix/we_gonna_die) Commit in hotfix/we_gonna_die
fb87457 Commit in features/do_one
e79845f The second commit in dev
f1c4aa3 The first commit in dev
843745e The second commit in master
95f1fa8 The first commit in master
```

# dev commits (after play2)
```bash
17b00f2 (HEAD -> dev, master, features/do_one) Merge branch 'hotfix/we_gonna_die'
44a6633 (hotfix/we_gonna_die) Commit in hotfix/we_gonna_die
fb87457 Commit in features/do_one
e79845f The second commit in dev
f1c4aa3 The first commit in dev
843745e The second commit in master
95f1fa8 The first commit in master
```

# feature/do_one (after play2)

```bash
17b00f2 (HEAD -> features/do_one, master, dev) Merge branch 'hotfix/we_gonna_die'
44a6633 (hotfix/we_gonna_die) Commit in hotfix/we_gonna_die
fb87457 Commit in features/do_one
e79845f The second commit in dev
f1c4aa3 The first commit in dev
843745e The second commit in master
95f1fa8 The first commit in master
```

# hotfix commits

```bash
44a6633 (HEAD -> hotfix/we_gonna_die) Commit in hotfix/we_gonna_die
843745e The second commit in master
95f1fa8 The first commit in master
```

# Play 2 commands 
   
```bash
    git checkout master 
  191  git merge hotfix/we_gonna_die
  196  git checkout features/do_one
  197  git merge master
  199  git checkout dev
  201  git merge master
``` 

## Play 1 

# History

```bash
  186  git checkout master
  187  git merge features/do_one
  188  git log --oneline
```

# Master commits 

```bash
fb87457 (HEAD -> master, features/do_one) Commit in features/do_one
e79845f (dev) The second commit in dev
f1c4aa3 The first commit in dev
843745e The second commit in master
95f1fa8 The first commit in master
```

## Before play

# master commits

```bash
843745e (HEAD -> master) The second commit in master
95f1fa8 The first commit in master
```

# dev commits

```bash
e79845f (HEAD -> dev) The second commit in dev
f1c4aa3 The first commit in dev
843745e (master) The second commit in master
95f1fa8 The first commit in master
```

# feature/do_one commits

```bash
fb87457 (HEAD -> features/do_one) Commit in features/do_one
e79845f (dev) The second commit in dev
f1c4aa3 The first commit in dev
843745e (master) The second commit in master
95f1fa8 The first commit in master
```

# hotfix/we_gonna_die commits

```bash
44a6633 (HEAD -> hotfix/we_gonna_die) Commit in hotfix/we_gonna_die
843745e (master) The second commit in master
95f1fa8 The first commit in master
```

## Additional commit in hotfix/we_gonna_die for cherry-pick later

#history

```bash
  246  touch additional.txt
  247  git add --all
  248  git commit -m
  249  git commit -m "Additional commit in hotfix/we_gonna_die"
  250  git log --oneline
  251  git checkout master
  252  git log --oneline
  253  git checkout hotfix/we_gonna_die
  254  git log --oneline
  255  git checkout master
  256  git cherry-pick 5c2ba29
  257  git log --oneline
```

#Commits in hotfix/we_gonna_die

```bash
5c2ba29 (HEAD -> hotfix/we_gonna_die) Additional commit in hotfix/we_gonna_die
44a6633 Commit in hotfix/we_gonna_die
843745e The second commit in master
95f1fa8 The first commit in master
```

#Commits in master

```bash
9219d87 (HEAD -> master) Additional commit in hotfix/we_gonna_die
17b00f2 (features/do_one, dev) Merge branch 'hotfix/we_gonna_die'
44a6633 Commit in hotfix/we_gonna_die
fb87457 Commit in features/do_one
e79845f The second commit in dev
f1c4aa3 The first commit in dev
843745e The second commit in master
95f1fa8 The first commit in master
```
