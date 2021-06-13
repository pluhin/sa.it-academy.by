# Git.Local

```bash
  162  pwd
  163  mkdir Work
  164  cd Work/
  165  git clone https://github.com/astarosh87/sa.it-academy.by.git
  166  cd sa.it-academy.by/
  167  la
  168  cd .git/
  169  la
  170  cd ..
  171  ls -la
  172  mkdir vsinyavski
  173  cd vsinyavski/
  174  mkdir 02.Git.Local
  175  cd 02.Git.Local/
  176  git init
  177  git status
  178  date > currentdate_master.txt
  179  git add --all
  180  git status
  181  git commit -m "first master commit"
  182  git config user.name "Vitaly Sinyavski"
  183  git config user.email "als.brodeur@gmail.com"
  184  git commit -m "first master commit"
  185  date > currentdate_master2.txt
  186  git add --all
  187  git commit -m "second master commit"
  188  git log --oneline 
  189  git checkout -b dev
  190  date > currentdate_dev.txt
  191  git add --all
  192  git commit -m "first additional commit in dev branch"
  193  date > currentdate_dev2.txt
  194  git add --all
  195  git commit -m "second additional commit in dev branch"
  196  git log --oneline 
  197  git status 
  198  git checkout -b features/do_one
  199  date > currentdate_features.txt
  200  git add --all
  201  git commit -m "only one additional commit in features branch"
  202  git log --oneline 
  203  git checkout master 
  204  git checkout -b hotfix/we_gonna_die
  205  date > currentdate_hotfix.txt
  206  git add --all
  207  git commit -m "only one additional commit in hotfix branch"
  208  git log --oneline 
  209  git checkout master #Release started
  210  git merge features/do_one 
  211  git log --oneline 
  212  git checkout hotfix/we_gonna_die  #Hotfix
  213  git log --oneline 
  214  git checkout master 
  215  git cherry-pick 94b2a37
  216  git checkout dev 
  217  git cherry-pick 94b2a37
  218  git checkout features/do_one 
  219  git cherry-pick 94b2a37
  220  git log --oneline 
  221  git checkout hotfix/we_gonna_die 
  222  git log --oneline 
  223  git checkout dev 
  224  git log --oneline 
  225  git checkout master 
  226  git log --oneline 
  227  history
```

---

# Master branch

```bash
f5096b9 (HEAD -> master) only one additional commit in hotfix branch
3191e2c only one additional commit in features branch
0af47d5 second additional commit in dev branch
d48de1c first additional commit in dev branch
6217ba2 second master commit
2c43cb4 first master commit
```

---

# Dev branch

```bash
f2e4119 (HEAD -> dev) only one additional commit in hotfix branch
0af47d5 second additional commit in dev branch
d48de1c first additional commit in dev branch
6217ba2 second master commit
2c43cb4 first master commit
```

---

# features/do_one branch

```bash
d6664b4 (HEAD -> features/do_one) only one additional commit in hotfix branch
3191e2c only one additional commit in features branch
0af47d5 second additional commit in dev branch
d48de1c first additional commit in dev branch
6217ba2 second master commit
2c43cb4 first master commit
```

---

# hotfix/we_gonna_die branch

```bash
94b2a37 (HEAD -> hotfix/we_gonna_die) only one additional commit in hotfix branch
6217ba2 second master commit
2c43cb4 first master commit
```

