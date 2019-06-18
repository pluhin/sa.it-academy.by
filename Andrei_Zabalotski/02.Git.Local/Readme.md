## 02 Git.Local
```bash
   27  cd A.Zabalotski
   28  mkdir 02.Git
   29  cd 02.Git
   30  mkdir project
   31  cd project
   32  git init
   33  ls -la
   34  git config --user.name "Andrei Zabalotski"
   35  git config --local user.name "Andrei Zabalotski"
   36  git config --local user.email "A.Zabalotski@gmail.com"
   37  nano .git/config
   38  git config --list
   39  git branch
   40  date > file.txt
   41  git status
   42  date > file2.txt
   43  git status
   44  git add file.txt
   45  git status
   46  git commit -m "Init commit 1"
   47  git log --oneline
   48  git add file2.txt
   49  git commit -m "Init commit 2"
   50  git log --oneline
   51  git branch
   52  git checkout -b dev
   53  git branch
   54  date > filedev.txt
   55  date > filedev2.txt
   56  git add filedev.txt
   57  git commit -m "Dev branch 1"
   58  git add filedev2.txt
   59  git commit -m "Dev branch 2"
   60  git log --oneline
   61  git branch
   62  git checkout -b features/do_one
   63  git log --oneline
   64  git branch
   65  date > add filefeatures.txt
   66  date > filefeatures.txt
   67  git add filefeatures.txt
   68  git commit -m "Features branch commit"
   69  git branch
   70  git log --oneline
   71  git checkout master
   72  git branch
   73  git checkout -b hotfix/we_gonna_die
   74  date > filehotfix.txt
   75  git add filehotfix.txt
   76  git log --oneline
   77  git checkout -dev
   78  git checkout dev
   79  git log --oneline
   80  git checkout features/do_one
   81  git log --oneline
   82  git branch
   83  git 
   84  git log --oneline
   85  git checkout master
   86  git log --oneline
   87  git branch
   88  git checkout dev
   90  git log --oneline
   91  git checkout master
   92  git log --oneline
   93  git checkout dev
   94  git log --oneline
   95  git checkout features/do_one
   96  git log --oneline
   97  git checkout hotfix/we_gonna_die
   98  git log --oneline
   99  git checkout dev
  100  git merge features/do_one
  101  git checkout master
  102  git merge dev
  103  git log --oneline
  104  history
  105  date > merge.txt
  106  git add -merge.txt
  107  git add merge.txt
  108  git commit -m "MERGE"
  109  history
```

