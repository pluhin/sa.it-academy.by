## Git demo

```bash
  100  cd ../
  101  ls
  102  ls -l .ssh/
  103  ssh-keygen
  104  ls -l .ssh/
  105  vim .ssh/id_rsa.pub
  106  cd 02.Git/
  107  ls
  108  ls -al
  109  git log --oneline
  110  git branch
  111  git checkout master
  112  git log --oneline
  113  git remote add origin git@github.com:pluhin/git_demo.git
  114  git branch -m master main
  115  git branch
  116  git push origin --all
  117  git branch -a
  118  vim first.txt
  119  git add --all
  120  git commit -m "Test upstream"
  121  git push
  122  git push --set-upstream origin main
  123  cd ../
  124  cd /tmp/
  125  git clone git@github.com:igor-golubovich/sa.it-academy.by.git
  126  git remote show
  127  cd sa.it-academy.by/
  128  git remote show
  129  git remote add up git@github.com:pluhin/sa.it-academy.by.git
  130  git remote show
  131  git fetch --all
  132  git checkout md-sa2-20-20
  133  git checkout md-sa2-20-22
  134  git branch
  135  git checkout --track origin/md-sa2-20-22
  136  ls -l
  137  git rebase up/md-sa2-20-22
  138  ls -l
  139  ls -l demo/
  140  git push origin -f
  141  cd ~
  142  cd 02.Git/
  143  ls
  144  git log --oneline
  145  git checkout second
  146  git log --oneline
  147  git cherry-pick 8aec42a
  148  git log --oneline
  149  cat ~/.ssh/id_rsa.pub
  150  git remote rename origin origin_hub
  151  git remote add origin git@bitbucket.org:pluhin/demo_git.git
  152  git push origin --all
  153  git remote rename origin origin_bit
  154  git remote add origin  git@gitlab.com:pluhin/git_demo.git
  155  git push origin --all
  156  history
```