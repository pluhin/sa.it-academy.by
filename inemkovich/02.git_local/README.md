# Git Local 
```bash
   35  mkdir sa.it-academy.by
   36  cd sa.it-academy.by
   37  mkdir 02.git_local
   38  cd 02.git_local
   39  git init
   40  history
   41  date > date_master_1.txt
   42  cat date_master_1.txt
   43  git status
   44  git add date_master_1.txt
   45  git commit -m "first commit at master branch"
   46  git config --global user.email "to.nemkovich@gmail.com"
   47  git config --global user.name "Igor Nemkovich"
   48  git commit -m "first commit at master branch"
   49  ps > ps_master_2.txt
   50  git status
   51  git add ps_master_2.txt
   52  git commit -m "second commit in master branch"
   53  git checkout -b dev
   54  git log --oneline
   55  echo "1st commit in dev branch" > dev_1.txt
   56  git status
   57  git add dev_1.txt
   58  git commit -m "1st commit in dev branch"
   59  echo "2nd commit in dev branch" > dev_2.txt
   60  git add dev_2.txt
   61  git commit -m "2nd commit in dev branch"
   62  git checkout -b features/do_one
   63  git log
   64  git log --oneline
   65  echo "1st commit in features/do_one branch" > features_1.txt
   66  git add features_1.txt
   67  git commit -m "1st commit in features/do_one branch" 
   68  git checkout master
   69  git checkout -b hotfix/we_gonna_die
   70  git log --oneline
   71  echo "additional commit" > hotfix.txt
   72  git status
   73  git add hotfix.txt
   74  git commit -m "additional commit in hotfix branch"
   75  git checkout features/do_one
   76  git log --oneline
   77  git checkout master
   78  git rebase -i f58f2d9
   79  git log --oneline
   80  git checkout hotfix/we_gonna_die
   81  git log --oneline
   82  git checkout master
   83  git cherry-pick 69ad852
   84  git checkout dev
   85  git cherry-pick 69ad852
   86  git log --oneline
   87  git checkout features/do_one
   88  git cherry-pick 69ad852
```

# master branch
```git
99641ae (HEAD -> master) additional commit in hotfix branch
f58f2d9 1st commit in features/do_one branch
cdc629d 2nd commit in dev branch
86f1bdc 1st commit in dev branch
b1937f2 second commit in master branch
7c420d5 first commit at master branch
```

# dev branch
```git
23a8a89 (HEAD -> dev) additional commit in hotfix branch
cdc629d 2nd commit in dev branch
86f1bdc 1st commit in dev branch
b1937f2 second commit in master branch
7c420d5 first commit at master branch
```

# features/do_one branch
```git
926fa5e (HEAD -> features/do_one) additional commit in hotfix branch
f58f2d9 1st commit in features/do_one branch
cdc629d 2nd commit in dev branch
86f1bdc 1st commit in dev branch
b1937f2 second commit in master branch
7c420d5 first commit at master branch
```

# hotfix/we_gonna_die branch
```git
69ad852 (HEAD -> hotfix/we_gonna_die) additional commit in hotfix branch
b1937f2 second commit in master branch
7c420d5 first commit at master branch
```
