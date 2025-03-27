## GitHub

```bash
109  cd 02.Git/
  110  ls
  111  git remote add origin git@github.com:pluhin/md-sa2-31-25.git
  112  git push -u origin --all
  113  ssh-keygen
  114  cat ~/.ssh/id_rsa.pub
  115  git push -u origin --all
  116  cd /tmp/
  117  git clone git@github.com:zayatsvasiliy/sa.it-academy.by.git
  118  git remote rename origin origin-github
  119  cd -
  120  git remote rename origin origin-github
  121  git remote add origin git@gitlab.com:pluhin/md-sa2-31-25.git
  122  git push -u origin --all
  123  history
  124  cd 02.Git/
  125  ls
  126  git remote rename origin origin-gitlab
  127  git pull
  128  git branch -a
  129  git checkout master
  130  git push
  131  mkdir -p .github/workflows
  132  cd .github/workflows/
  133  cd -
  134  vim .github/workflows/1.yaml
  135  git add --all
  136  git commit -m "Add first github action"
  137  git push
  138  vim .git/config
  139  git remote rename origin-github origin
  140  git push
  141  git push --set-upstream origin --all
  142  git push --set-upstream origin --all -f
  143  vim .github/workflows/1.yaml
  144  vim .github/workflows/2.yaml
  145  git add --all
  146  git commit -m "Add matrix run"
  147  git puhs
  148  git push
  149  vim .github/workflows/2.yaml
  150  git commit --amend -a
  151  git push origin -f
  152  vim .github/workflows/2.yaml
  153  git commit --amend -a
  154  git push origin -f
  155  vim .github/workflows/2.yaml
  156  git commit --amend -a
  157  git push origin -f
  158  vim .github/workflows/2.yaml
  159  git commit --amend -a
  160  vim .github/workflows/2.yaml
  161  git push origin -f
  162  vim .github/workflows/3.yaml
  163  git add --all
  164  git commit -m "Add workflow dispatch"
  165  git push
  166  vim init_runner.sh
  167  chmod +x init_runner.sh
  168  ./init_runner.sh
  169  vim .github/workflows/3.yaml
  170  git add --all
  171  ls -l
  172  vim .gitignore
  173  git add --all
  174  git status
  175  git commit -m "Switch to self-hosted runner"
  176  git push
  177  ls -l /tmp/
  178  sudo ps aux | grep init_runner.sh
  179  sudo ps aux | grep dpkg
  180  sudo ps aux | grep apt
  181  kill -9 59620
  182  sudo kill -9 59620
  183  sudo kill -9 59628
  184  sudo ps aux | grep apt
  185  vim .github/workflows/4.yaml
  186  sudo ps aux | grep apt
  187  vim .github/workflows/4.yaml
  188  git add --all
  189  git commit -m "Add secret"
  190  git push origin -f
  191  history
```