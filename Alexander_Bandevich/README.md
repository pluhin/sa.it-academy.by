# 02. Git. History
```bash

  16  git init
   17  ls
   18  ls -la
   19  git config --list
   20  touch file.txt
   21  date > file.txt
   22  cat file.txt
   23  git status
   24  git add --all
   25  git status
   26  git commit -m "First commit"
   27  git status
   28  git log --oneline
   29  git log --oneline
   30  git init
   31  git log --oneline
   32  git config --list
   33  git config user.name "Alexander Bandevich"
   34  git config user.email "darkalex.by@gmail.com"
   35  git config --list
   36  touch first.txt | date > first.txt
   37  cat first.txt
   38  wc first.txt
   39  git add --all
   40  git status
   41  git commit -m "first commit"
   42  git log --oneline
   43  mkdir one | chmod 777 one | touch /one/two.txt
   44  ls
   45  cd one
   46  ls
   47  touch two.txt
   48  ls -al
   49  ls -al > two.txt
   50  cat two.txt
   51  cd ..
   52  git add all
   53  git add --all
   54  git commit -m "two commit"
   55  got log --oneline
   56  git log --oneline
   57  git branch
   58  git checkout -b "dev"
   59  git branch
   60  git log --oneline
   61  git status
   62  mkdir dev
   63  chmod 777 dev
   64  git add -all
   65  git add --all
   66  git status
   67  cd dev
   68  touch dev.txt | ls -al > dev.txt
   69  cat dev.txt
   70  cd ..
   71  git add --all
   72  git status
   73  git commit -m "Branch dev first commit"
   74  git satus
   75  git status
   76  git log -oneline
   77  git log -oneline
   78  git log --oneline
   79  cd dev
   80  date >> dev.txt
   81  cat dev.txt
   82  cd ..
   83  git add --all
   84  git commit -m "Branch dev two commit"
   85  git log --oneline
   86  git checkout -b "features/do_one"
   87  git branch
   88  git log --oneline
   89  mkdir features
   90  cd features/
   91  touch tree.txt | date > tree.txt
   92  cat tree.txt
   93  cd..
   94  cd ..
   95  git add --all
   96  git commit -m "First commit from features"
   97  git log --oneline
   98  git checkout master
   99  git status
  100  git log --oneline
  101  git checkout "hotfix/we_gonna_die"
  102  git checkout -b "hotfix/we_gonna_die"
  103  git log --oneline
  104  mkdir hotfix
  105  cd hotfix/
  106  ls ./
  107  ls ./ -la
  108  touch index.html
  109  nano index.html
  110  cd ..
  111  git add --all
  112  git commit -m "Last commin on task(Branch hotfix)"
  113  git status
  114  git log --oneline
  115  git checkout master
  116  git log --oneline
  117  git rebase features/do_one
  118  git log --oneline
  119  git checkout dev
  120  git log --oneline
  121  git checkout features/do_one
  122  git log --oneline
  123  git checkout hotfix/we_gonna_die
  124  git log --oneline
  125  git checkout dev
  126  git rebase features/do_one
  127  git log --oneline
  128  git checkout hotfix/we_gonna_die
  129  git log --oneline
  130  git checkout master
  131  git cherry-pick 180ab07
  132  git log --oneline
  133  git checkout hotfix/we_gonna_die
  134  git log --oneline
  135  git checkout dev
  136  git cherry-pick 180ab07
  137  git checkout features/do_one
  138  git cherry-pick 180ab07
  139  git checkout master
  140  git log --oneline
  141  history
  142  ls
  143  touch 02.GIT.Local.md
  144  history > 02.GIT.Local.md
```



