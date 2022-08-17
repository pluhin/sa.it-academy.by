## Git local

History

```bash
    1  clear
    2  sudo apt update
    3  sudo apt install git vim
    4  mkdir 02.Git
    5  cd 02.Git/
    6  ls -
    7  ls -la
    8  clear
    9  git --version
   10  git init
   11  ls -la
   12  git status
   13  vim .git/config
   14  sudo apt intall autocomplete
   15  sudo apt install autocomplete
   16  sudo apt install bash-autocomplete
   17  sudo apt install bash-competion
   18  sudo apt install bash-completion
   19  cd  02.Git/
   20  ls
   21  git config user.name "Siarhei P"
   22  git config user.email "pluhin@gmail.com"
   23  vim .git/config
   24  ls -l
   25  date > first.txt
   26  cat first.txt
   27  git status
   28  vim .gitignore
   29  git status
   30  touch .env
   31  git status
   32  vim .gitignore
   33  git status
   34  vim .gitignore
   35  git status
   36  git add --all
   37  git status
   38  git commit -m "Init commit"
   39  git log --oneline
   40  git log
   41  date >> first.txt
   42  git add --all
   43  git commit -m "Second"
   44  vim first.txt
   45  git commit --amend -a
   46  update-alternatives --config editor
   47  git commit --amend -a
   48  update-alternatives --config editor
   49  sudo update-alternatives --config editor
   50  git commit --amend -a
   51  git log --oneline
   52  git branch
   53  git branch -a
   54  git checkout -b second
   55  git branch -a
   56  git log --oneline
   57  git checkout master
   58  git checkout second
   59  git checkout master
   60  git checkout -D second
   61  git branch  -D second
   62  git branch -a
   63  git checkout -b second
   64  ls
   65  ls -la
   66  date >> second.txt
   67  ls -la
   68  git status
   69  git add --al
   70  git add --all
   71  git commit -m "First commit to second branch"
   72  git log --oneline
   73  git merge master
   74  git checkout master
   75  git merge second
   76  git branch
   77  git log --oneline
   78  git checkout second
   79  vim first.txt
   80  git add --all
   81  git commit -m "Commit in second for conflict"
   82  git log --oneline
   83  git checkout master
   84  git log --oneline
   85  vim first.txt
   86  git add --all
   87  git commit -m "Commit in master for conflict"
   88  git checkout second
   89  git rebase master
   90  vim first.txt
   91  git add first.txt
   92  git rebase --continue
   93  vim first.txt
   94  git checkout master
   95  vim first.txt
   96  git merge second
   97  vim first.txt
   98  git add first.txt
   99  git commit -m "fix in master"
  100  git checkout second
  101  vim first.txt
  102  git rebase mase
  103  git rebase master
  104  git rebase --continue
  105  git rebase --abort
  106  git log --oneline
  107  git checkout master
  108  git log --oneline
  109  git reset HEAD~1
  110  git log --oneline
  111  git checkout second
  112  git log --oneline
  113  git rebase master
  114  vim first.txt
  115  git add --all
  116  git rebase --continue
  117  git status
  118  git rebase --continue
  119  git rebase --skip
  120  git rebase --continue
  121  vim first.txt
  122  git log --oneline
  123  git rebase master
  124  git log --oneline
  125  git checkout b91e621
  126  git log --oneline
  127  git tag -a R1.0 -m "My first release"
  128  git checkout second
  129  git log --oneline
  130  git checkout R1.0
  131  git checkout second
  132  vim first.txt
  133  git add --all
  134  git commit -m "One"
  135  vim first.txt
  136  git add --all
  137  git commit -m "two"
  138  git log --oneline
  139  git rebase -i HEAD~2
  140  git log --oneline
  141  vim first.txt
  142  git rebase -i HEAD~4
  143  git log --oneline
  144  history
```