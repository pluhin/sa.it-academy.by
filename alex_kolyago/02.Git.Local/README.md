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
   65  git log --oneline
   66  cat file.txt
   67  git checkout master
   68  git log --oneline
   69  git checkout dev
   70  git checkout -b features/do_one
   71  git branch -a
   72  git log --oneline
   73  cat file.txt
   74  date >> file.txt
   75  cat file.txt
   76  git add --all
   77  git status
   78  git commit -m "first additional in features/do_one commit"
   79  git log --oneline
   80  cat file.txt
   81  git checkout dev
   82  cat file.txt
   83  git log --oneline
   84  git checkout master
   85  cat file.txt
   86  git log --oneline
   87  git checkout -b hotfix/we_gonna_die
   88  cat file.txt
   89  date >> file.txt
   90  git add --all
   91  git status
   92  git commit -m "first add in hotfix/we_gonna_die commit"
   93  cat file.txt
   94  git checkout master
   95  cat file.txt
   96  git rebase -i dev
   98  cat file.txt
   99  git log --oneline
  100  git rebase -i features/do_one
  101  git log --oneline
  102  git checkout hotfix/we_gonna_die
  103  git log --oneline
  104  git checkout master
  105  git cherry-pick e24a293
  106  git status
  107  cat file.txt
  108  git add --all
  109  cat file.txt
  110  git status
  111  git log --oneline
  112  git checkout dev
  113  git commit -m "hotfix_deploy in master commit"
  114  cat file.txt
  115  git checkout dev
  117  cat file.txt
  118  git cherry-pick e24a293
  119  git add --all
  120  git commit -m "hotfix_deploy in dev commit"
  121  cat file.txt
  122  git checkout features/do_one
  123  git cherry-pick e24a293
  124  git add --all
  125  git commit -m "hotfix_deploy in features/do_one commit"
  126  cat file.txt

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