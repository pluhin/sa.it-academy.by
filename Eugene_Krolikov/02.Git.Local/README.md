# 02.Git.Local

## List of commands

```bash
    1  pwd
    2  mkdir 02.GIT
    3  ls
    4  cd 02.GIT/
    5  ls
    6  ls -ll
    7  git --version
    8  git init
    9  ls -la
   10  vim .git/config 
   11  git config user.name "Eugene Krolikov"
   12  git config user.email "krolikov@bankdabrabyt.by"
   13  cat .git/config 
   14  git status
   15  date > first.txt
   16  cat first.txt 
   17  git status
   18  git checkout
   19  git checkout -h
   20  git branch -a
   21  pwd
   22  cd ..
   23  pwd
   24  git clone https://github.com/evkenny/sa.it-academy.by.git
   25  git -c http.sslVerify=false clone https://github.com/evkenny/sa.it-academy.by.git
   26  git branch -a
   27  ls -l 
   28  cd sa.it-academy.by
   29  ls -l
   30  ls -ll
   31  git branch -a
   32  git checkout md-sa2-23-23
   33  mkdir evkenny
   34  ls -ll
   35  ls -ll
   36  mkdir Eugene_Krolikov
   37  ls -ll
   38  cd Eugene_Krolikov/
   39  mkdir 02.Git.Local
   40  ls -ll
   41  cd 02.Git.Local/
   42  ls -ll
   43  cd ..
   44  cd ..
   45  ls -l
   46  cd ..
   47  cd 02.GIT/
   48  ls -l
   49  ls -ll
   50  history
   51  git log --oneline
   52  git log 
   53  ls -ll
   54  git status
   55  git commit --amend -a
   56  git log
   57  date > first.txt
   58  git log
   59  git add first.txt 
   60  git log
   61  git status
   62  date >> first.txt
   63  git status
   64  git commit --amend -a
   65  git branch
   66  git branch -a
   67  pwd
   68  git checkout -b test1
   69  date > test2file.txt
   70  git add --all
   71  git commit -m "comm in test1"
   72  git checkout master
   73  git commit -m "comm in master"
   74  git status
   75  git checkout test1
   76  git checkout master
   77  git branch
   78  git log --oneline
   79  git checkout master
   80  pwd
   81  cd ..
   82  cd 02.GIT/
   83  cd ..
   84  rm 02.GIT/
   85  rm -d 02.GIT/.git/
   86  rm -r 02.GIT
   87  ls
   88  mkdir 02.GIT
   89  cd 02.GIT/
   90  git init
   91  git config user.name "Eugene Krolikov"
   92  git config user.email "krolikov@bankdabrabyt.by"
   93  date > firstinmaster.txt
   94  cat firstinmaster.txt 
   95  git status
   96  git add --all
   97  git status
   98  git log
   99  git commit -m "first in master"
  100  git log
  101  date >> firstinmaster.txt
  102  git commit --amend -a
  103  git log --oneline
  104  git branch
  105  git checkout -b test1
  106  git branch
  107  git checkout master
  108  git branch
  109  git checkout test1
  110  git branch
  111  date > secondintest1.txt
  112     54  
  113     54
  114  git add --all
  115  git commit -m "second in test1"
  116  git log --oneline
  117  git checkout master
  118  git log --oneline
  119  git merge test1
  120  git status
  121  pwd
  122  ls
  123  e:
  124  cd e:\office
  125  cd GIT/
  126  ls
  127  mkdir 02.GIT
  128  ls
  129  cd 02.GIT/
  130  git init
  131  git config user.name "Eugene Krolikov"
  132  git config user.email "krolikov@bankdabrabyt.by"
  133  date > firstinmaster.txt
  134  cat firstinmaster.txt
  135  git status
  136  git add --all
  137  git status
  138  git log
  139  git commit -m "first in master"
  140  git log
  141  date >> firstinmaster.txt
  142  git commit --amend -a
  143  git log --oneline
  144  git branch
  145  git checkout -b test_br1
  146  git branch
  147  git checkout master
  148  git branch
  149  git checkout test_br1
  150  git branch
  151  date > secondintest1.txt
  152  git add --all
  153  git commit -m "second in test1"
  154  git log --oneline
  155  git checkout master
  156  git log --oneline
  157  git merge test_br1
  158  git status
  159  git checkout -b dev
  160  date > devfile.txt
  161  git add --all
  162  git commit -m "First dev commit!"
  163  date > devfile.txt
  164  date >> devfile.txt
  165  git commit -m "Second dev commit!"
  166  git add --all
  167  cat devfile.txt 
  168  git commit -m "Second dev commit!"
  169  git log --oneline
  170  git checkout -b features/do_one
  171  git log --oneline
  172  date >> featfile.txt
  173  git add featfile.txt 
  174  git commit -m "First features/do_one commit!"
  175  git checkout -b hotfix/we_gonna_die
  176  git branch
  177  git log --oneline
  178  ls
  179  vi firstinmaster.txt 
  180  git log --oneline
  181  git status
  182  git commit -m "First hotfix/we_gonna_die commit!"
  183  git add firstinmaster.txt 
  184  git commit -m "First hotfix/we_gonna_die commit!"
  185  git log --oneline
  186  git switch master
  187  git rebase features/do_one
  188  git log --oneline
  189  git switch dev
  190  git rebase hotfix/we_gonna_die
  191  git switch features/do_one
  192  git rebase hotfix/we_gonna_die
  193  git log --oneline
  194  git branch
  195  git switch master
  196  git status
  197  history > README.md
```

## List of commits

### master (init branch)

```sh
5bcf8c5 (HEAD -> master) second in test1
2abfe35 first in master
```

### dev (has been created from master)

```sh
f3effec (HEAD -> dev) Second dev commit!
6e0bc92 First dev commit!
5bcf8c5 (test_br1, master) second in test1
2abfe35 first in master
```

### features/do_one (has been created from dev branch)

```sh
f3effec (HEAD -> features/do_one, dev) Second dev commit!
6e0bc92 First dev commit!
5bcf8c5 (test_br1, master) second in test1
2abfe35 first in master
```

### hotfix/we_gonna_die (has been created from master branch)
```sh
cd0ff6e (HEAD -> hotfix/we_gonna_die, features/do_one) First features/do_one commit!
f3effec (dev) Second dev commit!
6e0bc92 First dev commit!
5bcf8c5 (test_br1, master) second in test1
2abfe35 first in master
```

