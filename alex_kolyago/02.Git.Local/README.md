# Git Local 
```bash
    6  git init
    7  ls -la
    8  ls -l .git
    9  cat .git/config
   10  git config --list
   11  git config --global user.name "Alex Kolyago"
   12  git config --global user.email  "aleksey.kolyago.97@mail.ru"
   13  git config --list
   14  git config user.name "Alex Kolyago"
   15  git config user.email  "aleksey.kolyago.97@mail.ru"
   16  git config --list
   17  nano .gitignore
   18  git status
   19  touch file.txt
   20  date > file.txt
   21  git status
   22  git add --all
   23  git status
   24  git config core.autocrlf true
   25  git commit -m "init commit"
   26  git log --oneline
   27  git branch -a
   28  cat file.txt
   29  date >> file.txt
   30  cat file.txt
   31  git log --oneline
   32  git status
   33  git add --all
   34  git status
   35  git commit -m "2 in master commit"
   36  git log --oneline
   37  git checkout -b dev
   38  git branch -a
   39  git log --oneline
   40  ls -a
   41  cat file.txt
   42  date >> file.txt
   43  cat file.txt
   44  git checkout master
   45  cat file.txt
   46* git checkout
   47  cat file.txt
   48  git add --all
   49  git status
   50  git commit -m "first additional in dev commit"
   51  ls -l
   52  cat file.txt
   53  git checkout master
   54  ls -l
   55  cat file.txt
   56  git add --all
   57  git log --oneline
   58  git checkout dev
   59  git log --oneline
   60  date >> file.txt
   61  cat file.txt
   62  git add --all
   63  git status
   64  git commit -m "second additional in dev commit"
   75  git log --oneline
   76  cat file.txt
   77  git checkout master
   78  git log --oneline
   79  git checkout dev
   80  git checkout -b features/do_one
   81  git branch -a
   82  git log --oneline
   83  cat file.txt
   84  date >> file.txt
   85  cat file.txt
   86  git add --all
   87  git status
   88  git commit -m "first additional in features/do_one commit"
   89  git log --oneline
   90  cat file.txt
   91  git checkout dev
   92  cat file.txt
   93  git log --oneline
   94  git checkout master
   95  cat file.txt
   96  git log --oneline
   97  git checkout -b hotfix/we_gonna_die
   98  cat file.txt
   99  date >> file.txt
  100  git add --all
  101  git status
  102  git commit -m "first add in hotfix/we_gonna_die commit"
  103  cat file.txt
  104  git checkout master
  105  cat file.txt
  106  git rebase -i dev
  108  cat file.txt
  109  git log --oneline
  110  git rebase -i features/do_one
  111  git log --oneline
  112  git checkout hotfix/we_gonna_die
  113  git log --oneline
  114  git checkout master
  115  git cherry-pick e24a293
  116  git status
  117  cat file.txt
  118  git add --all
  119  cat file.txt
  120  git status
  121  git log --oneline
  122  git checkout dev
  123  git commit -m "hotfix_deploy in master commit"
  124  cat file.txt
  125  git checkout dev
  127  cat file.txt
  128  git cherry-pick e24a293
  129  git add --all
  130  git commit -m "hotfix_deploy in dev commit"
  131  cat file.txt
  132  git checkout features/do_one
  133  git cherry-pick e24a293
  134  git add --all
  135  git commit -m "hotfix_deploy in features/do_one commit"
  136  cat file.txt

```

# master branch
```git
8032336 (HEAD -> master) hotfix_deploy in master commit
f725e78 first additional in features/do_one commit
acb4b67 second additional in dev commit
14832a3 first additional in dev commit
7a3acbd 2 in master commit
525592b init commit
```

# dev branch
```git
bdca659 (HEAD -> dev) hotfix_deploy in dev commit
acb4b67 second additional in dev commit
14832a3 first additional in dev commit
7a3acbd 2 in master commit
525592b init commit
```

# features/do_one branch
```git
4f150ef (HEAD -> features/do_one) hotfix_deploy in features/do_one commit
f725e78 first additional in features/do_one commit
acb4b67 second additional in dev commit
14832a3 first additional in dev commit
7a3acbd 2 in master commit
525592b init commit
```

# hotfix/we_gonna_die branch
```git
e24a293 (HEAD -> hotfix/we_gonna_die) first add in hotfix/we_gonna_die commit
7a3acbd 2 in master commit
525592b init commit
```