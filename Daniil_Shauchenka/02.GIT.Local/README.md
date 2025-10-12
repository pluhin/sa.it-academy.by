``` bash   
    6  mkdir homework_1
    7  ls
    8  cd homework_1/
   12  git init
   13  date >> file1.txt
   14  ls
   15  cat file1.txt 
   16  rm file1.txt
   17  ls
   18  date >> README.md
   19  cat README.md 
   20  git add README.md 
   21  git status
   22  git commit -m "created readme.md"
   23  git config --global user.email "daniil.shauchenka@gmail.com"
   24  git config --global user.name "Daniil Shauchenka"
   25  git commit -m "created readme.md"
   26  git checkout -b "feature-branch"
   27  nano README.md 
   28  cat README.md 
   29  git status
   30  git add .
   31  git commit -m "made some changes to a readme file"
   32  git checkout master
   33  git checkout feature-branch 
   34  git checkout master
   35  git merge
   36  git merge feature-branch 
   37* git   log 
   38  git log --oneline
   39  git log --no-decorate
   40  git log --decorate=full
   41  git log --decorate=short
   42  git log --log-size
   43  git log --full-diff
   44  git log --max-count=1
   45  git log --max-count=2
   46  git log --oneline
   47  git show 1426764
   48  git tag -a v1.0 -m "my very first tag"
   49  git tag -l
   50  git show v1.0
   51  git status
   52  nano README.md 
   53  cat README.md 
   54  git status
   55  git add .
   56  git commit -m "added some changes to readme after creating a v1.0 tag"
   57  git log --pretty=oneline
   58  git tag -a v2.0 -m "new tag"
   59  git log --pretty=oneline
   60  git compare
   61  git tag  v2.1-lw
   62  git log
   63  git show v2.1-lw
   64  git checkout -b bugfix
   65  nano README.md 
   66  cat README.md 
   67  git status
   68  git add .
   69  git commit -m "made some bugs"
   70  git status
   71  git log
   72  echo "something wrong" >> README.md 
   73  cat README.md 
   74  git add .
   75  git commit "added new line"
   76  git log --oneline
   77  git commit -m "added new line"
   78  git log --oneline
   79  echo "something wrong 2" >> README.md 
   80  git add .
   81  git commit -m "added new line 2"
   82  git log
   83  git reset --soft HEAD~1
   84  log log --oneline
   85  git log --oneline
   86  git status
   87  git reset --mixed HEAD~1
   88  git log --oneline
   89  git staTUS
   90  git status
   91  cat README.md 
   92  git reset --hard HEAD~1
   93  git log
   94  git status
   95  git diff
   96  git diff --cached
   97  echo "text 1" >> file1.txt
   98  git status
   99  git add .
  100  git commit
  101  git commit -m "file1.txt
"
  102  git log
  103  echo "text 2" >> file1.txt
  104  git add .
  105  git commit -m "file1.txt"
  106  echo "text 3" >> file1.txt
  107  git add .
  108  git commit -m "file1.txt"
  109  git log --oneline
  110  git reflog
  111  git reset --soft HEAD~1
  112  git log --oneline
  113  git status
  114  echo "text2" >> file2.txt
  115  echo "text3" >> file3.txt
  116  git status
  117  git add .
  118  git commit -m "added file2"
  119  git log --oneline
  120  ls
  121  git reset --mixed HEAD~2
  122  git status
  123  git reset --hard
  124  git reflog
  125  git reset --hard ac8bc52
  126  ls
  127  git log
  128  git checkout master
  129  git log --oneline
  130  git checkout -b experimental-feature
  131  echo "this text will be stashed" >> README.md 
  132  cat README.md 
  133  git status
  134  git stash
  135  git stash --help
  136  git stash list
  137  git status
  138  git checkout -b another-branch
  139  echo "im in another branch" >> README.md 
  140  cat README.md 
  141  git stash apply
  142  git status
  143  git add .
  144  git stash apply
  145  nano README.md 
  146  cat README.md 
  147  git add .
  148  git status
  149  git commit -m "resolved conflict on stashing"
  150  git diff
  151  git diff --staged
  152  git merge --abort
  153  git config --global alias.st "git status"
  154  git st
  155  git config --global alias.st "status"
  156  git st
  157  git config --global alias.last "log -1 HEAD"
  158  git last
  159  git config --global alias.hist "log --pretty-fromat: '%h %ad | %s%s [%an]' --graph --date=short"
  160  git hist
  161  git config --global alias.hist "log --pretty-format: '%h %ad | %s%s [%an]' --graph --date=short"
  162  git hist
  168  git config --global --get-regexp alias
  169  history > 02.GIT.Local.md
  170  nano 02.GIT.Local.md 
  171  git add .
  172  nano 02.GIT.Local.md 
  173  git status
  174  git checkout master
  175  git status
  176  git add .
  177  git commit -m "added .md"
  178  ssh-keygen
  179  cat /home/lancaster/.ssh/id_ed25519.pub
  180  cd /mnt
  181  ls
  182  cd hgfs/shared/
  183  ls
  184  cp ~/.ssh/id_ed25519.pub 
  185  cp ~/.ssh/id_ed25519.pub  /mnt/hgfs/shared
  186  cd ~/homework_1/
  187  ls
  188  git status
  189  mkdir 02.GIT.Local
  190  mv 
  191  cat README.md 
  192  git remote add github
  193  git add remote github
  194  ls
  195  cat 02.GIT.Local.md > README.md 
  196  cat README.md 
  197  mv README.md  02.GIT.Local/
  198  ls
  199  git status
  200  rm 02.GIT.Local.md
  201  ls
  202  cd 02.GIT.Local/
  203  ls
  204  cat README.md 
  205  history
  206  nano history
  207  history
  208  history > README.md 
```
