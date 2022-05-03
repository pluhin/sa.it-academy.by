## 02.Git.Local
 
 ```
 40  mkdir 02.Git.Local
   41  cd 02.Git.Local/
   42  ll
   43  git init
   44  touch file1.txt
   45  git add .
   50  git commit -m "Init commit"
   51  git status
   52  ll
   53  touch file2.txt
   54  git status
   55  git add .
   56  git commit -m "Second commit in master"
   57  git log -oneline
   58  git log --oneline
   59  git checkout -b dev
   60  git log --oneline
   61  ll
   62  touch file3.txt
   63  git add .
   64  git commit -m "First commit in dev"
   65  touch file4.txt
   66  git add .
   67  git commit -m "Second commit in dev"
   68  git log --oneline
   69  git checkout -b features/do_one
   70  git log --oneline
   71  touch file5.txt
   72  git add .
   73  git commit -m "First commit in features/do_one"
   74  fit status
   75  git status
   76  git log --oneline
   77  git checkout -b master
   78  git checkout master
   79  ll
   80  git log --oneline
   81  git checkout -b hotfix/we_gonna_die
   82  ll
   83  git log --oneline
   84  touch file6.txt
   85  add .
   86  git add .
   87  git commit -m "First commit in hotfix/we_gonna_die"
   88  ll
   89  git log --oneline
   90  git checkout master
   91  git log --oneline
   92  git branch
   93  git merge features/do_one
   94  git log --oneline
   95  git checkout hotfix/we_gonna_die
   96  git log --oneline
   97  git checkout master
   98  git cherry-pick hotfix/we_gonna_die
   99  git log --oneline
  100  git checkout dev
  101  git cherry-pick hotfix/we_gonna_die
  102  git checkout features/do_one
  103  git cherry-pick hotfix/we_gonna_die
  104  git checkout master
  105  git log --oneline
  106  git checkout dev
  107  git log --oneline
  108  git checkout features/do_one
  109  git log --oneline
  110  git checkout hotfix/we_gonna_die
  111  git log --oneline
  112  history
```
## Commits

# master
```
955e4be (HEAD -> master) First commit in hotfix/we_gonna_die
f65fcdb First commit in features/do_one
036a122 Second commit in dev
bad7619 First commit in dev
5cc6d4e Second commit in master
7642c52 Init commit
```
# dev 
```
a577eb8 (HEAD -> dev) First commit in hotfix/we_gonna_die
036a122 Second commit in dev
bad7619 First commit in dev
5cc6d4e Second commit in master
7642c52 Init commit
```
# features/do_one
```
b3135b0 (HEAD -> features/do_one) First commit in hotfix/we_gonna_die
f65fcdb First commit in features/do_one
036a122 Second commit in dev
bad7619 First commit in dev
5cc6d4e Second commit in master
7642c52 Init commit
```
# hotfix/we_gonna_die
```
4e5e1cf (HEAD -> hotfix/we_gonna_die) First commit in hotfix/we_gonna_die
5cc6d4e Second commit in master
7642c52 Init commit
```
