# 03.GitHub

Demo

```bash
  146  cd /vagrant/02.GIT/
  147  la
  148  ls
  149  vim ~/.ssh/
  150  ssh-keygen
  151  cat /home/vagrant/.ssh/id_rsa.pub
  152  git remote add origin git@github.com:pluhin/sa2-23-23-git.git
  153  git push origin --all
  154  history
  155  cd /tmp/
  156  git clone git@github.com:ivankuzminn/sa.it-academy.by.git
  157  cd sa.it-academy.by/
  158  git checkout md-sa2-23-23
  159  ls -la
  160  ls -la demo/
  161  git remote add up git@github.com:pluhin/sa.it-academy.by.git
  162  git fetch up
  163  git rebase up/md-sa2-23-23
  164  ls -l
  165  ls -l demo/
  166  git push origin -f
  167  cd -
  168  cd /vagrant/
  169  cat ~/.ssh/id_rsa.pub
  170  cd 02.GIT/
  171  ld
  172  ls
  173  git remote rename origin origin-github
  174  git remote add origin git@gitlab.com:pluhin/md-sa2-23-23-git.git
  175  git push origin --all
  176  git push origin-github  --all
  177  git push origin-gitlab  --all
  178  git push origin  --all
  179  git remote
  180  history
```