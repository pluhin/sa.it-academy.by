# 02.Git.Local
  
## Commands
  
```bash
  git init
  git config user.name "Dzmitry Kurlenka"
  git config user.email "elnik@bk.ru"
  date > first.txt
  vim .gitignore
  git status
  git add --all
  git commit -m "First commit"
  git log --oneline
  date > second.txt
  git status
  git add --all
  git commit -m "Commit second"
  git checkout -b dev
  git branch
  git log --oneline
  date > Third.txt
  git add --all
  git commit -m "Commit to dev branch"
  date > Fourth.txt
  git add --all
  git commit -m "Second Commit to dev branch"
  git log --oneline
  git checkout -b features/do_one
  git log --oneline
  date > Fifth.txt
  git add --all
  git commit -m "Commit to features/do_one branch"
  git log --oneline
  git checkout master
  git checkout -b hotfix/we_gonna_die
  date > Sixth.txt
  git add --all
  git commit -m "Commit to hotfix/we_gonna_die branch"
  git log --oneline
```

  
### Merge

```bash 
   git checkout master
   git merge dev
   git merge features/do_one
   git log --oneline
   git checkout master 
   git checkout hotfix/we_gonna_die 
   git log --oneline
```

## LOGS 
    
### master

```bash
  dd79b81 (HEAD -> master) Commit to features/do_one branch
  0ec26cc Second Commit to dev branch
  4e92da9 Commit to dev branch
  6112b17 (hotfix/we_gonna_die) Commit to hotfix/we_gonna_die branch
  d71717a Commit second
  829b95d First commit

```

### dev

```bash
	fc7b3b4 (HEAD -> dev) Second Commit to dev branch
	e24bf02 Commit to dev branch
	6112b17 (hotfix/we_gonna_die) Commit to hotfix/we_gonna_die branch
	d71717a Commit second
	829b95d First commit

```

### features/do_one

```bash
  fada17c (HEAD -> features/do_one) Commit to features/do_one branch
  8309dac Second Commit to dev branch
  6719547 Commit to dev branch
  6112b17 (hotfix/we_gonna_die) Commit to hotfix/we_gonna_die branch
  d71717a Commit second
  829b95d First commit

```
  
### hotfix/we_gonna_die

```bash
  
  6112b17 (HEAD -> hotfix/we_gonna_die) Commit to hotfix/we_gonna_die branch
  d71717a (master) Commit second
  829b95d First commit

```
