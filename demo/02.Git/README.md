# 02.Git

```bash
   6  mkdir 02.GIT
    7  cd 02
    8  cd 02.GIT/
    9  ls
   10  git
   11  clear
   12  git --version
   13  gut init
   14  guit init
   15  git init
   16  ls -la
   17  vim .git/config
   18  clear
   19  git config user.name "Siarhei P"
   20  git config user.email "pluhin@gmail.com"
   21  vim .git/config
   22  date > first.txt
   23  ls -la
   24  git status
   25  vim .gitignore
   26  git status
   27  touch text.log
   28  git status
   29  ls -la
   30  git add --all
   31  git status
   32  git commit -m "First commit"
   33  git log --oneline
   34  git log
   35  date >> first.txt
   36  cat first.txt
   37  git status
   38  git commit --amend -a
   39  sudo update-alternatives --config editor
   40  git commit --amend -a
   41  git log --oneline
   42  clear
   43  git branch
   44  git checkout -b test
   45  git branch
   46  git log --oneline
   47  git checkout master
   48  git branch
   49  git branch -D test
   50  git branch
   51  git checkout -b second
   52  date > second.txt
   53  ls -la
   54  git add --all
   55  git commit -m "Commit to second branch"
   56  git log --oneline
   57  git checkout master
   58  git log --oneline
   59  git merge second
   60  git log --oneline
   61  git branch
   62  ls -la
   63  git checkout second
   64  vim first.txt
   65  git add --all
   66  git commit -m "conflict file in second"
   67  git checkout master
   68  vim first.txt
   69  git add --all
   70  git commit -m "conflict file in main"
   71  git checkout second
   72  git rebase master
   73  vim first.txt
   74  git add first.txt
   75  git rebase --continue
   76  git log --oneline
   77  git rebase --continue
   78  git checkout master
   79  git merge second
   80  vim first.txt
   81  git add --all
   82  git commit -m "fix"
   83  git checkout master
   84  git checkout second
   85  git rebase master
   86  git checkout master
   87  vim second.txt
   88  git add --all
   89  git commit -m "conflict master"
   90  git checkout second
   91  vim second.txt
   92  git add --all
   93  git commit -m "conflict second"
   94  git rebase master
   95  git rebase --abort
   96  git rebase master
   97  git log --oneline
   98  vim second.txt
   99  git checkout master
  100  ls
  101  git log --oneline
  102  vim second.txt
  103  git add --all
  104  git commit -m "conflict master 2"
  105  git checkout second
  106  vim second.txt
  107  git add --all
  108  git commit -m "sonflict second 2"
  109  git rebase master
  110  vim second.txt
  111  git add second.txt
  112  git rebase --continue
  113  git add --all
  114  git rebase --continue
  115  git rebase --abort
  116  git rebase master
  117  vim second.txt
  118  git add --all
  119  git rebase --continue
  120  git rebase --abort
  121  git checkout
  122  git checkout master
  123  git rebase second
  124  vim second.txt
  125  git add second.txt
  126  git rebase --continue
  127  git add --all
  128  git status
  129  git rebase --continue
  130  git rebase --skip
  131  git status
  132  git merge second
  133  git checkout second
  134  git merge master
  135  cat second.txt
  136  git log --oneline
  137  git checkout 05d5cb7
  138  git status
  139  ls -l
  140  git tag -a R1.01 -m "First release"
  141  git checkout master
  142  git checkout R1.01
  143  history
```