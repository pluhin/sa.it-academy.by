# 02.GIT.Local
[Hometask](https://github.com/pluhin/sa.it-academy.by/wiki/02.-GIT.-Local)
>From the task, i created a local repository in which i placed folders and subfolder whithin files according to the branches.
```bash  
 1780  cd local_repository/
 1781  git init
 1782  mkdir master
 1783  cd master/
 1784  nano .getkeep
 1785  git add --all
 1786  git commit -m "Initialized directory for pord"
 1787  nano project.app
 1788  git add --all
 1789  git commit "Deploy app in master branch"
 1790  git commit -m "Deploy app in master branch"
 1791  git log --oneline 
 1792  cd ../
```

>After this steps we created main repository and main app in prod, now we have 2 commits in master

```bash
 1793  git checkout -b dev
 1794  mkdir dev
 1795  cd dev/
 1796  nano .getkeep
 1797  git add --all
 1798  git commit -m "Initialized directory to dev"
 1799  nano project_dev.app
 1800  git add --all 
 1801  git commit -m "Create additional dev development"
 1802  git log --oneline 
   
```
> After this steps we created new branch from master and  created additional 2 commits and created folder to devz, now we have 2 commits from master+2commits from dev
 
```bash
 1803  git checkout -b features/do_one
 1804  mkdir features
 1805  cd features/
 1806  mkdir do_one
 1807  cd do_one/
 1808  nano dev_features.app
 1809  git add --all 
 1810  git commit -m "Created development"
 1811  git log --oneline  
```

>After this steps we created from dev new branch and created feature development, now we have 2 commits from master
>2 commits from dev and +1 commit in current branch and switch to master branch 

```bash
 1812  git checkout master 
 1813  cd ../
 1814  git branch 
 1815  git checkout -b hotfix/we_gonna_die
 1816  mkdir hotfix
 1817  cd hotfix/
 1818  mkdir we_gonna_die
 1819  cd we_gonna_die/
 1820  nano project_dev.app
 1821  cat /home/dkeldanovich/local_repository/master/project.app>> /home/dkeldanovich/local_repository/hotfix/we_gonna_die/project_dev.app
 1822  nano project_dev.app 
 1823  git status
 1824  git add --alll
 1825  git add --all
 1826  git commit -m "Created some fixes"
 1827  git log --oneline 
```

>After this steps we add from master new branc hotfix with directory "we_gonna_die" and fix.json file. Now we have 2 commits from master
> and additional commit from current branch

# Try to play first task
```bash
 1828  git checkout master 
 1829  cd ../
 1830  git merge features/do_one
 1831  git log --oneline >1_master.txt
 1832  git checkout dev
 1833  git log --oneline >1_dev.txt
 1834  git checkout features/do_one 
 1835  git log --oneline >1_feat.txt
 1836  git checkout hotfix/we_gonna_die
 1837  git log --oneline >1_hotfix.tx 
```
>Now we merged master branch with feature/do_one
>We have that logs

### Master
```bash
89d1c3b Created development
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord

```
### Dev

```bash
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord
```

### Features/do_one

```bash
89d1c3b Created development
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord

```
### Hotfix/we_gonna_die

```bash
2e633c3 Created some fixes
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord

```

# Try to play the second play

```bash

 1838  git checkout master 
 1839  git cherry-pick hotfix/we_gonna_die
 1840  git checkout dev
 1841  git log --oneline 
 1842  git rebase master 
 1843  git log --oneline 
 1844  git log --oneline>2_dev.txt
 1845  git checkout master
 1846  git log --oneline>2_master.txt
 1847  git checkout features/do_one 
 1848  git log --oneline>2_feature.txt
 1849  git checkout hotfix/we_gonna_die 
 1850  git log --oneline>2_hot.txt

```

>Now we did the second play and geted thats logs

### Master
```bash

849d1f4 Created some fixes
89d1c3b Created development
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord


```

### Dev
```bash

849d1f4 Created some fixes
89d1c3b Created development
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord

```

### Features/do_one

```bash
89d1c3b Created development
99a3d79 Create additional dev development
eab6a82 Initialized directory to dev
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord
```

### Hotfix/we_gonna_die

```bash

2e633c3 Created some fixes
dbb18dc Deploy app in master branch
5a3883c Initialized directory for pord

```

**_Now after rebase dev baranche we can see master and dev branches received all commits. Hotfix and Fetures/do_one merged with master branch and closed _ **
