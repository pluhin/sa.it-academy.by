## 03.Git Remote

```bash
  105  cd  02.Git/
  106  ls
  107  ssh-keygen
  108  cat ~/.ssh/id_rsa.pub
  109  git remote add origin git@github.com:pluhin/sa2-28-24.git
  110  cat .git/config
  111  git push -u origin --all
  112  cd /tmp/
  113  c
  114  git clone git@github.com:DimaSerikov/sa.it-academy.by.git
  115  cd sa.it-academy.by
  116  git branch -a
  117  git checkout md-sa2-28-24
  118  ls -l demo/
  119  git remote add up git@github.com:pluhin/sa.it-academy.by.git
  120  git fetch up
  121  git rebase up/md-sa2-28-24
  122  ls -l demo/
## Need to execute this to finish rebase
git push origin -f
  124  cd ~
  125  cat .ssh/id_rsa.pub
  126  cd 02.Git/
  127  git remote rename origin origin-github
  128  git remote add origin git@gitlab.com:pluhin/sa-28-24.git
  129  cat .git/config
  130  git push --set-upstream origin --all
  131  history
```