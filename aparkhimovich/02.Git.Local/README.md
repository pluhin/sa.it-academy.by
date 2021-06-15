# Git Local 
```bash
   28  git config --global user.name "aparkhimovich"
   29  git config --global user.email "pal@nces.by"
   30  git clone https://github.com/aparkhimovich/sa.it-academy.by.git
   31  cd sa.it-academy.by/
   32  git branch 
   33  git branch -a
   34  git checkout md-sa2-17-21 
   35  cd aparkhimovich/
   36  cd 02.Git.Local/
   37  git init
   38  date > master_file1.txt
   39  cat master_file1.txt 
   40  git status master_file1.txt 
   41  git add master_file1.txt
   42  git commit -m "master_commit1"
   43  date > master_file2.txt 
   44  git add master_file2.txt 
   45  git commit -m "master_commit1"
   46  git commit --amend -m "master_commit2"
   47  git checkout -b dev
   48  git log --oneline
   49  git status
   50  echo "dev_commit1" > dev_file1.txt
   51  git add dev_file1.txt 
   52  git commit -m "dev_commit1";
   53  echo "dev_commit2" > dev_file2.txt
   54  git add dev_file2.txt 
   55  git commit dev_file2.txt -m "dev_commit2"
   56  git log
   57  git checkout -b features/do_one
   58  git status
   59  echo "features/do_one_commit1" > features/do_one_file1.txt
   60  echo "features/do_one_commit1" > features_do_one_file1.txt
   61  git add features_do_one_file1.txt 
   62  git commit -m "features/do_one_commit1"
   63  git checkout master
   64  git checkout -b hotfix/we_gonna_die
   65  echo "hotfix/we_gonna_dieadditional_commit1
   66  echo "hotfix/we_gonna_dieadditional_commit1" > hotfix/we_gonna_die
   67  echo "hotfix/we_gonna_dieadditional_commit1" > hotfix_we_gonna_die.txt
   68  git add hotfix_we_gonna_die.txt 
   69  git add commit -m "hotfix/we_gonna_die_add_commit1"
   70  git commit -m "hotfix/we_gonna_die_add_commit1"
   71  git checkout features/do_one 
   72  git log -oneline
   73  git log --oneline
   74  git checkout master
   75  git rebase -i b4b61e1
   76  git log --oneline
   77  git checkout hotfix/we_gonna_die 
   78  git log --oneline
   79  git checkout master
   80  git cherry-pick 4a55d03
   81  git checkout dev
   82  git cherry-pick 4a55d03
   83  git checkout features/do_one
   84  git cherry-pick 4a55d03
   85  git checkout master
   86  git log
   87  git log --oneline
   88  git checkout dev
   89  git log --oneline
   90  git checkout features/do_one 
   91  git log --oneline
   92  git checkout hotfix/we_gonna_die 
   93  git log --oneline 
   94  history > history.txt 
```
# master branch
```bash
$ git log --oneline
e1b5dc9 (HEAD -> master) hotfix/we_gonna_die_add_commit1
b4b61e1 features/do_one_commit1
88f7056 dev_commit2
e9ae722 dev_commit1
b03c9e1 master_commit2
3bc5222 master_commit1
```

# dev branch
```bash
$ git log --oneline
97965b8 (HEAD -> dev) hotfix/we_gonna_die_add_commit1
88f7056 dev_commit2
e9ae722 dev_commit1
b03c9e1 master_commit2
3bc5222 master_commit1
```

# features/do_one branch
```bash
$ git log --oneline
c2edd66 (HEAD -> features/do_one) hotfix/we_gonna_die_add_commit1
b4b61e1 features/do_one_commit1
88f7056 dev_commit2
e9ae722 dev_commit1
b03c9e1 master_commit2
3bc5222 master_commit1
```


# hotfix/we_gonna_die
```bash
$ git log --oneline
4a55d03 (HEAD -> hotfix/we_gonna_die) hotfix/we_gonna_die_add_commit1
b03c9e1 master_commit2
3bc5222 master_commit1
```
